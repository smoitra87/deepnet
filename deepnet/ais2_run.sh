#!/bin/sh

python ais.py results/exp201/dbm_models/rbm1_BEST --train_file results/exp201/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp201_rbm_ll.pkl

sleep 2

python ais.py results/exp201/dbm_models/dbm_BEST --train_file results/exp201/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp201_dbm_ll.pkl

sleep 2

python ais.py results/exp39/dbm_models/rbm1_BEST --train_file results/exp39/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp39_rbm_ll.pkl

sleep 2

python ais.py results/exp39/dbm_models/dbm_BEST --train_file results/exp39/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp39_dbm_ll.pkl

sleep 2

python ais.py results/exp2/dbm_models/rbm1_BEST --train_file results/exp2/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp2_rbm_ll.pkl

sleep 2

python ais.py results/exp2/dbm_models/dbm_BEST --train_file results/exp2/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp2_dbm_ll.pkl

sleep 2

python ais.py results/exp59/dbm_models/rbm1_BEST --train_file results/exp59/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp59_rbm_ll.pkl

sleep 2

python ais.py results/exp59/dbm_models/dbm_BEST --train_file results/exp59/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp59_dbm_ll.pkl

sleep 2

python ais.py results/exp116/dbm_models/rbm1_BEST --train_file results/exp116/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp116_rbm_ll.pkl

sleep 2

python ais.py results/exp116/dbm_models/dbm_BEST --train_file results/exp116/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp116_dbm_ll.pkl

sleep 2

python ais.py results/exp51/dbm_models/rbm1_BEST --train_file results/exp51/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp51_rbm_ll.pkl

sleep 2

python ais.py results/exp51/dbm_models/dbm_BEST --train_file results/exp51/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp51_dbm_ll.pkl

sleep 2

python ais.py results/exp396/dbm_models/rbm1_BEST --train_file results/exp396/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp396_rbm_ll.pkl

sleep 2

python ais.py results/exp396/dbm_models/dbm_BEST --train_file results/exp396/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp396_dbm_ll.pkl

sleep 2

python ais.py results/exp195/dbm_models/rbm1_BEST --train_file results/exp195/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp195_rbm_ll.pkl

sleep 2

python ais.py results/exp195/dbm_models/dbm_BEST --train_file results/exp195/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp195_dbm_ll.pkl

sleep 2

python ais.py results/exp152/dbm_models/rbm1_BEST --train_file results/exp152/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp152_rbm_ll.pkl

sleep 2

python ais.py results/exp152/dbm_models/dbm_BEST --train_file results/exp152/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp152_dbm_ll.pkl

sleep 2

python ais.py results/exp30/dbm_models/rbm1_BEST --train_file results/exp30/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp30_rbm_ll.pkl

sleep 2

python ais.py results/exp30/dbm_models/dbm_BEST --train_file results/exp30/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp30_dbm_ll.pkl

sleep 2

python ais.py results/exp345/dbm_models/rbm1_BEST --train_file results/exp345/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp345_rbm_ll.pkl

sleep 2

python ais.py results/exp345/dbm_models/dbm_BEST --train_file results/exp345/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp345_dbm_ll.pkl

sleep 2

python ais.py results/exp293/dbm_models/rbm1_BEST --train_file results/exp293/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp293_rbm_ll.pkl

sleep 2

python ais.py results/exp293/dbm_models/dbm_BEST --train_file results/exp293/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp293_dbm_ll.pkl

sleep 2

python ais.py results/exp104/dbm_models/rbm1_BEST --train_file results/exp104/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp104_rbm_ll.pkl

sleep 2

python ais.py results/exp104/dbm_models/dbm_BEST --train_file results/exp104/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp104_dbm_ll.pkl

sleep 2

python ais.py results/exp234/dbm_models/rbm1_BEST --train_file results/exp234/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp234_rbm_ll.pkl

sleep 2

python ais.py results/exp234/dbm_models/dbm_BEST --train_file results/exp234/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp234_dbm_ll.pkl

sleep 2

python ais.py results/exp113/dbm_models/rbm1_BEST --train_file results/exp113/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp113_rbm_ll.pkl

sleep 2

python ais.py results/exp113/dbm_models/dbm_BEST --train_file results/exp113/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp113_dbm_ll.pkl

sleep 2

