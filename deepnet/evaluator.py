from neuralnet import *
from fastdropoutnet import *
from dbm import *
from dbn import *
from sparse_coder import *
from choose_matrix_library import *
import numpy as np
from time import sleep

def LockGPU(max_retries=10):
  for retry_count in range(max_retries):
    board = gpu_lock.obtain_lock_id()
    if board != -1:
      break
    sleep(1)
  if board == -1:
    print 'No GPU board available.'
    sys.exit(1)
  else:
    cm.cuda_set_device(board)
    cm.cublas_init()
  return board

def FreeGPU(board):
  cm.cublas_shutdown()
  #gpu_lock.free_lock(board)

def LoadExperiment(model_file, train_op_file, eval_op_file):
  model = util.ReadModel(model_file)
  train_op = util.ReadOperation(train_op_file)
  eval_op = util.ReadOperation(eval_op_file)
  return model, train_op, eval_op

def CreateDeepnet(model, train_op, eval_op):
  if model.model_type == deepnet_pb2.Model.FEED_FORWARD_NET:
    return NeuralNet(model, train_op, eval_op)
  elif model.model_type == deepnet_pb2.Model.DBM:
    return DBM(model, train_op, eval_op)
  elif model.model_type == deepnet_pb2.Model.DBN:
    return DBN(model, train_op, eval_op)
  elif model.model_type == deepnet_pb2.Model.SPARSE_CODER:
    return SparseCoder(model, train_op, eval_op)
  elif model.model_type == deepnet_pb2.Model.FAST_DROPOUT_NET:
    return FastDropoutNet(model, train_op, eval_op)
  else:
    raise Exception('Model not implemented.')

def Evaluate(model):
  stats = []
  # Evaluate on validation set.
  model.Evaluate(validation=True)
  # Evaluate on test set.
  model.Evaluate(validation=False)

  valid_stat = model.net.validation_stats[-1]
  test_stat = model.net.test_stats[-1]

def main():
  if use_gpu == 'yes':
    board = LockGPU()
  model, train_op, eval_op = LoadExperiment(sys.argv[1], sys.argv[2],
                                            sys.argv[3])
  model = CreateDeepnet(model, train_op, eval_op)
  model.SetUpTrainer()
 
  #--------------------------------------------------------
  soft = model.layer[0]
  edge = model.edge[0]
  weight = model.edge[0].params['weight'].asarray()
  
  # load data
#  model.GetValidationBatch()
#  soft.GetData()  
#  seq = soft.state.asarray()[:,1]

  import numpy as np
  import aa2int_mrf_to_rbm
  seq = np.load('datasets/PF00240/PF00240_valid.npy')[0,:].T
  seq_1hot = np.zeros([21*len(seq),1])
  nRes= len(seq)
  for idx, aa in enumerate(seq):
      seq_1hot[21*idx+aa,:] = 1.

  import scipy.io as sio
  matfile = sio.loadmat('wrbm.mat')

  wrbm = np.dot(weight, weight.T)
  A = wrbm + np.eye(nRes*21)*(1 + matfile['alpha'])*matfile['min_eig'];

  assert ((A - matfile['mrf_weights'])**2).sum() < 1e-8

  wmrf = matfile['mrf_weights']

  print "ene_rbm : %.5f"%(np.dot(seq_1hot.T, np.dot(wmrf, seq_1hot)))

  sio.savemat('seq_1hot', {'seq_1hot':seq_1hot, 'seq':seq})
 

  Evaluate(model)  

  if use_gpu == 'yes':
    FreeGPU(board)
  #raw_input('Press Enter.')

if __name__ == '__main__':
  main()
