import argparse
import os, sys

if __name__ == '__main__':
    from argparse import ArgumentParser
    parser = ArgumentParser(description="Converts Fasta files into ascii")
    parser.add_argument("inf", type=str, help="input fasta file")
    parser.add_argument("outf", type=str, help="output ascii file")
    parser.add_argument("--binarize", action='store_true', help="binarize output")
    args = parser.parse_args()

    AALIST= [aa for aa in "AVLIPFWMGSTCYNQDEKRH-X"]
    aa_dict = dict((aa,idx) for (idx,aa) in enumerate(AALIST))

    with open(args.inf) as fin, open(args.outf,'w') as fout:
        for line in fin:
            if line.startswith(">") : continue
            line = line.strip()
            aa_line = [aa_dict[aa]*2/len(AALIST) if args.binarize else aa_dict[aa] for aa in line]
            print >>fout, ",".join(str(aa) for aa in aa_line)