python ais.py results/exp141/dbm_models/rbm1_BEST --train_file results/exp141/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp141_rbm_ll.pkl

sleep 2

python ais.py results/exp141/dbm_models/dbm_BEST --train_file results/exp141/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp141_dbm_ll.pkl

sleep 2

python ais.py results/exp423/dbm_models/rbm1_BEST --train_file results/exp423/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp423_rbm_ll.pkl

sleep 2

python ais.py results/exp423/dbm_models/dbm_BEST --train_file results/exp423/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp423_dbm_ll.pkl

sleep 2

python ais.py results/exp482/dbm_models/rbm1_BEST --train_file results/exp482/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp482_rbm_ll.pkl

sleep 2

python ais.py results/exp482/dbm_models/dbm_BEST --train_file results/exp482/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp482_dbm_ll.pkl

sleep 2

python ais.py results/exp129/dbm_models/rbm1_BEST --train_file results/exp129/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp129_rbm_ll.pkl

sleep 2

python ais.py results/exp129/dbm_models/dbm_BEST --train_file results/exp129/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp129_dbm_ll.pkl

sleep 2

python ais.py results/exp267/dbm_models/rbm1_BEST --train_file results/exp267/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp267_rbm_ll.pkl

sleep 2

python ais.py results/exp267/dbm_models/dbm_BEST --train_file results/exp267/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp267_dbm_ll.pkl

sleep 2

python ais.py results/exp258/dbm_models/rbm1_BEST --train_file results/exp258/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp258_rbm_ll.pkl

sleep 2

python ais.py results/exp258/dbm_models/dbm_BEST --train_file results/exp258/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp258_dbm_ll.pkl

sleep 2

python ais.py results/exp171/dbm_models/rbm1_BEST --train_file results/exp171/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp171_rbm_ll.pkl

sleep 2

python ais.py results/exp171/dbm_models/dbm_BEST --train_file results/exp171/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp171_dbm_ll.pkl

sleep 2

python ais.py results/exp90/dbm_models/rbm1_BEST --train_file results/exp90/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp90_rbm_ll.pkl

sleep 2

python ais.py results/exp90/dbm_models/dbm_BEST --train_file results/exp90/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp90_dbm_ll.pkl

sleep 2

python ais.py results/exp399/dbm_models/rbm1_BEST --train_file results/exp399/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp399_rbm_ll.pkl

sleep 2

python ais.py results/exp399/dbm_models/dbm_BEST --train_file results/exp399/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp399_dbm_ll.pkl

sleep 2

python ais.py results/exp323/dbm_models/rbm1_BEST --train_file results/exp323/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp323_rbm_ll.pkl

sleep 2

python ais.py results/exp323/dbm_models/dbm_BEST --train_file results/exp323/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp323_dbm_ll.pkl

sleep 2

python ais.py results/exp102/dbm_models/rbm1_BEST --train_file results/exp102/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp102_rbm_ll.pkl

sleep 2

python ais.py results/exp102/dbm_models/dbm_BEST --train_file results/exp102/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp102_dbm_ll.pkl

sleep 2

python ais.py results/exp128/dbm_models/rbm1_BEST --train_file results/exp128/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp128_rbm_ll.pkl

sleep 2

python ais.py results/exp128/dbm_models/dbm_BEST --train_file results/exp128/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp128_dbm_ll.pkl

sleep 2

python ais.py results/exp240/dbm_models/rbm1_BEST --train_file results/exp240/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp240_rbm_ll.pkl

sleep 2

python ais.py results/exp240/dbm_models/dbm_BEST --train_file results/exp240/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp240_dbm_ll.pkl

sleep 2

python ais.py results/exp21/dbm_models/rbm1_BEST --train_file results/exp21/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp21_rbm_ll.pkl

sleep 2

python ais.py results/exp21/dbm_models/dbm_BEST --train_file results/exp21/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp21_dbm_ll.pkl

sleep 2

python ais.py results/exp41/dbm_models/rbm1_BEST --train_file results/exp41/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp41_rbm_ll.pkl

sleep 2

python ais.py results/exp41/dbm_models/dbm_BEST --train_file results/exp41/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp41_dbm_ll.pkl

sleep 2

python ais.py results/exp155/dbm_models/rbm1_BEST --train_file results/exp155/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp155_rbm_ll.pkl

sleep 2

