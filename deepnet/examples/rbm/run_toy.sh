#!/bin/bash
# Trains a feed forward net on MNIST.
train_deepnet='python ../../trainer.py'
${train_deepnet} model_toy.pbtxt train_toy.pbtxt eval_toy.pbtxt
