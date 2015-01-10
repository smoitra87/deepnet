#!/bin/sh

python ais.py results/exp201/dbm_models/rbm1_BEST --train_file results/exp201/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp201_rbm_ll.pkl

python ais.py results/exp201/dbm_models/dbm_BEST --train_file results/exp201/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp201_dbm_ll.pkl

python ais.py results/exp326/dbm_models/rbm1_BEST --train_file results/exp326/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp326_rbm_ll.pkl

python ais.py results/exp326/dbm_models/dbm_BEST --train_file results/exp326/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp326_dbm_ll.pkl

python ais.py results/exp59/dbm_models/rbm1_BEST --train_file results/exp59/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp59_rbm_ll.pkl

python ais.py results/exp59/dbm_models/dbm_BEST --train_file results/exp59/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp59_dbm_ll.pkl

python ais.py results/exp108/dbm_models/rbm1_BEST --train_file results/exp108/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp108_rbm_ll.pkl

python ais.py results/exp108/dbm_models/dbm_BEST --train_file results/exp108/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp108_dbm_ll.pkl

python ais.py results/exp396/dbm_models/rbm1_BEST --train_file results/exp396/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp396_rbm_ll.pkl

python ais.py results/exp396/dbm_models/dbm_BEST --train_file results/exp396/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp396_dbm_ll.pkl

python ais.py results/exp239/dbm_models/rbm1_BEST --train_file results/exp239/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp239_rbm_ll.pkl

python ais.py results/exp239/dbm_models/dbm_BEST --train_file results/exp239/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp239_dbm_ll.pkl

python ais.py results/exp30/dbm_models/rbm1_BEST --train_file results/exp30/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp30_rbm_ll.pkl

python ais.py results/exp30/dbm_models/dbm_BEST --train_file results/exp30/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp30_dbm_ll.pkl

python ais.py results/exp269/dbm_models/rbm1_BEST --train_file results/exp269/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp269_rbm_ll.pkl

python ais.py results/exp269/dbm_models/dbm_BEST --train_file results/exp269/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp269_dbm_ll.pkl

python ais.py results/exp104/dbm_models/rbm1_BEST --train_file results/exp104/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp104_rbm_ll.pkl

python ais.py results/exp104/dbm_models/dbm_BEST --train_file results/exp104/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp104_dbm_ll.pkl

python ais.py results/exp266/dbm_models/rbm1_BEST --train_file results/exp266/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp266_rbm_ll.pkl

python ais.py results/exp266/dbm_models/dbm_BEST --train_file results/exp266/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp266_dbm_ll.pkl

python ais.py results/exp141/dbm_models/rbm1_BEST --train_file results/exp141/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp141_rbm_ll.pkl

python ais.py results/exp141/dbm_models/dbm_BEST --train_file results/exp141/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp141_dbm_ll.pkl

python ais.py results/exp177/dbm_models/rbm1_BEST --train_file results/exp177/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp177_rbm_ll.pkl

python ais.py results/exp177/dbm_models/dbm_BEST --train_file results/exp177/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp177_dbm_ll.pkl

python ais.py results/exp129/dbm_models/rbm1_BEST --train_file results/exp129/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp129_rbm_ll.pkl

python ais.py results/exp129/dbm_models/dbm_BEST --train_file results/exp129/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp129_dbm_ll.pkl

python ais.py results/exp45/dbm_models/rbm1_BEST --train_file results/exp45/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp45_rbm_ll.pkl

python ais.py results/exp45/dbm_models/dbm_BEST --train_file results/exp45/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp45_dbm_ll.pkl

python ais.py results/exp171/dbm_models/rbm1_BEST --train_file results/exp171/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp171_rbm_ll.pkl

python ais.py results/exp171/dbm_models/dbm_BEST --train_file results/exp171/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp171_dbm_ll.pkl

python ais.py results/exp182/dbm_models/rbm1_BEST --train_file results/exp182/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp182_rbm_ll.pkl