python ais.py results/exp155/dbm_models/dbm_BEST --train_file results/exp155/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp155_dbm_ll.pkl

sleep 2

python ais.py results/exp185/dbm_models/rbm1_BEST --train_file results/exp185/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp185_rbm_ll.pkl

sleep 2

python ais.py results/exp185/dbm_models/dbm_BEST --train_file results/exp185/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp185_dbm_ll.pkl

sleep 2

python ais.py results/exp426/dbm_models/rbm1_BEST --train_file results/exp426/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp426_rbm_ll.pkl

sleep 2

python ais.py results/exp426/dbm_models/dbm_BEST --train_file results/exp426/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp426_dbm_ll.pkl

sleep 2

python ais.py results/exp62/dbm_models/rbm1_BEST --train_file results/exp62/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp62_rbm_ll.pkl

sleep 2

python ais.py results/exp62/dbm_models/dbm_BEST --train_file results/exp62/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp62_dbm_ll.pkl

sleep 2

python ais.py results/exp158/dbm_models/rbm1_BEST --train_file results/exp158/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp158_rbm_ll.pkl

sleep 2

python ais.py results/exp158/dbm_models/dbm_BEST --train_file results/exp158/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp158_dbm_ll.pkl

sleep 2

python ais.py results/exp393/dbm_models/rbm1_BEST --train_file results/exp393/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp393_rbm_ll.pkl

sleep 2

python ais.py results/exp393/dbm_models/dbm_BEST --train_file results/exp393/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp393_dbm_ll.pkl

sleep 2

python ais.py results/exp57/dbm_models/rbm1_BEST --train_file results/exp57/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp57_rbm_ll.pkl

sleep 2

python ais.py results/exp57/dbm_models/dbm_BEST --train_file results/exp57/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp57_dbm_ll.pkl

sleep 2

python ais.py results/exp24/dbm_models/rbm1_BEST --train_file results/exp24/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp24_rbm_ll.pkl

sleep 2

python ais.py results/exp24/dbm_models/dbm_BEST --train_file results/exp24/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp24_dbm_ll.pkl

sleep 2

python ais.py results/exp263/dbm_models/rbm1_BEST --train_file results/exp263/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp263_rbm_ll.pkl

sleep 2

python ais.py results/exp263/dbm_models/dbm_BEST --train_file results/exp263/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp263_dbm_ll.pkl

sleep 2

python ais.py results/exp29/dbm_models/rbm1_BEST --train_file results/exp29/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp29_rbm_ll.pkl

sleep 2

python ais.py results/exp29/dbm_models/dbm_BEST --train_file results/exp29/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp29_dbm_ll.pkl

sleep 2

python ais.py results/exp174/dbm_models/rbm1_BEST --train_file results/exp174/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp174_rbm_ll.pkl

sleep 2

python ais.py results/exp174/dbm_models/dbm_BEST --train_file results/exp174/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp174_dbm_ll.pkl

sleep 2

python ais.py results/exp245/dbm_models/rbm1_BEST --train_file results/exp245/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp245_rbm_ll.pkl

sleep 2

python ais.py results/exp245/dbm_models/dbm_BEST --train_file results/exp245/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp245_dbm_ll.pkl

sleep 2

python ais.py results/exp66/dbm_models/rbm1_BEST --train_file results/exp66/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp66_rbm_ll.pkl

sleep 2

python ais.py results/exp66/dbm_models/dbm_BEST --train_file results/exp66/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp66_dbm_ll.pkl

sleep 2

python ais.py results/exp261/dbm_models/rbm1_BEST --train_file results/exp261/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp261_rbm_ll.pkl

sleep 2

python ais.py results/exp261/dbm_models/dbm_BEST --train_file results/exp261/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp261_dbm_ll.pkl

sleep 2

python ais.py results/exp179/dbm_models/rbm1_BEST --train_file results/exp179/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp179_rbm_ll.pkl

sleep 2

python ais.py results/exp179/dbm_models/dbm_BEST --train_file results/exp179/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp179_dbm_ll.pkl

sleep 2

python ais.py results/exp33/dbm_models/rbm1_BEST --train_file results/exp33/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp33_rbm_ll.pkl

sleep 2

python ais.py results/exp33/dbm_models/dbm_BEST --train_file results/exp33/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp33_dbm_ll.pkl

sleep 2

