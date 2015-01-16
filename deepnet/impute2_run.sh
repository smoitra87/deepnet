#!/bin/sh

python impute.py --model_file exp_ismb_rush/exp501/dbm_models/rbm1_BEST --train_file exp_ismb_rush/exp501/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf exp_ismb_rush/likelihoods/exp501_rbm_pll.pkl

sleep 2

python impute.py --model_file exp_ismb_rush/exp501/dbm_models/dbm_BEST --train_file exp_ismb_rush/exp501/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf exp_ismb_rush/likelihoods/exp501_dbm_pll.pkl

sleep 2

