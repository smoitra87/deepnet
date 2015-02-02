"""Write a model protocol buffer to mat file."""
from deepnet import util
import numpy as np
import sys
import scipy.io
import scipy.io as sio
import gzip
import os


def Convert(dirpath, mat_file,  dump_npy = False, out_file = 'rbm_mrf', model_file=None):
    """ Create the necesarry things"""
    matfile = sio.loadmat(mat_file)

    # get the weight matrix
    weight = np.asarray(matfile['L'].T, dtype='float32')
    nFeats,_ = weight.shape
    diag = np.ones([nFeats, 1]) * matfile['min_eig'] * (1+matfile['alpha'])
    diag = np.asarray(diag, dtype='float32')
    
    if dump_npy : 
        edge_file = os.path.join(dirpath, 'edge_input_to_gaussian.npy')
        diag_file = os.path.join(dirpath, 'diag_gaussian.npy')
        np.save(edge_file, weight)
        np.save(diag_file, diag)
    else:
        model = util.ReadModel(model_file)
        proto_weight = next(param for param in model.edge[0].param if param.name == 'weight')
        proto_weight.mat = util.NumpyAsParameter(weight)
        proto_weight.dimensions.extend(weight.shape)

        input_layer = next(l for l in model.layer if l.name == 'input_layer')
        proto_diag = next(param for param in input_layer.param if param.name == 'diag')
        proto_diag.mat = util.NumpyAsParameter(diag)
        proto_diag.dimensions.extend(diag.shape)

        out_file = os.path.join(dirpath, out_file)
        f = gzip.open(out_file, 'wb')
        f.write(model.SerializeToString())
        f.close()

if __name__ == '__main__':
    from argparse import ArgumentParser
    parser = ArgumentParser()
    parser.add_argument("--model_file", type=str)
    parser.add_argument("--mat_file", type=str)
    parser.add_argument("--out_file", type=str)
    parser.add_argument("--dirpath", type=str)
    parser.add_argument("--npy", action='store_true')

    args = parser.parse_args()
    
    if args.npy:
        Convert(args.dirpath, args.mat_file, dump_npy = True)
    else:
        Convert(args.dirpath, args.mat_file, dump_npy = False, out_file = args.out_file, model_file=args.model_file)

