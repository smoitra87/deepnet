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
    batchsize = model.t_op.batchsize
    w_ais = cm.CUDAMatrix(np.zeros((1, batchsize)))

    is_rbm = len(model.layer) == 2

    input_layer = model.GetLayerByName('input_layer') 
    h1_layer = model.GetLayerByName('hidden1') 
    if not is_rbm:
        h2_layer = model.GetLayerByName('hidden2') 

    if clamp_input:
        datagetter = model.GetValidationBatch
        datagetter()

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


    even_layers= [input_layer] if is_rbm else [input_layer, h2_layer]
    odd_layers = [h1_layer]

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

    logz = LogMeanExp(w_ais.asarray())

    for layer in model.layer:
        if layer.is_input and clamp_input:
            continue
        if layer.__class__ is deepnet.logistic_layer.LogisticLayer:
            logz += layer.dimensions * np.log(2)
        else:
            logz += layer.dimensions * np.log(layer.numlabels)
    return logz


def Usage():
    print '%s <model file> <number of Markov chains to run> [number of words (for Replicated Softmax models)]'

if __name__ == '__main__':

    from argparse import ArgumentParser
    parser = ArgumentParser(description="Run AIS")
    parser.add_argument("model_file", type=str)
    parser.add_argument("--train_file", type=str)
    parser.add_argument("--num_words", type=int)
    parser.add_argument("--clamp", action='store_true')
    parser.add_argument("--numchains", type=int, default=1)
    parser.add_argument("--schedule", type=str, default='quick', help='Select Schedule')
    args = parser.parse_args()

    board = tr.LockGPU()
    model_file = args.model_file
    train_file = args.train_file
    numchains = args.numchains
    m = dbm.DBM(model_file, train_file)

    # Fix paths
    dirname = os.path.split(m.t_op.data_proto_prefix)[1]
    m.t_op.data_proto_prefix = os.path.join('/storage/data1/dbm/deepnet/deepnet/datasets/',\
            dirname)
    m.t_op.skip_last_piece = False
    # ---  BREAKPOINT --- 
    import ipdb; ipdb.set_trace() 

    m.LoadModelOnGPU()
    m.SetUpData()

    schedules = {
        'very-quick': np.arange(0.0, 1.0, 0.01),
        'quick' : np.arange(0.0, 1.0, 0.001), 
        'slow' : np.concatenate((
                              np.arange(0.0, 0.7, 0.001),  # 700
                              np.arange(0.7, 0.9, 0.0001),  # 2000
                              np.arange(0.9, 1.0, 0.00002)))  # 5000
            }
    schedule  = schedules[args.schedule]

    cm.CUDAMatrix.init_random(seed=42)

    log_z = AIS_DBM(m, schedule, clamp_input=args.clamp)

    print 'Log Z %.5f' % log_z

    tr.FreeGPU(board)
