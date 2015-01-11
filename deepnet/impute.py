"""Computes partition function for RBM-like models using Annealed Importance Sampling."""
import numpy as np
from deepnet import dbm
from deepnet import util
from deepnet import trainer as tr
from choose_matrix_library import *
import sys
import numpy as np
import pdb
import time
import itertools
import matplotlib.pyplot as plt
from deepnet import visualize
import deepnet


def LogMeanExp(x):
    offset = x.max()
    return offset + np.log(np.exp(x-offset).mean())

def LogSumExp(x):
    offset = x.max()
    return offset + np.log(np.exp(x-offset).sum())

def Display(w, hid_state, input_state, w_var=None, x_axis=None):
    w = w.asarray().flatten()
    plt.figure(1)
    plt.clf()
    plt.hist(w, 100)
    visualize.display_hidden(hid_state.asarray(), 2, 'activations', prob=True)
    # plt.figure(3)
    # plt.clf()
    # plt.imshow(hid_state.asarray().T, cmap=plt.cm.gray, interpolation='nearest')
    # plt.figure(4)
    # plt.clf()
    # plt.imshow(input_state.asarray().T, cmap=plt.cm.gray, interpolation='nearest')
    #, state.shape[0], state.shape[1], state.shape[0], 3, title='Markov chains')
    # plt.tight_layout(pad=0, w_pad=0, h_pad=0)
    # plt.figure(5)
    # plt.clf()
    # plt.suptitle('Variance')
    # plt.plot(np.array(x_axis), np.array(w_var))
    # plt.draw()

def impute_dbm_ais(model):
    """Run approximate pll using AIS on a DBM """


def impute_rbm_exact(model):
    """ run exact exact pll and imputation error on an rbm """

    batchsize = model.batchsize
    input_layer = model.GetLayerByName('input_layer') 

    hidden_layers = []
    for layer in model.layer:
        if not layer.is_input:
            hidden_layers.append(layer)

    dimensions = input_layer.dimensions 
    numlabels = input_layer.numlabels 
    data = input_layer.data

    # set up temp data structures
    for layer in model.layer:
        layer.foo = layer.statesize
        layer.bar = layer.deriv

    input_layer.fooslice = cm.CUDAMatrix(np.zeros([input_layer.numlabels,\
            batchsize]))
    input_layer.barslice = cm.CUDAMatrix(np.zeros([1, batchsize]))
    pll = cm.CUDAMatrix(np.zeros([1, batchsize]))
    imputation_err = cm.CUDAMatrix(np.zeros([1, batchsize]))
    
    input_layer.biasslice = cm.CUDAMatrix(np.zeros([input_layer.numlabels,\
            batchsize]))
    input_layer.biasslice.apply_softmax()

    b = input_layer.params['bias']
    input_layer.bar.add_col_vec(b)
    input_layer.bar.reshape((numlabels, dimensions * batchsize))
    input_layer.bar.apply_softmax()
    input_layer.bar.reshape((numlabels *  dimensions, batchsize))

    # INITIALIZE TO UNIFORM RANDOM for all layers except clamped layers
    for layer in model.layer:
        layer.state.assign(0)
        layer.ApplyActivation()


    def reshape_softmax(enter=True):
        if enter:
            input_layer.state.reshape((numlabels, dimensions * batchsize))    
            input_layer.foo.reshape((numlabels, dimensions * batchsize))
            data.reshape((1, dimensions * batchsize))
            input_layer.batchsize_temp.reshape((1, dimensions * batchsize))
        else:
            input_layer.state.reshape((numlabels * dimensions, batchsize))
            input_layer.foo.reshape((numlabels * dimensions, batchsize))
            data.reshape((dimensions, batchsize))
            input_layer.batchsize_temp.reshape((dimensions, batchsize))

    # RUN Imputation Error
    for dim_idx in range(dimensions):

        #-------------------------------------------
        # Set state of input variables
        input_layer.GetData()
        offset = dim_idx * numlabels
