"""Sets up paths, separates out data with missing text."""
import numpy as np
from deepnet import datahandler as dh
from deepnet import util
import os, sys
from google.protobuf import text_format
import pdb
import glob
from deepnet import deepnet_pb2
from deepnet import awsutil


def EditPaths(data_pb, args):
  data_pb.gpu_memory = args.gpu_mem
  data_pb.main_memory = args.main_mem
  data_pb.prefix = args.data_dir

def EditTrainers(args):
  t_op_files = glob.glob("trainers/*.pbtxt")
  for t_op_file in t_op_files:
    t_op = util.ReadOperation(t_op_file)
    if 'rbm1' in t_op_file or 'joint' in t_op_file:
      t_op.data_proto_prefix = args.data_dir
    else:
      t_op.data_proto_prefix = args.rep_dir
    t_op.checkpoint_directory = args.model_dir
    t_op.batchsize = args.batchsize
    with open(t_op_file, 'w') as f:
      text_format.PrintMessage(t_op, f)

def EditModels(args):

  # Common changes in all models
  model_files = glob.glob("models/*.pbtxt") 
  for model_file in model_files:
     model = util.ReadModel(model_file)
     model.hyperparams.base_epsilon = args.base_epsilon
     model.hyperparams.sparsity = args.sparsity 
     model.hyperparams.dropout = args.dropout
     model.hyperparams.l2_decay = args.l2_decay
     model.hyperparams.initial_momentum = args.initial_momentum
     model.hyperparams.final_momentum = args.final_momentum
     with open(model_file, 'w') as f:
        text_format.PrintMessage(model, f)

     if args.model == 'sprbm':
         model.hyperparams.sparsity = True

     if args.model == 'droprbm':
         model.hyperparams.dropout = True

  # Specific changes to rbm1
  model_file = os.path.join('models', 'rbm1.pbtxt')
  model = util.ReadModel(model_file)
  for layer in model.layer:

     if layer.name == 'input_layer': 
         layer.dimensions = args.input_width
         layer.numlabels = args.input_numlabels
     if args.model in ('rbm', 'sprbm', 'droprbm'):
         if layer.name == 'bernoulli_hidden1': 
             layer.dimensions = args.hidden1_width
     elif args.model in ('lcrbm', 'ghrbm'):
         if layer.name == 'gaussian_hidden1':
             layer.dimensions = args.input_width * 21
     elif args.model in ('slcrbm', 'srbm'):
         if layer.name  == 'bernoulli_hidden1': 
             layer.dimensions = args.hidden1_width
         if layer.name == 'gaussian_hidden1':
             layer.dimensions = args.input_width * 21
     else:
         raise ValueError('Unknown model {}'.format(args.model))

     # Add in the datafiles
     if args.model in ('lcrbm', 'ghrbm', 'slcrbm', 'srbm'):
         edge = next(e for e in model.edge if e.node1 == 'input_layer' and \
                 e.node2 == 'gaussian_hidden1')
         param = next(p for p in edge.param if p.name == 'weight')
         pretrained_model_file = param.pretrained_model[0]
         param.pretrained_model[0] = os.path.join(args.data_dir, pretrained_model_file)

         layer = next(l for l in model.layer if l.name == 'input_layer')
         param = next(p for p in layer.param if p.name == 'diag')
         pretrained_model_file = param.pretrained_model[0]
         param.pretrained_model[0] = os.path.join(args.data_dir, pretrained_model_file)

     if args.model in ('lcrbm', 'slcrbm'):
         edge = next(e for e in model.edge if e.node1 == 'input_layer' and \
                 e.node2 == 'gaussian_hidden1')
         param = next(p for p in edge.param if p.name == 'weight')
         sparsity_mask_file = param.sparsity_mask
         param.sparsity_mask = os.path.join(args.data_dir, sparsity_mask_file)


  with open(model_file, 'w') as f:
     text_format.PrintMessage(model, f)
 
  with open(model_file, 'w') as f:
    text_format.PrintMessage(model, f)
 
def main():
  from argparse import ArgumentParser
  parser = ArgumentParser()
  parser.add_argument("--model", type=str, help="Name of model")
  parser.add_argument("--data_dir", type=str, help="Data directory location")
  parser.add_argument("--model_dir", type=str, help="Directory to write models to")
  parser.add_argument("--rep_dir", type=str, help="Directory to write representations to")
  parser.add_argument("--gpu_mem", type=str, default="3G", help="GPU memory")
  parser.add_argument("--main_mem", type=str, default="30G", help="CPU memory")
  parser.add_argument("--base_epsilon",type=float, default=0.1, help="base epsilon rate")
  parser.add_argument("--sparsity",action="store_true", help="apply sparsity")
  parser.add_argument("--dropout",action="store_true", help="apply dropout")
  parser.add_argument("--l2_decay", type=float, default=0.01, help="l2 decay cost")
  parser.add_argument("--initial_momentum", type=float, default=0.5, help="initial momentum")
  parser.add_argument("--final_momentum", type=float, default=0.9, help="final momentum")
  parser.add_argument("--input_width", type=int, \
          help="number of nodes in input_layer")
  parser.add_argument("--input_numlabels", type=int, default=21,\
          help="number of states for nodes in input_layer")
  parser.add_argument("--hidden1_width", type=int, default=100, \
          help="number of nodes in hidden layer")
  parser.add_argument("--batchsize", type=int, default=1000, help="batchsize")

  args = parser.parse_args()

  if not args.data_dir or not args.model_dir or not args.rep_dir or \
          not args.input_width : 
      raise ValueError("Required input not provided")

  deepnet_path = awsutil.get_deepnet_path()
  args.data_dir = os.path.join(deepnet_path, args.data_dir)
  args.model_dir = os.path.join(deepnet_path, args.model_dir)
  args.rep_dir = os.path.join(deepnet_path, args.rep_dir)

  data_pbtxt_file = os.path.join(args.data_dir, "data.pbtxt")
  data_pb = util.ReadData(data_pbtxt_file)
  EditPaths(data_pb, args)
  with open(data_pbtxt_file, 'w') as f:
    text_format.PrintMessage(data_pb, f)
  EditTrainers(args) 
  EditModels(args)

if __name__ == '__main__':
  main()