python ais.py results/exp137/dbm_models/rbm1_BEST --train_file results/exp137/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp137_rbm_ll.pkl

sleep 2

python ais.py results/exp137/dbm_models/dbm_BEST --train_file results/exp137/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp137_dbm_ll.pkl

sleep 2

python ais.py results/exp63/dbm_models/rbm1_BEST --train_file results/exp63/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp63_rbm_ll.pkl

sleep 2

python ais.py results/exp63/dbm_models/dbm_BEST --train_file results/exp63/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp63_dbm_ll.pkl

sleep 2

python ais.py results/exp228/dbm_models/rbm1_BEST --train_file results/exp228/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp228_rbm_ll.pkl

sleep 2

python ais.py results/exp228/dbm_models/dbm_BEST --train_file results/exp228/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp228_dbm_ll.pkl

sleep 2

python ais.py results/exp50/dbm_models/rbm1_BEST --train_file results/exp50/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp50_rbm_ll.pkl

sleep 2

python ais.py results/exp50/dbm_models/dbm_BEST --train_file results/exp50/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp50_dbm_ll.pkl

sleep 2

python ais.py results/exp242/dbm_models/rbm1_BEST --train_file results/exp242/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp242_rbm_ll.pkl

sleep 2

python ais.py results/exp242/dbm_models/dbm_BEST --train_file results/exp242/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp242_dbm_ll.pkl

sleep 2

python ais.py results/exp95/dbm_models/rbm1_BEST --train_file results/exp95/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp95_rbm_ll.pkl

sleep 2

python ais.py results/exp95/dbm_models/dbm_BEST --train_file results/exp95/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp95_dbm_ll.pkl

sleep 2

python ais.py results/exp167/dbm_models/rbm1_BEST --train_file results/exp167/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp167_rbm_ll.pkl

sleep 2

python ais.py results/exp167/dbm_models/dbm_BEST --train_file results/exp167/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp167_dbm_ll.pkl

sleep 2

python ais.py results/exp123/dbm_models/rbm1_BEST --train_file results/exp123/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp123_rbm_ll.pkl

sleep 2

python ais.py results/exp123/dbm_models/dbm_BEST --train_file results/exp123/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp123_dbm_ll.pkl

sleep 2

python ais.py results/exp401/dbm_models/rbm1_BEST --train_file results/exp401/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp401_rbm_ll.pkl

sleep 2

python ais.py results/exp401/dbm_models/dbm_BEST --train_file results/exp401/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp401_dbm_ll.pkl

sleep 2

python ais.py results/exp290/dbm_models/rbm1_BEST --train_file results/exp290/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp290_rbm_ll.pkl

sleep 2

python ais.py results/exp290/dbm_models/dbm_BEST --train_file results/exp290/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp290_dbm_ll.pkl

sleep 2

python ais.py results/exp98/dbm_models/rbm1_BEST --train_file results/exp98/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp98_rbm_ll.pkl

sleep 2

python ais.py results/exp98/dbm_models/dbm_BEST --train_file results/exp98/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp98_dbm_ll.pkl

sleep 2

python ais.py results/exp72/dbm_models/rbm1_BEST --train_file results/exp72/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp72_rbm_ll.pkl

sleep 2

python ais.py results/exp72/dbm_models/dbm_BEST --train_file results/exp72/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp72_dbm_ll.pkl

sleep 2

python ais.py results/exp318/dbm_models/rbm1_BEST --train_file results/exp318/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp318_rbm_ll.pkl

sleep 2

python ais.py results/exp318/dbm_models/dbm_BEST --train_file results/exp318/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp318_dbm_ll.pkl

sleep 2

python ais.py results/exp78/dbm_models/rbm1_BEST --train_file results/exp78/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp78_rbm_ll.pkl

sleep 2

python ais.py results/exp78/dbm_models/dbm_BEST --train_file results/exp78/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp78_dbm_ll.pkl

sleep 2

python ais.py results/exp87/dbm_models/rbm1_BEST --train_file results/exp87/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp87_rbm_ll.pkl

sleep 2

python ais.py results/exp87/dbm_models/dbm_BEST --train_file results/exp87/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp87_dbm_ll.pkl

sleep 2

python ais.py results/exp162/dbm_models/rbm1_BEST --train_file results/exp162/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp162_rbm_ll.pkl

sleep 2

