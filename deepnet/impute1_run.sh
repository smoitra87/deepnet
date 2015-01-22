#!/bin/sh

python impute.py --model_file exp_ismb_rush/exp601/dbm_models/rbm1_BEST --train_file exp_ismb_rush/exp601/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf exp_ismb_rush/likelihoods/exp601_rbm_pll.pkl

sleep 2

python impute.py --model_file exp_ismb_rush/exp601/dbm_models/dbm_BEST --train_file exp_ismb_rush/exp601/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf exp_ismb_rush/likelihoods/exp601_dbm_pll.pkl

sleep 2

python impute.py --model_file exp_ismb_rush/exp500/dbm_models/rbm1_BEST --train_file exp_ismb_rush/exp500/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf exp_ismb_rush/likelihoods/exp500_rbm_pll.pkl

sleep 2

python impute.py --model_file exp_ismb_rush/exp500/dbm_models/dbm_BEST --train_file exp_ismb_rush/exp500/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf exp_ismb_rush/likelihoods/exp500_dbm_pll.pkl

sleep 2

