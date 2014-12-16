import os, sys
from util import ReadModel, ReadOperation, ReadData
import re
import glob


EXPERIMENTS_DIR="/storage/data1/dbm/deepnet/deepnet/experiments/"
TEMPLATE_DIR= os.path.join(EXPERIMENTS_DIR, "template")


def get_next_expid(dir="experiments/"):
    expfolders = glob.glob(os.path.join(dir,"exp*"))
    ids = map(int,[re.findall('\d+',f)[0] for f in expfolders if re.findall('\d+',f)])
    return max(ids)+1 if ids else 1

if __name__ == '__main__':
    print get_next_expid()

    from argparse import ArgumentParser
    parser = ArgumentParser(description="Generate hyperparameter scan jobs")
    parser.add_argument()



