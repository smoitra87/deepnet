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
    parser.add_argument("model_file", type=str)
    parser.add_argument("--train_file", type=str)
    parser.add_argument("--outf", type=str, help='Output File')
    args = parser.parse_args()

    model_file = args.model_file
    train_file = args.train_file
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
    plt.ion()
    #plt.matshow(weight, cmap=plt.cm.gray)

    from sklearn.cluster import KMeans

    n_clusters = 4
    #model =  KMeans(n_clusters=n_clusters)
    #model.fit(weight)
    #labels = model.labels_

    #fig, ax = plt.subplots(n_clusters ,1, sharex=True, sharey=True)

    #colors = 'rgbcyk'

    #xticklabels = list('AVLIPFWMGSTCYNQDEKRH-')

    # construct contact map from weight matrix
    adjmaps = []
    sweights = sorted(weight.flatten(), reverse=True)
   
    cutoffs = sweights[:10000:10]

    ubqadj = np.load('1UBQ_adj.npy')

    tp,fp = [],[]

    prev_count, predcount = 0,0

    for idx,cutoff in enumerate(cutoffs) : 
        adj = np.zeros((69, 69))
        strong_hids = ((weight > cutoff).sum(axis=0)) > 1
        strong_hids = weight[:,strong_hids] >= cutoff
        (nrows, ncols) = strong_hids.shape
        for idx in range(ncols):

            vis_idx = np.where(strong_hids[:,idx])[0]/21
            vis_idx = list(set(vis_idx))
            from itertools import product
            i,j = zip(*product(vis_idx, vis_idx))
            adj[i, j] = 1.
      
        pred_count = np.triu(adj).sum()
        if pred_count == prev_count : 
            continue
        else:
            prev_count = pred_count

        adj_common = ubqadj *  adj;
        
        precision = (np.triu(adj_common).sum() + 0.) / (pred_count)
        recall = (np.triu(adj_common).sum() + 0.) / (np.triu(ubqadj).sum())
        #print 'precision = {} ({}/{})'.format(precision, np.triu(adj_common).sum(), \
        #        pred_count)
        #print 'recall = {}'.format(recall)
        tp.append((np.triu(adj_common).sum()+0.)/np.triu(ubqadj).sum())
        fp.append((pred_count - np.triu(adj_common).sum()+0.)/((69*68/2)-np.triu(ubqadj).sum()))

    plt.figure()
    plt.plot(fp, tp);
    plt.plot(np.linspace(0,1,2),np.linspace(0,1,2),'--')
    plt.xlim(0,1)
    plt.title('ROC curve contact map UBQ')
    plt.xlabel('FPR')
    plt.ylabel('TPR')
    plt.savefig('ubqroc.pdf')

   
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