python ais.py results/exp162/dbm_models/dbm_BEST --train_file results/exp162/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp162_dbm_ll.pkl

sleep 2

python ais.py results/exp80/dbm_models/rbm1_BEST --train_file results/exp80/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp80_rbm_ll.pkl

sleep 2

python ais.py results/exp80/dbm_models/dbm_BEST --train_file results/exp80/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp80_dbm_ll.pkl

sleep 2

python ais.py results/exp8/dbm_models/rbm1_BEST --train_file results/exp8/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp8_rbm_ll.pkl

sleep 2

python ais.py results/exp8/dbm_models/dbm_BEST --train_file results/exp8/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp8_dbm_ll.pkl

sleep 2

python ais.py results/exp75/dbm_models/rbm1_BEST --train_file results/exp75/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp75_rbm_ll.pkl

sleep 2

python ais.py results/exp75/dbm_models/dbm_BEST --train_file results/exp75/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp75_dbm_ll.pkl

sleep 2

python ais.py results/exp285/dbm_models/rbm1_BEST --train_file results/exp285/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp285_rbm_ll.pkl

sleep 2

python ais.py results/exp285/dbm_models/dbm_BEST --train_file results/exp285/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp285_dbm_ll.pkl

sleep 2

python ais.py results/exp297/dbm_models/rbm1_BEST --train_file results/exp297/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp297_rbm_ll.pkl

sleep 2

python ais.py results/exp297/dbm_models/dbm_BEST --train_file results/exp297/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp297_dbm_ll.pkl

sleep 2

python ais.py results/exp366/dbm_models/rbm1_BEST --train_file results/exp366/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp366_rbm_ll.pkl

sleep 2

python ais.py results/exp366/dbm_models/dbm_BEST --train_file results/exp366/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp366_dbm_ll.pkl

sleep 2

python ais.py results/exp312/dbm_models/rbm1_BEST --train_file results/exp312/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp312_rbm_ll.pkl

sleep 2

python ais.py results/exp312/dbm_models/dbm_BEST --train_file results/exp312/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp312_dbm_ll.pkl

sleep 2

python ais.py results/exp114/dbm_models/rbm1_BEST --train_file results/exp114/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp114_rbm_ll.pkl

sleep 2

python ais.py results/exp114/dbm_models/dbm_BEST --train_file results/exp114/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp114_dbm_ll.pkl

sleep 2

python ais.py results/exp150/dbm_models/rbm1_BEST --train_file results/exp150/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp150_rbm_ll.pkl

sleep 2

python ais.py results/exp150/dbm_models/dbm_BEST --train_file results/exp150/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp150_dbm_ll.pkl

sleep 2

python ais.py results/exp369/dbm_models/rbm1_BEST --train_file results/exp369/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp369_rbm_ll.pkl

sleep 2

python ais.py results/exp369/dbm_models/dbm_BEST --train_file results/exp369/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp369_dbm_ll.pkl

sleep 2

python ais.py results/exp320/dbm_models/rbm1_BEST --train_file results/exp320/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp320_rbm_ll.pkl

sleep 2

python ais.py results/exp320/dbm_models/dbm_BEST --train_file results/exp320/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp320_dbm_ll.pkl

sleep 2

python ais.py results/exp198/dbm_models/rbm1_BEST --train_file results/exp198/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp198_rbm_ll.pkl

sleep 2

python ais.py results/exp198/dbm_models/dbm_BEST --train_file results/exp198/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp198_dbm_ll.pkl

sleep 2

python ais.py results/exp339/dbm_models/rbm1_BEST --train_file results/exp339/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp339_rbm_ll.pkl

sleep 2

python ais.py results/exp339/dbm_models/dbm_BEST --train_file results/exp339/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp339_dbm_ll.pkl

sleep 2

python ais.py results/exp86/dbm_models/rbm1_BEST --train_file results/exp86/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp86_rbm_ll.pkl

sleep 2

python ais.py results/exp86/dbm_models/dbm_BEST --train_file results/exp86/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp86_dbm_ll.pkl

sleep 2

python ais.py results/exp363/dbm_models/rbm1_BEST --train_file results/exp363/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp363_rbm_ll.pkl

sleep 2

python ais.py results/exp363/dbm_models/dbm_BEST --train_file results/exp363/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp363_dbm_ll.pkl

sleep 2

