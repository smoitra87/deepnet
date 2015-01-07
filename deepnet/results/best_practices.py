import os, sys
import numpy as np
import matplotlib.pyplot as plt
import scipy as sci
import csv

def plot_coldict(d, dat):
    max_labels = max(len(k.keys()) for k in d) -1
    xticklabels = [d2['name']+":"+"|".join(k for k in sorted(d2.keys()) if k!='name') for d2 in d]
    labels = [[k for k in sorted(d2.keys()) if k!='name'] for d2 in d]
    means = [[d2[l]['mean'] for l in labs] for (labs,d2) in zip(labels,d)]
    stds = [[d2[l]['std'] for l in labs] for (labs,d2) in zip(labels,d)]

    means = [l+[0.]*(max_labels-len(l)) for l in means]    
    stds = [l+[0.]*(max_labels-len(l)) for l in stds]    
    means, stds = zip(*means), zip(*stds)

    fig, ax = plt.subplots()
    fig.set_size_inches(18.5, 10.5)

    N = len(labels)
    ind = np.arange(N)  # the x locations for the groups
    width = 0.15       # the width of the bars


    colors = 'rgbymc'

    rects = []

    for idx,means2 in enumerate(means):
        rect = ax.bar(ind+width*idx, means2, width, color = colors[idx], yerr=stds[idx],\
                error_kw={'ecolor':'gray', 'lw':2})
        rects.append(rect)

    ax.set_ylabel('Validation CrossEntropy')
    ax.set_title('HyperParam Scan: Dataset {}'.format(dat))
    ax.set_xticks(ind+width)
    ax.set_xticklabels( xticklabels )

    zed = [tick.label.set_fontsize(7) for tick in ax.xaxis.get_major_ticks()]

    ax.legend(rects, ["Lab{}".format(i+1) for i in range(max_labels)])

    plt.tight_layout()
    plt.savefig("{}.png".format(dat), dpi=100)
    plt.close()



if __name__ == '__main__':
    from argparse import ArgumentParser
    parser = ArgumentParser(description = 'analyzes collected results')
    parser.add_argument('--resultsf', type=str, help='resultsfile')
    parser.add_argument('--best', type=int, default=0, help='Best result to consider')
    args = parser.parse_args()


    with open('collected_results.csv', 'rb') as fin:
        reader = csv.reader(fin)
        header = next(reader)
        print header
        rows = [row for row in reader]

    valid_idx = next(idx for (idx,e) in enumerate(header) if e == 'Valid_CE')
    model_idx = next(idx for (idx,e) in enumerate(header) if e == 'model_name')
    dataset_idx = next(idx for (idx,e) in enumerate(header) if e == 'dataset')
    sparsity_idx = next(idx for (idx,e) in enumerate(header) if e == 'sparsity')
    finalmom_idx = next(idx for (idx,e) in enumerate(header) if e == 'final_momentum')

    extract_col = lambda(colidx): [row[colidx] for row in rows]

    # Plot fitted Gaussians
    valid = extract_col(valid_idx)
    valid = np.asarray(map(float, valid))

    dataset = extract_col(dataset_idx)
    uniq_d = set(dataset)
    dat_dict  = {}
    for dat in uniq_d:
        datidx = [jdx for (jdx,e2) in enumerate(dataset) if e2 == dat]

        if args.best > 0:
            datidx = datidx[:args.best]
        dat_dict[dat] = datidx

    from collections import defaultdict
    coldict_dict = defaultdict(list);
    for dat in sorted(dat_dict.keys()):
        print
        print("Analyzing Dataset {} .....").format(dat)
        print

        for idx in range(sparsity_idx, finalmom_idx+1):
            col = extract_col(idx)
            uniq_e = set(col)

            coldict = {}
            coldict['name'] = header[idx]

            for e in uniq_e : 
                colidx = [jdx for (jdx,e2) in enumerate(col) if e2 == e and jdx in dat_dict[dat]]
                coldict[e] = {}
                coldict[e]['mean'] = np.mean(valid[colidx])
                coldict[e]['mean'] = np.mean(valid[colidx])
                coldict[e]['std'] = np.std(valid[colidx])
            print coldict
            coldict_dict[dat].append(coldict)

    coldict_dict = dict(coldict_dict)
    for dat in coldict_dict:
        plot_coldict(coldict_dict[dat], dat)








    
