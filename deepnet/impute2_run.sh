#!/bin/sh

python impute.py --model_file results/exp201/dbm_models/rbm1_BEST --train_file results/exp201/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp201_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp201/dbm_models/dbm_BEST --train_file results/exp201/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp201_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp326/dbm_models/rbm1_BEST --train_file results/exp326/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp326_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp326/dbm_models/dbm_BEST --train_file results/exp326/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp326_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp59/dbm_models/rbm1_BEST --train_file results/exp59/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp59_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp59/dbm_models/dbm_BEST --train_file results/exp59/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp59_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp108/dbm_models/rbm1_BEST --train_file results/exp108/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp108_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp108/dbm_models/dbm_BEST --train_file results/exp108/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp108_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp288/dbm_models/rbm1_BEST --train_file results/exp288/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp288_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp288/dbm_models/dbm_BEST --train_file results/exp288/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp288_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp48/dbm_models/rbm1_BEST --train_file results/exp48/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp48_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp48/dbm_models/dbm_BEST --train_file results/exp48/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp48_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp345/dbm_models/rbm1_BEST --train_file results/exp345/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp345_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp345/dbm_models/dbm_BEST --train_file results/exp345/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp345_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp104/dbm_models/rbm1_BEST --train_file results/exp104/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp104_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp104/dbm_models/dbm_BEST --train_file results/exp104/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp104_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp266/dbm_models/rbm1_BEST --train_file results/exp266/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp266_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp266/dbm_models/dbm_BEST --train_file results/exp266/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp266_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp141/dbm_models/rbm1_BEST --train_file results/exp141/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp141_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp141/dbm_models/dbm_BEST --train_file results/exp141/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp141_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp177/dbm_models/rbm1_BEST --train_file results/exp177/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp177_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp177/dbm_models/dbm_BEST --train_file results/exp177/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp177_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp129/dbm_models/rbm1_BEST --train_file results/exp129/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp129_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp129/dbm_models/dbm_BEST --train_file results/exp129/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp129_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp258/dbm_models/rbm1_BEST --train_file results/exp258/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp258_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp258/dbm_models/dbm_BEST --train_file results/exp258/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp258_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp9/dbm_models/rbm1_BEST --train_file results/exp9/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp9_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp9/dbm_models/dbm_BEST --train_file results/exp9/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp9_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp282/dbm_models/rbm1_BEST --train_file results/exp282/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp282_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp282/dbm_models/dbm_BEST --train_file results/exp282/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp282_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp102/dbm_models/rbm1_BEST --train_file results/exp102/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp102_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp102/dbm_models/dbm_BEST --train_file results/exp102/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp102_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp101/dbm_models/rbm1_BEST --train_file results/exp101/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp101_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp101/dbm_models/dbm_BEST --train_file results/exp101/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp101_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp41/dbm_models/rbm1_BEST --train_file results/exp41/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp41_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp41/dbm_models/dbm_BEST --train_file results/exp41/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp41_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp185/dbm_models/rbm1_BEST --train_file results/exp185/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp185_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp185/dbm_models/dbm_BEST --train_file results/exp185/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp185_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp168/dbm_models/rbm1_BEST --train_file results/exp168/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp168_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp168/dbm_models/dbm_BEST --train_file results/exp168/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp168_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp393/dbm_models/rbm1_BEST --train_file results/exp393/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp393_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp393/dbm_models/dbm_BEST --train_file results/exp393/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp393_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp24/dbm_models/rbm1_BEST --train_file results/exp24/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp24_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp24/dbm_models/dbm_BEST --train_file results/exp24/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp24_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp347/dbm_models/rbm1_BEST --train_file results/exp347/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp347_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp347/dbm_models/dbm_BEST --train_file results/exp347/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp347_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp174/dbm_models/rbm1_BEST --train_file results/exp174/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp174_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp174/dbm_models/dbm_BEST --train_file results/exp174/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp174_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp390/dbm_models/rbm1_BEST --train_file results/exp390/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp390_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp390/dbm_models/dbm_BEST --train_file results/exp390/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp390_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp261/dbm_models/rbm1_BEST --train_file results/exp261/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp261_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp261/dbm_models/dbm_BEST --train_file results/exp261/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp261_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp33/dbm_models/rbm1_BEST --train_file results/exp33/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp33_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp33/dbm_models/dbm_BEST --train_file results/exp33/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp33_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp60/dbm_models/rbm1_BEST --train_file results/exp60/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp60_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp60/dbm_models/dbm_BEST --train_file results/exp60/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp60_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp6/dbm_models/rbm1_BEST --train_file results/exp6/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp6_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp6/dbm_models/dbm_BEST --train_file results/exp6/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp6_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp167/dbm_models/rbm1_BEST --train_file results/exp167/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp167_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp167/dbm_models/dbm_BEST --train_file results/exp167/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp167_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp194/dbm_models/rbm1_BEST --train_file results/exp194/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp194_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp194/dbm_models/dbm_BEST --train_file results/exp194/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp194_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp138/dbm_models/rbm1_BEST --train_file results/exp138/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp138_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp138/dbm_models/dbm_BEST --train_file results/exp138/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp138_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp72/dbm_models/rbm1_BEST --train_file results/exp72/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp72_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp72/dbm_models/dbm_BEST --train_file results/exp72/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp72_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp336/dbm_models/rbm1_BEST --train_file results/exp336/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp336_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp336/dbm_models/dbm_BEST --train_file results/exp336/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp336_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp162/dbm_models/rbm1_BEST --train_file results/exp162/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp162_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp162/dbm_models/dbm_BEST --train_file results/exp162/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp162_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp8/dbm_models/rbm1_BEST --train_file results/exp8/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp8_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp8/dbm_models/dbm_BEST --train_file results/exp8/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp8_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp285/dbm_models/rbm1_BEST --train_file results/exp285/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp285_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp285/dbm_models/dbm_BEST --train_file results/exp285/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp285_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp170/dbm_models/rbm1_BEST --train_file results/exp170/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp170_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp170/dbm_models/dbm_BEST --train_file results/exp170/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp170_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp312/dbm_models/rbm1_BEST --train_file results/exp312/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp312_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp312/dbm_models/dbm_BEST --train_file results/exp312/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp312_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp150/dbm_models/rbm1_BEST --train_file results/exp150/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp150_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp150/dbm_models/dbm_BEST --train_file results/exp150/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp150_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp309/dbm_models/rbm1_BEST --train_file results/exp309/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp309_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp309/dbm_models/dbm_BEST --train_file results/exp309/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp309_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp372/dbm_models/rbm1_BEST --train_file results/exp372/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp372_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp372/dbm_models/dbm_BEST --train_file results/exp372/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp372_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp86/dbm_models/rbm1_BEST --train_file results/exp86/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp86_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp86/dbm_models/dbm_BEST --train_file results/exp86/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp86_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp164/dbm_models/rbm1_BEST --train_file results/exp164/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp164_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp164/dbm_models/dbm_BEST --train_file results/exp164/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp164_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp147/dbm_models/rbm1_BEST --train_file results/exp147/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp147_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp147/dbm_models/dbm_BEST --train_file results/exp147/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp147_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp264/dbm_models/rbm1_BEST --train_file results/exp264/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp264_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp264/dbm_models/dbm_BEST --train_file results/exp264/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp264_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp165/dbm_models/rbm1_BEST --train_file results/exp165/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp165_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp165/dbm_models/dbm_BEST --train_file results/exp165/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp165_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp213/dbm_models/rbm1_BEST --train_file results/exp213/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp213_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp213/dbm_models/dbm_BEST --train_file results/exp213/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp213_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp83/dbm_models/rbm1_BEST --train_file results/exp83/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp83_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp83/dbm_models/dbm_BEST --train_file results/exp83/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp83_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp315/dbm_models/rbm1_BEST --train_file results/exp315/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp315_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp315/dbm_models/dbm_BEST --train_file results/exp315/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp315_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp56/dbm_models/rbm1_BEST --train_file results/exp56/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp56_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp56/dbm_models/dbm_BEST --train_file results/exp56/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp56_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp159/dbm_models/rbm1_BEST --train_file results/exp159/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp159_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp159/dbm_models/dbm_BEST --train_file results/exp159/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp159_dbm_pll.pkl

sleep 2

