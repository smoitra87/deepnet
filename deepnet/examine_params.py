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

    pair_strength = weight.dot(weight.T)
    pair_strength = pair_strength
    nFeats,_ = pair_strength.shape
    nRes = nFeats/21

    adjmap = np.zeros((nRes, nRes))
    for i in range(nRes):
        for j in range(nRes):
            edge_mat = pair_strength[i*21:(i*21+21), j*21:(j*21+21)]
            adjmap[i,j] = np.sort(edge_mat.flatten())[-5:].sum()
            #adjmap[i,j] = edge_mat.sum()
            #adjmap[i,j] = edge_mat.max()
            adjmap[i,j] = np.sqrt(edge_mat.sum())
    

    # normalize by entropy of column
    dat = np.load('datasets/PF00240/PF00240_train.npy')
    nSeq = dat.shape[0]

    counts = np.zeros((21,nRes))
    for i in range(21):
        counts[i,:] = (dat==i).sum(axis=0) + 1
    probs = counts / (nSeq+21)

    entropy = -(probs * np.log(probs)).sum(axis=0)
    entropy = entropy[:,np.newaxis] + entropy[np.newaxis, :]
#    temp = entropy
#    entropy = np.zeros((nRes, nRes))
#    for i in range(nRes):
#        for j in range(nRes):
#            entropy[i,j] = max(temp[i], temp[j])
    

    cov = adjmap / entropy

    # Create another cov using MI
    from sklearn.metrics.cluster import adjusted_mutual_info_score
    from sklearn.metrics.cluster import mutual_info_score

#    cov = np.zeros((nRes, nRes))
#    for i in range(nRes):
#        for j in range(i,nRes):
#            cov[i,j] = adjusted_mutual_info_score(dat[:,i], dat[:,j])

    mincov = cov.min()
    for i in range(nRes):
        cov[i,i] = mincov


    plt.matshow(cov)

    cov = np.triu(cov)
    cutoffs = sorted(cov.flatten(), reverse=True)

    ubqadj = np.load('1UBQ_adj.npy')
#    for i in range(nRes-5):
#        ubqadj[i:i+5,i:i+5] = 0



    ubqadj = np.triu(ubqadj)
    tp,fp = [],[]
    prev_count, predcount = 0,0


    for idx,cutoff in enumerate(cutoffs) : 
        adj = cov > cutoff
        pred_count = np.triu(adj).sum()
        adj_common = ubqadj *  adj;
        precision = (np.triu(adj_common).sum() + 0.) / (pred_count)
        recall = (np.triu(adj_common).sum() + 0.) / (np.triu(ubqadj).sum())

        if pred_count == int(nRes/2):
            print 'precision = {} ({}/{})'.format(precision, np.triu(adj_common).sum(), \
                    pred_count)
            print 'recall = {}'.format(recall)
        tp.append((np.triu(adj_common).sum()+0.)/np.triu(ubqadj).sum())
        fp.append((pred_count - np.triu(adj_common).sum()+0.)/((nRes*(nRes-1)/2)-np.triu(ubqadj).sum()))


    plt.figure()
    plt.plot(fp, tp);
    plt.plot(np.linspace(0,1,2),np.linspace(0,1,2),'--')
    plt.xlim(0,1)
    plt.title('ROC curve contact map UBQ')
    plt.xlabel('FPR')
    plt.ylabel('TPR')

    # ---  BREAKPOINT --- 
    import ipdb; ipdb.set_trace() 

#    plt.savefig('ubqroc.pdf')

   
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


