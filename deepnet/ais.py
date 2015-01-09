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
  #plt.figure(3)
  #plt.clf()
  #plt.imshow(hid_state.asarray().T, cmap=plt.cm.gray, interpolation='nearest')
  #plt.figure(4)
  #plt.clf()
  #plt.imshow(input_state.asarray().T, cmap=plt.cm.gray, interpolation='nearest')
  #, state.shape[0], state.shape[1], state.shape[0], 3, title='Markov chains')
  #plt.tight_layout(pad=0, w_pad=0, h_pad=0)
  #plt.figure(5)
  #plt.clf()
  #plt.suptitle('Variance')
  #plt.plot(np.array(x_axis), np.array(w_var))
  #plt.draw()

def GetAll(n):
  x = np.zeros((n, 2**n))
  a = []
  for i in range(n):
    a.append([0, 1])
  for i, r in enumerate(itertools.product(*tuple(a))):
    x[:, i] = np.array(r)
  return x

def AISRbm(model, schedule):
  assert len(model.layer) == 2, 'Only implemented for RBMs.'
  steps = len(schedule)
  input_layer = model.layer[0]
  hidden_layer = model.layer[1]
  edge = model.edge[0]
  batchsize = model.t_op.batchsize
  for layer in (hidden_layer, input_layer):
    layer.temp= layer.statesize

  w = edge.params['weight']
  a = hidden_layer.params['bias']
  b = input_layer.params['bias']

  # INITIALIZE TO UNIFORM RANDOM.
  input_layer.state.assign(0)
  input_layer.ApplyActivation()
  input_layer.Sample()
  w_ais = cm.CUDAMatrix(np.zeros((1, batchsize)))
  
  # RUN AIS.
  for i in range(1, steps):
    sys.stdout.write('\rStep %d ' % i) 
    sys.stdout.flush()

    cm.dot(w.T, input_layer.sample, target=hidden_layer.state)
    hidden_layer.state.add_col_vec(a)

    hidden_layer.state.mult(schedule[i-1], target=hidden_layer.temp)
    hidden_layer.state.mult(schedule[i])
    cm.log_1_plus_exp(hidden_layer.state, target=hidden_layer.deriv)
    cm.log_1_plus_exp(hidden_layer.temp)
    hidden_layer.deriv.subtract(hidden_layer.temp)
    w_ais.add_sums(hidden_layer.deriv, axis=0)
    w_ais.add_dot(b.T, input_layer.sample, mult=schedule[i]-schedule[i-1])

    print 'hidden annealed ene', hidden_layer.deriv.asarray().sum()
    print 'softmax raw ene', b.asarray().T.dot(input_layer.sample.asarray()).sum()
    print 'w_ais', LogMeanExp(w_ais.asarray())

    hidden_layer.ApplyActivation()
    print 'hidden probs', hidden_layer.state.asarray().sum()
    hidden_layer.Sample()
    cm.dot(w, hidden_layer.sample, target=input_layer.state)
    input_layer.state.add_col_vec(b)
    input_layer.state.mult(schedule[i])
    input_layer.ApplyActivation()
    input_layer.Sample()
    print 'softmax probs', input_layer.state.asarray().sum()

    if i == 10:
        raw_input('Press key to continiue..')
        sys.exit(0)
    
    print '-' * 30

  z = LogMeanExp(w_ais.asarray()) 
  z += input_layer.dimensions * np.log(input_layer.numlabels)
  z += hidden_layer.dimensions * np.log(2) 
  return z

def AIS_DBM(model, schedule, clamp_input):
  # Initialize stuff
  steps = len(schedule)
  batchsize = model.t_op.batchsize
  w_ais = cm.CUDAMatrix(np.zeros((1, batchsize)))

  # set up temp data structures
  for layer in model.layer:
    layer.temp= layer.statesize

  hidden_layer = model.layer[1]  
  input_layer = model.layer[0]
  input_layer.state.assign(0)
  input_layer.ApplyActivation()
  input_layer.Sample()

  model.layer = model.layer[::-1]
  # INITIALIZE TO UNIFORM RANDOM for all layers except clamped layers
