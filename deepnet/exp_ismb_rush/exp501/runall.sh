#!/bin/bash
# This script trains a Multimodal DBN using deepnet.
# Before running this script download and extract data from
# http://www.cs.toronto.edu/~nitish/multimodal

#Experiment id for the current job

expid=$(basename $(dirname "$(readlink -f "$0")"))
# Location of deepnet. EDIT this for your setup.
if [ `hostname` == 'langmead.pc.cs.cmu.edu' ] ; then
    deepnet=/storage/data1/dbm/deepnet/deepnet
else
    deepnet=/home/ubuntu/deepnet/deepnet
fi

# Location of the downloaded data. This is also the place where learned models
# and representations extracted from them will be written. Should have lots of
# space ~30G. EDIT this for your setup.
results_dir=${deepnet}/exp_ismb_rush/$expid

# If you get 'out of memory' errors, try decreasing this.
gpu_mem=4G

# Amount of main memory to be used for buffering data. Adjust this according to
# your RAM. Having atleast 16G is ideal.
main_mem=20G

trainer=${deepnet}/trainer.py
extract_rep=${deepnet}/extract_rbm_representation.py
model_output_dir=${results_dir}/dbm_models
data_output_dir=${results_dir}/dbm_reps
clobber=false

mkdir -p ${model_output_dir}
mkdir -p ${data_output_dir}

## Layer 1
if ${clobber} || [ ! -e ${model_output_dir}/rbm1_LAST ]; then
  echo "Training first layer RBM."
  python ${trainer} models/rbm1.pbtxt \
    trainers/train_CD_rbm1.pbtxt eval.pbtxt || exit 1
  python ${extract_rep} ${model_output_dir}/rbm1_BEST \
    trainers/train_CD_rbm1.pbtxt hidden1 \
    ${data_output_dir}/rbm1_BEST ${gpu_mem} ${main_mem} || exit 1
fi

## LAYER 2
if ${clobber} || [ ! -e ${model_output_dir}/rbm2_LAST ]; then
  echo "Training second layer RBM."
  python ${trainer} models/rbm2.pbtxt \
    trainers/train_CD_rbm2.pbtxt eval.pbtxt || exit 1
  python ${extract_rep} ${model_output_dir}/rbm2_BEST \
    trainers/train_CD_rbm2.pbtxt hidden2 \
    ${data_output_dir}/rbm2_BEST ${gpu_mem} ${main_mem} || exit 1
fi
#
# TRAIN JOINT RB
if ${clobber} || [ ! -e ${model_output_dir}/dbm_LAST ]; then
  echo "Training joint DBM."
  python ${trainer} models/joint.pbtxt \
    trainers/train_CD_joint.pbtxt eval.pbtxt || exit 1
  python ${extract_rep} ${model_output_dir}/dbm_BEST \
    trainers/train_CD_joint.pbtxt 'hidden1 hidden2' \
    ${data_output_dir}/dbm_BEST ${gpu_mem} ${main_mem} || exit 1
fi

