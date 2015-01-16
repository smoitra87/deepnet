import os,sys

import numpy as np
import matplotlib.pyplot as plt


from argparse import ArgumentParser
parser = ArgumentParser()
parser.add_argument("--ubqdrop")
parser.add_argument("--pdzdrop")
parser.add_argument("--ubq")
parser.add_argument("--pdz")
args = parser.parse_args()

X1 = np.load(args.ubqdrop)
X2 = np.load(args.pdzdrop)
X3 = np.load(args.ubq)
X4 = np.load(args.pdz)


plt.ion()

f, ((ax1,ax2), (ax3,ax4)) = plt.subplots(2,2, sharex=True, sharey=True)
plt.title("Histogram - Hidden Layer Activations")


ax1.hist(X1.flatten(), bins=100)
ax1.set_title('Ubq dropout')


ax2.hist(X2.flatten(), bins=100)
ax2.set_title('PDZ dropout')

ax3.hist(X3.flatten(), bins=100)
ax3.set_title('Ubq w/o dropout')
ax3.set_xlabel('Activation Strength')


ax4.hist(X4.flatten(), bins=100)
ax4.set_title('PDZ w/o dropout')
ax4.set_xlabel('Activation Strength')

plt.savefig("dropout.png")

