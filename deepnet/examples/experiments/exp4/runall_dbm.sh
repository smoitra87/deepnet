#!/bin/bash
# This script trains a Multimodal DBN using deepnet.
# Before running this script download and extract data from
# http://www.cs.toronto.edu/~nitish/multimodal

# Location of deepnet. EDIT this for your setup.
deepnet=/storage/data1/dbm/deepnet/deepnet

# Location of the downloaded data. This is also the place where learned models
# and representations extracted from them will be written. Should have lots of
# space ~30G. EDIT this for your setup.
prefix=/storage/data1/dbm/deepnet/deepnet/examples/PF11427

results_dir=/storage/data1/dbm/deepnet/deepnet/examples/results/exp4

# Amount of gpu memory to be used for buffering data. Adjust this for your GPU.
# For a GPU with 6GB memory, this should be around 4GB.
# If you get 'out of memory' errors, try decreasing this.
gpu_mem=4G

# Amount of main memory to be used for buffering data. Adjust this according to
# your RAM. Having atleast 16G is ideal.
main_mem=20G


trainer=${deepnet}/trainer.py
extract_rep=${deepnet}/extract_rbm_representation.py
model_output_dir=${results_dir}/dbm_models
data_output_dir=${results_dir}/dbm_reps
clobber=true

mkdir -p ${model_output_dir}
mkdir -p ${data_output_dir}

# Set up paths, split data into with/without text.
echo Setting up data
python setup_data.py ${prefix} ${model_output_dir} ${data_output_dir} \
  ${gpu_mem} ${main_mem} ${numsplits} || exit 1

# TRAIN JOINT RB
if ${clobber} || [ ! -e ${model_output_dir}/joint_LAST ]; then
  echo "Training joint DBM."
  python ${trainer} models/joint.pbtxt \
    trainers/train_CD_joint.pbtxt eval.pbtxt || exit 1
  python ${extract_rep} ${model_output_dir}/dbm_BEST \
    trainers/train_CD_joint.pbtxt 'hidden1 hidden2' \
    ${data_output_dir}/dbm_BEST ${gpu_mem} ${main_mem} || exit 1
fi

