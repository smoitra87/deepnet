#!/bin/sh

( python impute.py  --model_file experiments/exp19000/dbm_models/rbm1_1430591298 --train_file  experiments/exp19000/trainers/train_CD_rbm1.pbtxt --mf-steps 2 --outf experiments/likelihoods/exp19000/exp19000_rbm1_1430591298_blosum90.pkl --infer-method mf --blosum90 ) & 

( python impute.py  --model_file experiments/exp19001/dbm_models/rbm1_1430592635 --train_file  experiments/exp19001/trainers/train_CD_rbm1.pbtxt --mf-steps 2 --outf experiments/likelihoods/exp19001/exp19001_rbm1_1430592635_blosum90.pkl --infer-method mf --blosum90 ) & 

( python impute.py  --model_file experiments/exp19002/dbm_models/dbm_1430596382 --train_file  experiments/exp19002/trainers/train_CD_joint.pbtxt --mf-steps 2 --outf experiments/likelihoods/exp19002/exp19002_dbm_1430596382_blosum90.pkl --infer-method mf --blosum90 ) & 

( python impute.py  --model_file experiments/exp19003/dbm_models/dbm_1430596153 --train_file  experiments/exp19003/trainers/train_CD_joint.pbtxt --mf-steps 2 --outf experiments/likelihoods/exp19003/exp19003_dbm_1430596153_blosum90.pkl --infer-method mf --blosum90 ) & 