python ais.py results/exp182/dbm_models/dbm_BEST --train_file results/exp182/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp182_dbm_ll.pkl

python ais.py results/exp323/dbm_models/rbm1_BEST --train_file results/exp323/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp323_rbm_ll.pkl

python ais.py results/exp323/dbm_models/dbm_BEST --train_file results/exp323/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp323_dbm_ll.pkl

python ais.py results/exp344/dbm_models/rbm1_BEST --train_file results/exp344/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp344_rbm_ll.pkl

python ais.py results/exp344/dbm_models/dbm_BEST --train_file results/exp344/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp344_dbm_ll.pkl

python ais.py results/exp240/dbm_models/rbm1_BEST --train_file results/exp240/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp240_rbm_ll.pkl

python ais.py results/exp240/dbm_models/dbm_BEST --train_file results/exp240/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp240_dbm_ll.pkl

python ais.py results/exp374/dbm_models/rbm1_BEST --train_file results/exp374/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp374_rbm_ll.pkl

python ais.py results/exp374/dbm_models/dbm_BEST --train_file results/exp374/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp374_dbm_ll.pkl

python ais.py results/exp155/dbm_models/rbm1_BEST --train_file results/exp155/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp155_rbm_ll.pkl

python ais.py results/exp155/dbm_models/dbm_BEST --train_file results/exp155/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp155_dbm_ll.pkl

python ais.py results/exp212/dbm_models/rbm1_BEST --train_file results/exp212/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp212_rbm_ll.pkl

python ais.py results/exp212/dbm_models/dbm_BEST --train_file results/exp212/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp212_dbm_ll.pkl

python ais.py results/exp62/dbm_models/rbm1_BEST --train_file results/exp62/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp62_rbm_ll.pkl

python ais.py results/exp62/dbm_models/dbm_BEST --train_file results/exp62/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp62_dbm_ll.pkl

python ais.py results/exp192/dbm_models/rbm1_BEST --train_file results/exp192/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp192_rbm_ll.pkl

python ais.py results/exp192/dbm_models/dbm_BEST --train_file results/exp192/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp192_dbm_ll.pkl

python ais.py results/exp57/dbm_models/rbm1_BEST --train_file results/exp57/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp57_rbm_ll.pkl

python ais.py results/exp57/dbm_models/dbm_BEST --train_file results/exp57/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp57_dbm_ll.pkl

python ais.py results/exp96/dbm_models/rbm1_BEST --train_file results/exp96/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp96_rbm_ll.pkl

python ais.py results/exp96/dbm_models/dbm_BEST --train_file results/exp96/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp96_dbm_ll.pkl

python ais.py results/exp29/dbm_models/rbm1_BEST --train_file results/exp29/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp29_rbm_ll.pkl

python ais.py results/exp29/dbm_models/dbm_BEST --train_file results/exp29/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp29_dbm_ll.pkl

python ais.py results/exp107/dbm_models/rbm1_BEST --train_file results/exp107/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp107_rbm_ll.pkl

python ais.py results/exp107/dbm_models/dbm_BEST --train_file results/exp107/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp107_dbm_ll.pkl

python ais.py results/exp66/dbm_models/rbm1_BEST --train_file results/exp66/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp66_rbm_ll.pkl

python ais.py results/exp66/dbm_models/dbm_BEST --train_file results/exp66/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp66_dbm_ll.pkl

python ais.py results/exp189/dbm_models/rbm1_BEST --train_file results/exp189/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp189_rbm_ll.pkl

python ais.py results/exp189/dbm_models/dbm_BEST --train_file results/exp189/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp189_dbm_ll.pkl

python ais.py results/exp33/dbm_models/rbm1_BEST --train_file results/exp33/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp33_rbm_ll.pkl

python ais.py results/exp33/dbm_models/dbm_BEST --train_file results/exp33/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp33_dbm_ll.pkl