python ais.py results/exp54/dbm_models/rbm1_BEST --train_file results/exp54/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp54_rbm_ll.pkl

sleep 2

python ais.py results/exp54/dbm_models/dbm_BEST --train_file results/exp54/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp54_dbm_ll.pkl

sleep 2

python ais.py results/exp147/dbm_models/rbm1_BEST --train_file results/exp147/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp147_rbm_ll.pkl

sleep 2

python ais.py results/exp147/dbm_models/dbm_BEST --train_file results/exp147/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp147_dbm_ll.pkl

sleep 2

python ais.py results/exp183/dbm_models/rbm1_BEST --train_file results/exp183/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp183_rbm_ll.pkl

sleep 2

python ais.py results/exp183/dbm_models/dbm_BEST --train_file results/exp183/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp183_dbm_ll.pkl

sleep 2

python ais.py results/exp207/dbm_models/rbm1_BEST --train_file results/exp207/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp207_rbm_ll.pkl

sleep 2

python ais.py results/exp207/dbm_models/dbm_BEST --train_file results/exp207/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp207_dbm_ll.pkl

sleep 2

python ais.py results/exp165/dbm_models/rbm1_BEST --train_file results/exp165/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp165_rbm_ll.pkl

sleep 2

python ais.py results/exp165/dbm_models/dbm_BEST --train_file results/exp165/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp165_dbm_ll.pkl

sleep 2

python ais.py results/exp255/dbm_models/rbm1_BEST --train_file results/exp255/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp255_rbm_ll.pkl

sleep 2

python ais.py results/exp255/dbm_models/dbm_BEST --train_file results/exp255/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp255_dbm_ll.pkl

sleep 2

python ais.py results/exp300/dbm_models/rbm1_BEST --train_file results/exp300/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp300_rbm_ll.pkl

sleep 2

python ais.py results/exp300/dbm_models/dbm_BEST --train_file results/exp300/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp300_dbm_ll.pkl

sleep 2

python ais.py results/exp83/dbm_models/rbm1_BEST --train_file results/exp83/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp83_rbm_ll.pkl

sleep 2

python ais.py results/exp83/dbm_models/dbm_BEST --train_file results/exp83/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp83_dbm_ll.pkl

sleep 2

python ais.py results/exp15/dbm_models/rbm1_BEST --train_file results/exp15/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp15_rbm_ll.pkl

sleep 2

python ais.py results/exp15/dbm_models/dbm_BEST --train_file results/exp15/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp15_dbm_ll.pkl

sleep 2

python ais.py results/exp47/dbm_models/rbm1_BEST --train_file results/exp47/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp47_rbm_ll.pkl

sleep 2

python ais.py results/exp47/dbm_models/dbm_BEST --train_file results/exp47/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp47_dbm_ll.pkl

sleep 2

python ais.py results/exp132/dbm_models/rbm1_BEST --train_file results/exp132/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp132_rbm_ll.pkl

sleep 2

python ais.py results/exp132/dbm_models/dbm_BEST --train_file results/exp132/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp132_dbm_ll.pkl

sleep 2

python ais.py results/exp44/dbm_models/rbm1_BEST --train_file results/exp44/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp44_rbm_ll.pkl

sleep 2

python ais.py results/exp44/dbm_models/dbm_BEST --train_file results/exp44/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp44_dbm_ll.pkl

sleep 2

python ais.py results/exp471/dbm_models/rbm1_BEST --train_file results/exp471/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp471_rbm_ll.pkl

sleep 2

python ais.py results/exp471/dbm_models/dbm_BEST --train_file results/exp471/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp471_dbm_ll.pkl

sleep 2

python ais.py results/exp17/dbm_models/rbm1_BEST --train_file results/exp17/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp17_rbm_ll.pkl

sleep 2

python ais.py results/exp17/dbm_models/dbm_BEST --train_file results/exp17/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp17_dbm_ll.pkl

sleep 2

python ais.py results/exp281/dbm_models/rbm1_BEST --train_file results/exp281/trainers/train_CD_rbm1.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp281_rbm_ll.pkl

sleep 2

python ais.py results/exp281/dbm_models/dbm_BEST --train_file results/exp281/trainers/train_CD_joint.pbtxt --numchains 1 --numchains_unclamped 100 --schedule slow --outf results/likelihoods/exp281_dbm_ll.pkl

sleep 2