#        input_layer.state.set_row_slice(offset, offset + numlabels, \
#                input_layer.biasslice)
        input_layer.bar.get_row_slice(offset, offset + numlabels , \
                target=input_layer.fooslice)
        input_layer.state.set_row_slice(offset, offset + numlabels, \
                input_layer.fooslice)

        for layer in model.layer:
            if not layer.is_input:
                layer.state.assign(0)

        # Run MF steps
        for mf_idx in range(mf_steps):
            for hid_mf_idx in range(hidden_mf_steps):
                for layer in hidden_layers:
                    model.ComputeUp(layer, train=False, compute_input=False, step=0,
                        maxsteps=0, use_samples=False, neg_phase=False)
            model.ComputeUp(input_layer, train=False, compute_input=True, step=0,
                    maxsteps=0, use_samples=False, neg_phase=False)

            input_layer.state.get_row_slice(offset, offset + numlabels , \
                target=input_layer.fooslice)

            input_layer.GetData()
            input_layer.state.set_row_slice(offset, offset + numlabels , \
                input_layer.fooslice)

        # Calculate pll
        reshape_softmax(enter=True)
        input_layer.state.get_softmax_cross_entropy(data,\
                target=input_layer.batchsize_temp, tiny=input_layer.tiny)
        reshape_softmax(enter=False)

        input_layer.batchsize_temp.get_row_slice(dim_idx, dim_idx + 1 , \
                target=input_layer.barslice)
        pll.add_sums(input_layer.barslice, axis=0)
        
        # Calculate imputation error
        reshape_softmax(enter=True)
        input_layer.state.get_softmax_correct(data, target=input_layer.batchsize_temp)
        reshape_softmax(enter=False)

        input_layer.batchsize_temp.get_row_slice(dim_idx, dim_idx + 1 , \
                target=input_layer.barslice)
        imputation_err.add_sums(input_layer.barslice, axis=0, mult=-1.)
        imputation_err.add(1.)

    #--------------------------------------
    # free device memory for newly created arrays
    pll_cpu = pll.asarray()
    imperr_cpu = imputation_err.asarray()
    imperr_cpu /= (dimensions+0.)

    input_layer.fooslice.free_device_memory()
    input_layer.biasslice.free_device_memory()
    input_layer.barslice.free_device_memory()
    pll.free_device_memory()
    imputation_err.free_device_memory()

    return pll_cpu, imperr_cpu


def impute_mf(model, mf_steps, hidden_mf_steps):
    # Initialize stuff
    batchsize = model.batchsize
    input_layer = model.GetLayerByName('input_layer') 

    hidden_layers = []
    for layer in model.layer:
        if not layer.is_input:
            hidden_layers.append(layer)

    dimensions = input_layer.dimensions 
    numlabels = input_layer.numlabels 
    data = input_layer.data

    # set up temp data structures
    for layer in model.layer:
        layer.foo = layer.statesize

    input_layer.fooslice = cm.CUDAMatrix(np.zeros([input_layer.numlabels,\
            batchsize]))
    input_layer.barslice = cm.CUDAMatrix(np.zeros([1, batchsize]))
    pll = cm.CUDAMatrix(np.zeros([1, batchsize]))
    imputation_err = cm.CUDAMatrix(np.zeros([1, batchsize]))
    
    input_layer.biasslice = cm.CUDAMatrix(np.zeros([input_layer.numlabels,\
            batchsize]))
    input_layer.biasslice.apply_softmax()

    # INITIALIZE TO UNIFORM RANDOM for all layers except clamped layers
    for layer in model.layer:
        layer.state.assign(0)
        layer.ApplyActivation()

    def reshape_softmax(enter=True):
        if enter:
            input_layer.state.reshape((numlabels, dimensions * batchsize))    
            input_layer.foo.reshape((numlabels, dimensions * batchsize))
            data.reshape((1, dimensions * batchsize))
            input_layer.batchsize_temp.reshape((1, dimensions * batchsize))
        else:
            input_layer.state.reshape((numlabels * dimensions, batchsize))
            input_layer.foo.reshape((numlabels * dimensions, batchsize))
            data.reshape((dimensions, batchsize))
            input_layer.batchsize_temp.reshape((dimensions, batchsize))

    # RUN Imputation Error
    for dim_idx in range(dimensions):

        #-------------------------------------------
        # Set state of input variables
        input_layer.GetData()
        offset = dim_idx * numlabels
        input_layer.state.set_row_slice(offset, offset + numlabels, \
                input_layer.biasslice)

        for layer in model.layer:
            if not layer.is_input:
                layer.state.assign(0)

        # Run MF steps
        for mf_idx in range(mf_steps):
            for hid_mf_idx in range(hidden_mf_steps):
                for layer in hidden_layers:
                    model.ComputeUp(layer, train=False, compute_input=False, step=0,
                        maxsteps=0, use_samples=False, neg_phase=False)
            model.ComputeUp(input_layer, train=False, compute_input=True, step=0,
                    maxsteps=0, use_samples=False, neg_phase=False)

            input_layer.state.get_row_slice(offset, offset + numlabels , \
                target=input_layer.fooslice)

            input_layer.GetData()
            input_layer.state.set_row_slice(offset, offset + numlabels , \
                input_layer.fooslice)

        # Calculate pll
        reshape_softmax(enter=True)
        input_layer.state.get_softmax_cross_entropy(data,\
                target=input_layer.batchsize_temp, tiny=input_layer.tiny)
        reshape_softmax(enter=False)

        input_layer.batchsize_temp.get_row_slice(dim_idx, dim_idx + 1 , \
                target=input_layer.barslice)
        pll.add_sums(input_layer.barslice, axis=0)
        
        # Calculate imputation error
        reshape_softmax(enter=True)
        input_layer.state.get_softmax_correct(data, target=input_layer.batchsize_temp)
        reshape_softmax(enter=False)

        input_layer.batchsize_temp.get_row_slice(dim_idx, dim_idx + 1 , \
                target=input_layer.barslice)
        imputation_err.add_sums(input_layer.barslice, axis=0, mult=-1.)
        imputation_err.add(1.)

    #--------------------------------------
    # free device memory for newly created arrays
    pll_cpu = pll.asarray()
    imperr_cpu = imputation_err.asarray()
    imperr_cpu /= (dimensions+0.)

    input_layer.fooslice.free_device_memory()
    input_layer.biasslice.free_device_memory()
    input_layer.barslice.free_device_memory()
    pll.free_device_memory()
    imputation_err.free_device_memory()

    return pll_cpu, imperr_cpu


