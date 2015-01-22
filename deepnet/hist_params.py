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
from sklearn.cluster.bicluster import SpectralBiclustering


if __name__ == '__main__':

    from argparse import ArgumentParser
    parser = ArgumentParser(description="Run AIS")
    parser.add_argument("--model_file1", type=str)
    parser.add_argument("--model_file2", type=str)
    parser.add_argument("--train_file1", type=str)
    parser.add_argument("--train_file2", type=str)
    parser.add_argument("--outf", type=str, help='Output File')
    args = parser.parse_args()


    fig, ax = plt.subplots(2,2)
    idx = 0

    for model_file, train_file  in zip([args.model_file1, args.model_file2],\
            [args.train_file1, args.train_file2]) :
        model = dbm.DBM(model_file, train_file)

        board = tr.LockGPU()
        dirname = os.path.split(model.t_op.data_proto_prefix)[1]
        model.t_op.data_proto_prefix = os.path.join('/storage/data1/dbm/deepnet/deepnet/datasets/',\
                dirname)
        model.t_op.skip_last_piece = False
        model.t_op.get_last_piece = True
        model.t_op.randomize = False

        model.LoadModelOnGPU()
        edge = model.edge[0]
        weight = edge.params['weight']

        weight =np.abs(weight.asarray())
        
        sweights = sorted(weight.flatten(), reverse=True)
        cutoffs = sweights

        cutoff_1000 = sweights[500]
        cutoff_10000 = sweights[1000]

        cutoffs = [cutoff_1000,cutoff_10000]


        for cutoff in cutoffs : 
            strong_hids = (weight > cutoff).sum(axis=0)
            strong_hids = strong_hids[strong_hids > 2]

            if idx %2 ==0:
                bins=3
            else:
                bins=3
            if idx % 2 == 1:    
                ax[idx/2, idx%2].hist(strong_hids, bins=bins, color='green')
            else:
                ax[idx/2, idx%2].hist(strong_hids, bins=bins, color='blue')

            if idx/2 :
                ax[idx/2, idx%2].set_xlabel('couplings')

            if idx==0 : 
                ax[idx/2, idx%2].set_ylabel('UBQ')
            if idx==2 : 
                ax[idx/2, idx%2].set_ylabel('PDZ')

            if idx/2 == 0:
                ax[idx/2, idx%2].set_title("Top 500" if idx%2==0 else "Top 1000")

            idx += 1

    plt.tight_layout()
    plt.savefig('strong.pdf')

  
    # ---  BREAKPOINT --- 
    import ipdb; ipdb.set_trace() 


#    for idx in range(n_clusters):
#        ax[idx].hist(np.mod(np.where(labels==idx), 21).flatten(), bins=21, color=colors[idx])
#        ax[idx].set_xlim([0,20])
  

#    for idx in range(n_clusters):
#        ax[idx].hist(np.where(labels==idx)[0]/21, bins=69, color=colors[idx])
#        ax[idx].set_xlim([0,68])
#
#    start, end = ax[n_clusters-1].get_xlim()
#    ax[n_clusters-1].xaxis.set_ticks(np.arange(start, end, 1))
#    ax[n_clusters-1].set_xticklabels(xticklabels)

    tr.FreeGPU(board)

    import pickle
    with open(args.outf,'wb') as fout:
        pkldata = { 'model' : model_logz, 'data' : logz_data }
        pickle.dump(pkldata, fout)


