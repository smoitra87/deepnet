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

def AIS_DBM(model, schedule, clamp_input):
    # Initialize stuff
    steps = len(schedule)
    batchsize = model.batchsize
    w_ais = cm.CUDAMatrix(np.zeros((1, batchsize)))

    input_layer = model.GetLayerByName('input_layer') 
    h1_layer = model.GetLayerByName('hidden1') or \
            model.GetLayerByName('bernoulli_hidden1') 
    h2_layer = model.GetLayerByName('hidden2') 
    ssrbm_layer = model.GetLayerByName('bernoulli2_hidden1')

    # set up temp data structures
    for layer in model.layer:
        layer.temp = layer.statesize

    # allocate temp DS for softmax layer
    input_layer.sum_energy1 = cm.CUDAMatrix(np.zeros((1, \
            input_layer.dimensions * input_layer.batchsize)))
    input_layer.sum_energy2 = cm.CUDAMatrix(np.zeros((1, \
            input_layer.dimensions * input_layer.batchsize)))

    # INITIALIZE TO UNIFORM RANDOM for all layers except clamped layers
    for layer in model.layer:
        if layer.is_input and clamp_input:
            layer.GetData()
            layer.sample.assign(layer.state)
        else:
            layer.state.assign(0)
            layer.ApplyActivation()
            layer.Sample()


    even_layers= [input_layer] 
    odd_layers = [h1_layer]

    if h2_layer : even_layers.append(h2_layer)
    if ssrbm_layer : even_layers.append(ssrbm_layer)

    # RUN AIS.
    for step_idx in range(1, steps):
        sys.stdout.write('\rStep %d ' % step_idx)
        sys.stdout.flush()

        # Calculate the energies of the input layer
        for layer in even_layers:
            layer.state.assign(0)

            for i, edge in enumerate(layer.incoming_edge):
                neighbour = layer.incoming_neighbour[i]
                inputs = neighbour.sample
                if edge.node2 == layer:
                    w = edge.params['weight'].T
                    factor = edge.proto.up_factor
                else:
                    w = edge.params['weight']
                    factor = edge.proto.down_factor

                layer.state.add_dot(w, inputs, mult=factor)
            b = layer.params['bias']
            layer.state.add_col_vec(b)

            if layer.__class__ is deepnet.softmax_layer.SoftmaxLayer:

                if clamp_input:
                    layer.state.mult(layer.sample)
                    w_ais.add_sums(layer.state, axis=0, mult=schedule[\
                               step_idx] - schedule[step_idx-1])
                else:
                    # Set some shapes and variables
                    
                    numlabels = layer.numlabels
                    dimensions = layer.dimensions
                    batchsize = layer.batchsize
                    layer.sum_energy2.reshape((1, dimensions * batchsize))

                    # Multiply the energies by the temperature
                    layer.state.mult(schedule[step_idx-1], target=layer.temp)
                    layer.state.mult(schedule[step_idx])

                    # Get the sum of all the energies
                    layer.temp.reshape((numlabels, dimensions * batchsize))
                    layer.state.reshape((numlabels, dimensions * batchsize))

                    cm.exp(layer.state)
                    cm.exp(layer.temp)

                    layer.temp.sum(axis=0, target=layer.sum_energy1)
                    layer.state.sum(axis=0, target=layer.sum_energy2)
                    cm.log(layer.sum_energy1)
                    cm.log(layer.sum_energy2)
                  
                    # Subtract the energies
                    layer.sum_energy2.subtract(layer.sum_energy1)

                    # Restore the shapes of the matrices
                    layer.sum_energy2.reshape((dimensions, batchsize))
                    layer.temp.reshape((numlabels * dimensions, batchsize))
                    layer.state.reshape((numlabels * dimensions, batchsize))

                    # Add the contributions to w_ais
                    w_ais.add_sums(layer.sum_energy2, axis=0)

            # Do the log(1+exp) operation if logistic
            if layer.__class__ is deepnet.logistic_layer.LogisticLayer:
                layer.state.mult(schedule[step_idx-1], target=layer.temp)
                layer.state.mult(schedule[step_idx])
                cm.log_1_plus_exp(layer.state, target=layer.deriv)
                cm.log_1_plus_exp(layer.temp)
                layer.deriv.subtract(layer.temp)
                w_ais.add_sums(layer.deriv, axis=0)

        # Calculate the energies of the odd layers
        for layer in odd_layers:
            layer.state.assign(0)
            b = layer.params['bias']
            layer.state.add_col_vec(b)

            layer.state.mult(layer.sample)
            w_ais.add_sums(layer.state, axis=0, mult=schedule[
                               step_idx] - schedule[step_idx-1])

        #-----------------------------------------
        # Update the state with temperature and sample from it
        for layer in model.layer:
            if layer.is_input and clamp_input:
                continue
            for i, edge in enumerate(layer.incoming_edge):
                neighbour = layer.incoming_neighbour[i]
                inputs = neighbour.sample
                if edge.node2 == layer:
                    w = edge.params['weight'].T
                    factor = edge.proto.up_factor
                else:
                    w = edge.params['weight']
                    factor = edge.proto.down_factor
                    if factor != 1:
                        layer.state.mult(factor)
                if i == 0:
                    cm.dot(w, inputs, target=layer.state)
                else:
                    layer.state.add_dot(w, inputs, mult=factor)

            b = layer.params['bias']
            layer.state.add_col_vec(b)
            layer.state.mult(schedule[step_idx])
            layer.ApplyActivation()
            layer.Sample()

    return w_ais.asarray()