def Usage():
    print '%s <model file> <number of Markov chains to run> [number of words (for Replicated Softmax models)]'

if __name__ == '__main__':

    from argparse import ArgumentParser
    parser = ArgumentParser(description="Run AIS")
    parser.add_argument("--model_file", type=str)
    parser.add_argument("--train_file", type=str)
    parser.add_argument("--infer", type=str, default='mf', help='mf/gibbs')
    parser.add_argument("--mf-steps", type=int, default=2)
    parser.add_argument("--hidden-mf-steps", type=int, default=2)
    parser.add_argument("--outf", type=str, help='Output File')
    args = parser.parse_args()

    if not args.outf : 
        raise ValueError('Output file not defined')

    if not args.train_file or not args.model_file : 
        raise ValueError('Models and data missing')

    board = tr.LockGPU()
    model_file = args.model_file
    train_file = args.train_file
    model = dbm.DBM(model_file, train_file)

    # Fix paths
    dirname = os.path.split(model.t_op.data_proto_prefix)[1]
    model.t_op.data_proto_prefix = os.path.join('/storage/data1/dbm/deepnet/deepnet/datasets/',\
            dirname)
    model.t_op.skip_last_piece = False
    model.t_op.get_last_piece = True
    model.t_op.randomize = False

    model.LoadModelOnGPU()
    model.SetUpData()

    datagetters = {
            'train' : model.GetTrainBatch,
            'valid' : model.GetValidationBatch,
            'test' : model.GetTestBatch
            }

    batchsizes = {
            'train' : model.train_data_handler.num_batches,
            'valid' : model.validation_data_handler.num_batches,
            'test' : model.test_data_handler.num_batches
            }

    cm.CUDAMatrix.init_random(seed=int(time.time()))

    from collections import defaultdict    
    pll_data = defaultdict(list)
    imperr_data = defaultdict(list)
    for data_type in ['train', 'valid', 'test']:
        num_batches = batchsizes[data_type]
        datagetter = datagetters[data_type]
        for batch_idx in range(num_batches):
            print("Evalutating batch {}".format(batch_idx+1))
            datagetter()

            pll, imperr = impute_mf(model, args.mf_steps, args.hidden_mf_steps)
            pll, imperr = pll.flatten(), imperr.flatten()
            pll_data[data_type].append(pll)
            imperr_data[data_type].append(imperr)

        pll_data[data_type] = np.concatenate(pll_data[data_type])
        imperr_data[data_type] = np.concatenate(imperr_data[data_type])

    #-------------------------------------------------------------------
    # Print and save the results 
    for dtype in pll_data :
        pll = pll_data[dtype]
        imperr = imperr_data[dtype]
        print '%s : Pseudo-LogLikelihood %.5f, std %.5f' % (dtype, pll.mean(), pll.std())
        print '%s : Imputation Error %.5f, std %.5f' % (dtype, imperr.mean(), imperr.std())

    tr.FreeGPU(board)

    import pickle
    with open(args.outf,'wb') as fout:
        pkldata = { 'pll' : pll_data, 'imperr' : imperr }
        pickle.dump(pkldata, fout)

    # ---  BREAKPOINT --- 
    import ipdb; ipdb.set_trace()


