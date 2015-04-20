import numpy as np
from operator import itemgetter, eq
from itertools import product

if __name__ == '__main__':
    from argparse import ArgumentParser
    parser = ArgumentParser()
    parser.add_argument("--blosum_dat", type=str)
    parser.add_argument("--format", type=str, help="c/matlab")
    args = parser.parse_args()
    
    AALIST= [aa for aa in "AVLIPFWMGSTCYNQDEKRH-"]
    aa_dict = dict((aa,idx) for (idx,aa) in enumerate(AALIST))
    aa_dict["X"] = len(AALIST) - 1

    with open(args.blosum_dat) as fin:
        header = next(fin)
        header = header.replace('*', '-').strip().split() 
        mat = [line.strip().split()[1:] for line in fin]

    mat = np.asarray(mat, dtype=np.int)

    perm_idx = [filter(lambda t: eq(t[1],aa), enumerate(header))[0][0] \
            for aa in AALIST]

    header = list(np.asarray(header)[perm_idx])
    mat = mat[perm_idx, :]
    mat = mat[:, perm_idx]

    if args.format == 'c':
        for row in mat:
            print "{" + ", ".join(map(str, list(row))) + "},"


    