def AIS_Gaussian_RBM(model, schedule, clamp_input=False):
    # Initialize stuff
    steps = len(schedule)
    batchsize = model.batchsize
    w_ais = cm.CUDAMatrix(np.zeros((1, batchsize)))

    input_layer = model.GetLayerByName('input_layer') 
    bernoulli_layer = model.GetLayerByName('bernoulli_hidden1') 
    bernoulli_layer2 = model.GetLayerByName('bernoulli2_hidden1') 
    gaussian_layer = model.GetLayerByName('gaussian_hidden1') 

    for edge in model.edge:
        if edge.node1.name != 'input_layer': 
            raise ValueError('Not an RBM')

    # set up temp data structures
    for layer in model.layer:
        layer.temp = layer.statesize

    # allocate temp DS for softmax layer
    input_layer.sum_energy1 = cm.CUDAMatrix(np.zeros((1, \
            input_layer.dimensions * input_layer.batchsize)))
    input_layer.sum_energy2 = cm.CUDAMatrix(np.zeros((1, \
            input_layer.dimensions * input_layer.batchsize)))

    batchslice2 = cm.CUDAMatrix(np.zeros([1, batchsize]))
    datasize_squared = cm.CUDAMatrix(np.zeros([batchsize, batchsize]))
    datasize_eye = cm.CUDAMatrix(np.eye(batchsize))
    datasize_eye2 = cm.CUDAMatrix(np.eye(batchsize))
    if gaussian_layer:
        gedge = next(e for e in model.edge if e.node1.name == 'input_layer' \
                and e.node2.name == 'gaussian_hidden1')
        gw = gedge.params['weight']
        input_diag = input_layer.params['diag']
        diag_val = input_diag.sum() / (input_layer.dimensions  * input_layer.numlabels)

    # INITIALIZE TO UNIFORM RANDOM for all layers except clamped layers
    for layer in model.layer:
        if layer.is_input and clamp_input:
            layer.GetData()
            layer.sample.assign(layer.state)
        else:
            layer.state.assign(0)
            layer.ApplyActivation()
            layer.Sample()

    sampling_layers = [input_layer]

    if bernoulli_layer:
        sampling_layers.append(bernoulli_layer)


    if bernoulli_layer2:
        sampling_layers.append(bernoulli_layer2)

    # RUN AIS.
    for step_idx in range(1, steps):
        sys.stdout.write('\rStep %d ' % step_idx)
        sys.stdout.flush()

        # Calculate the energies of the input layer
        for layer in sampling_layers:
            layer.state.assign(0)

            for i, edge in enumerate(layer.incoming_edge):
                neighbour = layer.incoming_neighbour[i]
                inputs = neighbour.sample
                if edge.node2 == layer:
                    w = edge.params['weight'].T
                    factor = edge.proto.up_factor
                else:
                    w = edge.params['weight']
                    factor = edge.proto.down_factor

                layer.state.add_dot(w, inputs, mult=factor)

            if 'bias' in layer.params:
                b = layer.params['bias']
                layer.state.add_col_vec(b)

            if layer is input_layer:

                if clamp_input:
                    layer.state.mult(layer.sample)
                    w_ais.add_sums(layer.state, axis=0, mult=schedule[\
                               step_idx] - schedule[step_idx-1])
                else:
                    # Set some shapes and variables
                    
                    numlabels = layer.numlabels
                    dimensions = layer.dimensions
                    batchsize = layer.batchsize
                    layer.sum_energy2.reshape((1, dimensions * batchsize))

                    # Multiply the energies by the temperature
                    layer.state.mult(schedule[step_idx-1], target=layer.temp)
                    layer.state.mult(schedule[step_idx])

                    # Get the sum of all the energies
                    layer.temp.reshape((numlabels, dimensions * batchsize))
                    layer.state.reshape((numlabels, dimensions * batchsize))

                    cm.exp(layer.state)
                    cm.exp(layer.temp)

                    layer.temp.sum(axis=0, target=layer.sum_energy1)
                    layer.state.sum(axis=0, target=layer.sum_energy2)
                    cm.log(layer.sum_energy1)
                    cm.log(layer.sum_energy2)
                  
                    # Subtract the energies
                    layer.sum_energy2.subtract(layer.sum_energy1)

                    # Restore the shapes of the matrices
                    layer.sum_energy2.reshape((dimensions, batchsize))
                    layer.temp.reshape((numlabels * dimensions, batchsize))
                    layer.state.reshape((numlabels * dimensions, batchsize))

                    # Add the contributions to w_ais
                    w_ais.add_sums(layer.sum_energy2, axis=0)

                if gaussian_layer:
                    # Add contributions from gaussian hidden layer
                    cm.dot(gw.T, input_layer.sample, target=gaussian_layer.state)
                    cm.dot(gaussian_layer.state.T, gaussian_layer.state, target= datasize_squared)
                    datasize_squared.mult(datasize_eye, target=datasize_eye2)
                    datasize_eye2.sum(axis=0, target=batchslice2)

                    # Add constants from gaussian hidden layer
                    integration_constant = gaussian_layer.dimensions * np.log(2*np.pi)
                    integration_constant += input_layer.dimensions * diag_val 
                    batchslice2.add(integration_constant)
                    w_ais.add_row_mult(batchslice2, \
                            0.5 * (schedule[step_idx] - schedule[step_idx-1]))


            # Do the log(1+exp) operation if logistic
            if layer is bernoulli_layer or layer is bernoulli_layer2 :
                layer.state.mult(schedule[step_idx-1], target=layer.temp)
                layer.state.mult(schedule[step_idx])
                cm.log_1_plus_exp(layer.state, target=layer.deriv)
                cm.log_1_plus_exp(layer.temp)
                layer.deriv.subtract(layer.temp)
                w_ais.add_sums(layer.deriv, axis=0)

        #-----------------------------------------
        # Update the state with temperature and sample from it
        for layer in model.layer:
            if layer.is_input and clamp_input:
                continue
            for i, edge in enumerate(layer.incoming_edge):
                neighbour = layer.incoming_neighbour[i]
                inputs = neighbour.sample
                if edge.node2 == layer:
                    w = edge.params['weight'].T
                    factor = edge.proto.up_factor
                else:
                    w = edge.params['weight']
                    factor = edge.proto.down_factor
                    if factor != 1:
                        layer.state.mult(factor)
                if i == 0:
                    cm.dot(w, inputs, target=layer.state)
                else:
                    layer.state.add_dot(w, inputs, mult=factor)

            if 'bias' in layer.params:
                b = layer.params['bias']
                layer.state.add_col_vec(b)
            layer.state.mult(schedule[step_idx])
            layer.ApplyActivation()
            layer.Sample()

    return w_ais.asarray()

