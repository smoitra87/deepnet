""" Computes the partition function and test log likelihood of MRFs"""
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
import scipy.io as sio



def LogMeanExp(x):
    offset = x.max()
    return offset + np.log(np.exp(x-offset).mean())

def LogSumExp(x):
    offset = x.max()
    return offset + np.log(np.exp(x-offset).sum())


def calculate_energy(model):
    # Initialize stuff
    steps = len(schedule)
    batchsize = model.batchsize
    energy = cm.CUDAMatrix(np.zeros((1, batchsize)))

    input_layer = model.GetLayerByName('input_layer') 
    mirror_layer = model.GetLayerByName('mirror_layer')

    # INITIALIZE TO UNIFORM RANDOM for all layers except clamped layers
    input_layer.GetData()
    input_layer.sample.assign(input_layer.state)
    mirror_layer.state.assign(0)

    for i, edge in enumerate(mirror_layer.incoming_edge):
        neighbour = mirror_layer.incoming_neighbour[i]
        inputs = neighbour.sample
        if edge.node2 == mirror_layer:
            w = edge.params['weight'].T
            factor = edge.proto.up_factor
        else:
            w = edge.params['weight']
            factor = edge.proto.down_factor

        mirror_layer.state.add_dot(w, inputs, mult=factor)
    b = mirror_layer.params['bias']
    mirror_layer.state.add_col_vec(b)

    mirror_layer.state.mult(input_layer.sample)
    mirror_layer.state.sum(axis=0, target=energy)

    return energy.asarray()


def AIS_MRF(model, schedule, clamp_input):
    # Initialize stuff
    steps = len(schedule)
    batchsize = model.batchsize
    w_ais = cm.CUDAMatrix(np.zeros((1, batchsize)))

    input_layer = model.GetLayerByName('input_layer') 
    mirror_layer = model.GetLayerByName('mirror_layer')

    # INITIALIZE TO UNIFORM RANDOM for all layers except clamped layers
    for layer in model.layer:
        layer.state.assign(0)
        layer.ApplyActivation()
        layer.Sample()

    even_layers= [input_layer] 
    odd_layers = [mirror_layer]

    # RUN AIS.
    for step_idx in range(1, steps):
        sys.stdout.write('\rStep %d ' % step_idx)
        sys.stdout.flush()

        # Calculate the energies of the input layer
        mirror_layer.state.assign(0)

        for i, edge in enumerate(mirror_layer.incoming_edge):
            neighbour = mirror_layer.incoming_neighbour[i]
            inputs = neighbour.sample
            w = edge.params['weight']

            mirror_layer.state.add_dot(w, inputs)
        b = mirror_layer.params['bias']
        mirror_layer.state.add_col_vec(b)

        mirror_layer.state.mult(input_layer.sample)
        print mirror_layer.state.asarray().sum(axis=0).mean()
        w_ais.add_sums(mirror_layer.state, axis=0, mult=schedule[\
                           step_idx] - schedule[step_idx-1])

        #-----------------------------------------
        # Update the state with temperature and sample from it
        for layer in model.layer:
            for i, edge in enumerate(layer.incoming_edge):
                neighbour = layer.incoming_neighbour[i]
                inputs = neighbour.sample
                w = edge.params['weight']
                cm.dot(w, inputs, target=layer.state)

            b = layer.params['bias']
            layer.state.add_col_vec(b)
            layer.state.mult(schedule[step_idx])
            layer.ApplyActivation()
            layer.Sample()

    return w_ais.asarray()

if __name__ == '__main__':

    from argparse import ArgumentParser
    parser = ArgumentParser(description="Run AIS")
    parser.add_argument("--train_file", type=str)
    parser.add_argument("--data_dir", type=str)
    parser.add_argument("--model_file", type=str)
    parser.add_argument("--numchains", type=int, default=1)
    parser.add_argument("--numchains_unclamped", type=int, default=1000)
    parser.add_argument("--schedule", type=str, default='quick', help='Select Schedule')
    parser.add_argument("--outf", type=str, help='Output File')
    args = parser.parse_args()

    if not args.outf : 
        raise ValueError('Output file not defined')

    if not args.train_file or not args.data_dir or not args.model_file : 
        raise ValueError('Missing inputs')

    board = tr.LockGPU()
    numchains = args.numchains
    model = util.ReadModel(args.model_file)
    t_op = util.ReadOperation(args.train_file)

    # Make changes to model file based on MRF param matrix

    edge = next(e for e in model.edge if e.node1 == 'input_layer' and \
            e.node2 == 'mirror_layer')
    param = next(p for p in edge.param if p.name == 'weight')
    pretrained_model_file = param.pretrained_model[0]
    param.pretrained_model[0] = os.path.join(args.data_dir, pretrained_model_file)

    
    mrf_file = param.pretrained_model[0]
    params = np.load(mrf_file)
    dimensions = params.shape[0] / model.layer[0].numlabels

    for layer in model.layer : 
        layer.dimensions = dimensions

    # Load Models on GPU

    model = dbm.DBM(model, t_op)

    # Fix paths
    model.t_op.data_proto_prefix = os.path.join(args.data_dir)
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
    layer = model.GetLayerByName('input_layer')
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

            chains = calculate_energy(model)
            chains = chains.flatten()
            num_replicated_chains  = len(chains)
            batchsize = num_replicated_chains / args.numchains
            w_ais  = np.zeros(batchsize)
            for idx in range(batchsize):
                w_ais[idx] = np.mean(chains[idx::batchsize])
            logz_data[data_type].append(w_ais)

        logz_data[data_type] = np.concatenate(logz_data[data_type])

   
    #----------------------------------------------------------------------
    # log_z for unclamped model
    model.ResetBatchsize(args.numchains_unclamped)
    chains = AIS_MRF(model, schedule, clamp_input=False)
    model_logz = chains.flatten()
        
    base_logz = 0.0
    layer = model.GetLayerByName('input_layer')
    base_logz += layer.dimensions * np.log(layer.numlabels)
    # ---  BREAKPOINT --- 
    import ipdb; ipdb.set_trace() 
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
        print 'clampled %s LogP %.5f, Var %.5f' % (dtype, logz.mean() - model_logz.mean(), \
                logz.std())

    tr.FreeGPU(board)

    import pickle
    with open(args.outf,'wb') as fout:
        pkldata = { 'model' : model_logz, 'data' : logz_data }
        pickle.dump(pkldata, fout)

