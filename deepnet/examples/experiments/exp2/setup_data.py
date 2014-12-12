"""Sets up paths, separates out data with missing text."""
import numpy as np
from deepnet import datahandler as dh
from deepnet import util
import os, sys
from google.protobuf import text_format
import pdb
import glob

def EditPaths(data_pb, data_dir, gpu_mem, main_mem):
  data_pb.gpu_memory = gpu_mem
  data_pb.main_memory = main_mem
  data_pb.prefix = data_dir

def EditTrainers(data_dir, model_dir, rep_dir ):
  tnames = ['train_CD_rbm1.pbtxt',
          'train_CD_rbm2.pbtxt',
            'train_CD_joint.pbtxt']
  for tname in tnames:
    t_op_file = os.path.join('trainers', tname)
    t_op = util.ReadOperation(t_op_file)
    if 'rbm1' in tname or 'joint' in tname:
      t_op.data_proto_prefix = data_dir
    else:
      t_op.data_proto_prefix = rep_dir
    t_op.checkpoint_directory = model_dir
    with open(t_op_file, 'w') as f:
      text_format.PrintMessage(t_op, f)
 
  # Change prefix in multimodal dbn model
  mnames = ['joint.pbtxt']
  for mname in mnames:
    model_file = os.path.join('models', mname)
    model = util.ReadModel(model_file)
    model.prefix = model_dir
    with open(model_file, 'w') as f:
      text_format.PrintMessage(model, f)

def main():
  data_dir = sys.argv[1]
  model_dir = sys.argv[2]
  rep_dir = sys.argv[3]
  gpu_mem = sys.argv[4]
  main_mem = sys.argv[5]

  data_pbtxt_file = os.path.join(data_dir, 'data.pbtxt')
  data_pb = util.ReadData(data_pbtxt_file)
  EditPaths(data_pb, data_dir, gpu_mem, main_mem)
  with open(data_pbtxt_file, 'w') as f:
    text_format.PrintMessage(data_pb, f)
  EditTrainers(data_dir, model_dir, rep_dir)

if __name__ == '__main__':
  main()