def Usage():
    print '%s <model file> <number of Markov chains to run> [number of words (for Replicated Softmax models)]'

if __name__ == '__main__':

    from argparse import ArgumentParser
    parser = ArgumentParser(description="Run AIS")
    parser.add_argument("model_file", type=str)
    parser.add_argument("--train_file", type=str)
    parser.add_argument("--clamp", action='store_true')
    parser.add_argument("--numchains", type=int, default=1)
    parser.add_argument("--numchains_unclamped", type=int, default=1000)
    parser.add_argument("--schedule", type=str, default='quick', help='Select Schedule')
    parser.add_argument("--outf", type=str, help='Output File')
    parser.add_argument("--is_ssrbm", action='store_true', help='ssrbm')
    args = parser.parse_args()

    if not args.outf : 
        raise ValueError('Output file not defined')

    board = tr.LockGPU()
    model_file = args.model_file
    train_file = args.train_file
    numchains = args.numchains
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

    schedules = {
        'very-quick': np.arange(0.0, 1.0, 0.01),
        'quick' : np.arange(0.0, 1.0, 0.001), 
        'slow' : np.concatenate((
                              np.arange(0.0, 0.7, 0.001),  # 700
                              np.arange(0.7, 0.9, 0.0001),  # 2000
                              np.arange(0.9, 1.0, 0.00002)))  # 5000
            }
    schedule  = schedules[args.schedule]

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


    #------------------------------------------------------------------------
    # log_z for model conditioned on datapoints

    base_logz = 0.0
    for layer in model.layer:
        if layer.is_input:
            continue
        if layer.__class__ is deepnet.logistic_layer.LogisticLayer:
            base_logz += layer.dimensions * np.log(2)
        if layer.__class__ is deepnet.linear_layer.LinearLayer:
            base_logz += layer.dimensions * np.log(2 * np.pi) * 0.5
        else:
            base_logz += layer.dimensions * np.log(layer.numlabels)

    from collections import defaultdict    
    logz_data = defaultdict(list)
    for data_type in ['train', 'valid', 'test']:
        num_batches = batchsizes[data_type]
        datagetter = datagetters[data_type]
        for batch_idx in range(num_batches):
            datagetter()
            if args.numchains > 1:
                datalist = []
                for layer in model.input_datalayer:
                    datalist.append(layer.data.asarray())
                model.ResetBatchsize(model.batchsize * args.numchains)

                for layer, cpudata in zip(model.input_datalayer,datalist):
                    nFeats, nInstances = cpudata.shape
                    cpudata = np.tile(cpudata,(1, args.numchains))
                    layer.data = cm.CUDAMatrix(cpudata)

            if args.is_ssrbm:
                chains = AIS_Gaussian_RBM(model, schedule, clamp_input=True)
            else:
                chains = AIS_DBM(model, schedule, clamp_input=True)
            chains = chains.flatten()
            num_replicated_chains  = len(chains)
            batchsize = num_replicated_chains / args.numchains
            w_ais  = np.zeros(batchsize)
            for idx in range(batchsize):
                w_ais[idx] = np.mean(chains[idx::batchsize])
            logz_data[data_type].append(w_ais)

        logz_data[data_type] = np.concatenate(logz_data[data_type])
        logz_data[data_type] += base_logz

   
    #----------------------------------------------------------------------
    # log_z for unclamped model
    model.ResetBatchsize(args.numchains_unclamped)
    if args.is_ssrbm:
        chains = AIS_Gaussian_RBM(model, schedule, clamp_input=False)
    else:
        chains = AIS_DBM(model, schedule, clamp_input=False)
    model_logz = chains.flatten()
        
    base_logz = 0.0
    for layer in model.layer:
        if layer.__class__ is deepnet.logistic_layer.LogisticLayer:
            base_logz += layer.dimensions * np.log(2)
        if layer.__class__ is deepnet.linear_layer.LinearLayer:
            base_logz += layer.dimensions * np.log(2 * np.pi) * 0.5
        else:
            base_logz += layer.dimensions * np.log(layer.numlabels)
    model_logz += base_logz

    #-------------------------------------------------------------------
    # Print and save the results 
    print 'Unclampled Log Z %.5f, Var %.5f' % (model_logz.mean(), model_logz.std())
    for dtype in logz_data :
        logz = logz_data[dtype]
        print 'clampled %s Log Z %.5f, Var %.5f' % (dtype, logz.mean(), logz.std())

    print '-----Test Log Likelihood-----'
    for dtype in logz_data :
        logz = logz_data[dtype]
        print 'clampled %s Log Z %.5f, Var %.5f' % (dtype, logz.mean() - model_logz.mean(), \
                logz.std())

    tr.FreeGPU(board)

    import pickle
    with open(args.outf,'wb') as fout:
        pkldata = { 'model' : model_logz, 'data' : logz_data }
        pickle.dump(pkldata, fout)