python ais.py results/exp188/dbm_models/rbm1_BEST --train_file results/exp188/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp188_rbm_ll.pkl

python ais.py results/exp188/dbm_models/dbm_BEST --train_file results/exp188/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp188_dbm_ll.pkl

python ais.py results/exp228/dbm_models/rbm1_BEST --train_file results/exp228/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp228_rbm_ll.pkl

python ais.py results/exp228/dbm_models/dbm_BEST --train_file results/exp228/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp228_dbm_ll.pkl

python ais.py results/exp6/dbm_models/rbm1_BEST --train_file results/exp6/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp6_rbm_ll.pkl

python ais.py results/exp6/dbm_models/dbm_BEST --train_file results/exp6/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp6_dbm_ll.pkl

python ais.py results/exp95/dbm_models/rbm1_BEST --train_file results/exp95/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp95_rbm_ll.pkl

python ais.py results/exp95/dbm_models/dbm_BEST --train_file results/exp95/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp95_dbm_ll.pkl

python ais.py results/exp270/dbm_models/rbm1_BEST --train_file results/exp270/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp270_rbm_ll.pkl

python ais.py results/exp270/dbm_models/dbm_BEST --train_file results/exp270/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp270_dbm_ll.pkl

python ais.py results/exp401/dbm_models/rbm1_BEST --train_file results/exp401/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp401_rbm_ll.pkl

python ais.py results/exp401/dbm_models/dbm_BEST --train_file results/exp401/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp401_dbm_ll.pkl

python ais.py results/exp138/dbm_models/rbm1_BEST --train_file results/exp138/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp138_rbm_ll.pkl

python ais.py results/exp138/dbm_models/dbm_BEST --train_file results/exp138/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp138_dbm_ll.pkl

python ais.py results/exp72/dbm_models/rbm1_BEST --train_file results/exp72/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp72_rbm_ll.pkl

python ais.py results/exp72/dbm_models/dbm_BEST --train_file results/exp72/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp72_dbm_ll.pkl

python ais.py results/exp336/dbm_models/rbm1_BEST --train_file results/exp336/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp336_rbm_ll.pkl

python ais.py results/exp336/dbm_models/dbm_BEST --train_file results/exp336/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp336_dbm_ll.pkl

python ais.py results/exp87/dbm_models/rbm1_BEST --train_file results/exp87/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp87_rbm_ll.pkl

python ais.py results/exp87/dbm_models/dbm_BEST --train_file results/exp87/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp87_dbm_ll.pkl

python ais.py results/exp420/dbm_models/rbm1_BEST --train_file results/exp420/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp420_rbm_ll.pkl

python ais.py results/exp420/dbm_models/dbm_BEST --train_file results/exp420/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp420_dbm_ll.pkl

python ais.py results/exp8/dbm_models/rbm1_BEST --train_file results/exp8/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp8_rbm_ll.pkl

python ais.py results/exp8/dbm_models/dbm_BEST --train_file results/exp8/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp8_dbm_ll.pkl

python ais.py results/exp153/dbm_models/rbm1_BEST --train_file results/exp153/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp153_rbm_ll.pkl

python ais.py results/exp153/dbm_models/dbm_BEST --train_file results/exp153/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp153_dbm_ll.pkl

python ais.py results/exp297/dbm_models/rbm1_BEST --train_file results/exp297/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp297_rbm_ll.pkl

python ais.py results/exp297/dbm_models/dbm_BEST --train_file results/exp297/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp297_dbm_ll.pkl

python ais.py results/exp156/dbm_models/rbm1_BEST --train_file results/exp156/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp156_rbm_ll.pkl

python ais.py results/exp156/dbm_models/dbm_BEST --train_file results/exp156/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp156_dbm_ll.pkl

python ais.py results/exp114/dbm_models/rbm1_BEST --train_file results/exp114/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp114_rbm_ll.pkl