#  for layer in model.layer:
#    if layer.is_input and clamp_input:
#      layer.GetData()  
#      layer.sample.assign(layer.state)
#      continue
#    layer.state.assign(0)
#    layer.ApplyActivation()
#    layer.Sample()
  w_ais = cm.CUDAMatrix(np.zeros((1, batchsize)))

  # RUN AIS.
  for step_idx in range(1, steps):
    sys.stdout.write('\rStep %d ' % step_idx) 
    sys.stdout.flush()

    visited_edges = {}

    if step_idx == 10:
        raw_input('Press key to continiue..')
        sys.exit(0)

    ##------------------------------
    # Calculate the energies from all the nodes
    for layer in model.layer:

       layer.state.assign(0)
        
       for i, edge in enumerate(layer.incoming_edge):

         if edge in visited_edges:
             continue
         else:
             visited_edges[edge] = True

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

       if layer.__class__ is deepnet.logistic_layer.LogisticLayer:
          layer.state.mult(schedule[step_idx-1], target=layer.temp)
          layer.state.mult(schedule[step_idx])
          cm.log_1_plus_exp(layer.state, target=layer.deriv)
          cm.log_1_plus_exp(layer.temp)
          layer.deriv.subtract(layer.temp)
          w_ais.add_sums(layer.deriv, axis=0)
          print 'hidden annealed ene', layer.deriv.asarray().sum()
       else:
          layer.state.mult(layer.sample)  
          print 'softmax raw ene', layer.state.asarray().sum()
          w_ais.add_sums(layer.state, axis=0, mult= schedule[step_idx] - schedule[step_idx-1])

    print 'w_ais', LogMeanExp(w_ais.asarray())
    #-----------------------------------------
    # Update the state with temperature and sample from it
    for layer in (hidden_layer, input_layer):
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
      if layer.__class__ is deepnet.logistic_layer.LogisticLayer:
        print 'hidden probs', layer.state.asarray().sum()
      else:
        print 'softmax probs', layer.state.asarray().sum()
      layer.Sample()

    print '-'*30


  z = LogMeanExp(w_ais.asarray()) 
  for layer in model.layer:
    if layer.__class__ is deepnet.logistic_layer.LogisticLayer:
      z += layer.dimensions * np.log(2) 
    else:
      z += layer.dimensions * np.log(layer.numlabels)
  return z

def Usage():
  print '%s <model file> <number of Markov chains to run> [number of words (for Replicated Softmax models)]'

if __name__ == '__main__':

  from argparse import ArgumentParser
  parser = ArgumentParser(description = "Run AIS")
  parser.add_argument("model_file", type=str)
  parser.add_argument("--train_file", type=str)
  parser.add_argument("--num_words", type=int)
  parser.add_argument("--rbm", action='store_true')
  parser.add_argument("numchains", type=int, default=1)
  args = parser.parse_args()

  board = tr.LockGPU()
  model_file = args.model_file
  train_file = args.train_file
  numchains = args.numchains
  m = dbm.DBM(model_file, train_file)
  #m.LoadModelOnGPU(batchsize=numchains)
  m.LoadModelOnGPU()
  #m.SetUpData()
  plt.ion()

  cm.CUDAMatrix.init_random(seed=42)
  schedule = np.concatenate((
    #np.arange(0.0, 1.0, 0.01),
    np.arange(0.0, 1.0, 0.001),
    #np.arange(0.0, 0.7, 0.001),  # 700
    #np.arange(0.7, 0.9, 0.0001),  # 2000
    #np.arange(0.9, 1.0, 0.00002)  # 5000
    ))
  if not args.rbm:
    log_z = AIS_DBM(m, schedule, clamp_input=False)
  else:
    log_z = AISRbm(m, schedule)
  print 'Log Z %.5f' % log_z

  tr.FreeGPU(board)
  raw_input('Press Enter.')
