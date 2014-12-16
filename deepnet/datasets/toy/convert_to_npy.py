import os,sys
import util
import numpy as np

if __name__ == '__main__':
	from argparse import ArgumentParser
	parser = ArgumentParser("Converts msa to .npy")
	parser.add_argument("--inputf", type=str)
	parser.add_argument("--outputf", type=str)
	parser.add_argument("--binarize", action="store_true", default = False)
	args = parser.parse_args()
	
	X = util.convert_mat_from_msa(args.inputf)
	if args.binarize:
		X = np.array(X >= 10, dtype=int)
	np.save(args.outputf, X)