python ais.py results/exp114/dbm_models/dbm_BEST --train_file results/exp114/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp114_dbm_ll.pkl

python ais.py results/exp144/dbm_models/rbm1_BEST --train_file results/exp144/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp144_rbm_ll.pkl

python ais.py results/exp144/dbm_models/dbm_BEST --train_file results/exp144/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp144_dbm_ll.pkl

python ais.py results/exp320/dbm_models/rbm1_BEST --train_file results/exp320/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp320_rbm_ll.pkl

python ais.py results/exp320/dbm_models/dbm_BEST --train_file results/exp320/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp320_dbm_ll.pkl

python ais.py results/exp372/dbm_models/rbm1_BEST --train_file results/exp372/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp372_rbm_ll.pkl

python ais.py results/exp372/dbm_models/dbm_BEST --train_file results/exp372/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp372_dbm_ll.pkl

python ais.py results/exp86/dbm_models/rbm1_BEST --train_file results/exp86/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp86_rbm_ll.pkl

python ais.py results/exp86/dbm_models/dbm_BEST --train_file results/exp86/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp86_dbm_ll.pkl

python ais.py results/exp164/dbm_models/rbm1_BEST --train_file results/exp164/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp164_rbm_ll.pkl

python ais.py results/exp164/dbm_models/dbm_BEST --train_file results/exp164/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp164_dbm_ll.pkl

python ais.py results/exp147/dbm_models/rbm1_BEST --train_file results/exp147/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp147_rbm_ll.pkl

python ais.py results/exp147/dbm_models/dbm_BEST --train_file results/exp147/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp147_dbm_ll.pkl

python ais.py results/exp264/dbm_models/rbm1_BEST --train_file results/exp264/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp264_rbm_ll.pkl

python ais.py results/exp264/dbm_models/dbm_BEST --train_file results/exp264/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp264_dbm_ll.pkl

python ais.py results/exp165/dbm_models/rbm1_BEST --train_file results/exp165/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp165_rbm_ll.pkl

python ais.py results/exp165/dbm_models/dbm_BEST --train_file results/exp165/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp165_dbm_ll.pkl

python ais.py results/exp213/dbm_models/rbm1_BEST --train_file results/exp213/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp213_rbm_ll.pkl

python ais.py results/exp213/dbm_models/dbm_BEST --train_file results/exp213/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp213_dbm_ll.pkl

python ais.py results/exp83/dbm_models/rbm1_BEST --train_file results/exp83/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp83_rbm_ll.pkl

python ais.py results/exp83/dbm_models/dbm_BEST --train_file results/exp83/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp83_dbm_ll.pkl

python ais.py results/exp315/dbm_models/rbm1_BEST --train_file results/exp315/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp315_rbm_ll.pkl

python ais.py results/exp315/dbm_models/dbm_BEST --train_file results/exp315/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp315_dbm_ll.pkl

python ais.py results/exp132/dbm_models/rbm1_BEST --train_file results/exp132/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp132_rbm_ll.pkl

python ais.py results/exp132/dbm_models/dbm_BEST --train_file results/exp132/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp132_dbm_ll.pkl

python ais.py results/exp197/dbm_models/rbm1_BEST --train_file results/exp197/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp197_rbm_ll.pkl

python ais.py results/exp197/dbm_models/dbm_BEST --train_file results/exp197/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp197_dbm_ll.pkl

python ais.py results/exp17/dbm_models/rbm1_BEST --train_file results/exp17/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp17_rbm_ll.pkl

python ais.py results/exp17/dbm_models/dbm_BEST --train_file results/exp17/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp17_dbm_ll.pkl

python ais.py results/exp180/dbm_models/rbm1_BEST --train_file results/exp180/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp180_rbm_ll.pkl

python ais.py results/exp180/dbm_models/dbm_BEST --train_file results/exp180/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp180_dbm_ll.pkl

