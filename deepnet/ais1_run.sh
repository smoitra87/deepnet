#!/bin/sh

python ais.py results/exp299/dbm_models/rbm1_BEST --train_file results/exp299/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp299_rbm_ll.pkl

python ais.py results/exp299/dbm_models/dbm_BEST --train_file results/exp299/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp299_dbm_ll.pkl

python ais.py results/exp39/dbm_models/rbm1_BEST --train_file results/exp39/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp39_rbm_ll.pkl

python ais.py results/exp39/dbm_models/dbm_BEST --train_file results/exp39/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp39_dbm_ll.pkl

python ais.py results/exp186/dbm_models/rbm1_BEST --train_file results/exp186/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp186_rbm_ll.pkl

python ais.py results/exp186/dbm_models/dbm_BEST --train_file results/exp186/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp186_dbm_ll.pkl

python ais.py results/exp116/dbm_models/rbm1_BEST --train_file results/exp116/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp116_rbm_ll.pkl

python ais.py results/exp116/dbm_models/dbm_BEST --train_file results/exp116/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp116_dbm_ll.pkl

python ais.py results/exp350/dbm_models/rbm1_BEST --train_file results/exp350/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp350_rbm_ll.pkl

python ais.py results/exp350/dbm_models/dbm_BEST --train_file results/exp350/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp350_dbm_ll.pkl

python ais.py results/exp195/dbm_models/rbm1_BEST --train_file results/exp195/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp195_rbm_ll.pkl

python ais.py results/exp195/dbm_models/dbm_BEST --train_file results/exp195/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp195_dbm_ll.pkl

python ais.py results/exp48/dbm_models/rbm1_BEST --train_file results/exp48/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp48_rbm_ll.pkl

python ais.py results/exp48/dbm_models/dbm_BEST --train_file results/exp48/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp48_dbm_ll.pkl

python ais.py results/exp345/dbm_models/rbm1_BEST --train_file results/exp345/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp345_rbm_ll.pkl

python ais.py results/exp345/dbm_models/dbm_BEST --train_file results/exp345/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp345_dbm_ll.pkl

python ais.py results/exp236/dbm_models/rbm1_BEST --train_file results/exp236/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp236_rbm_ll.pkl

python ais.py results/exp236/dbm_models/dbm_BEST --train_file results/exp236/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp236_dbm_ll.pkl

python ais.py results/exp234/dbm_models/rbm1_BEST --train_file results/exp234/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp234_rbm_ll.pkl

python ais.py results/exp234/dbm_models/dbm_BEST --train_file results/exp234/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp234_dbm_ll.pkl

python ais.py results/exp231/dbm_models/rbm1_BEST --train_file results/exp231/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp231_rbm_ll.pkl

python ais.py results/exp231/dbm_models/dbm_BEST --train_file results/exp231/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp231_dbm_ll.pkl

python ais.py results/exp423/dbm_models/rbm1_BEST --train_file results/exp423/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp423_rbm_ll.pkl

python ais.py results/exp423/dbm_models/dbm_BEST --train_file results/exp423/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp423_dbm_ll.pkl

python ais.py results/exp125/dbm_models/rbm1_BEST --train_file results/exp125/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp125_rbm_ll.pkl

python ais.py results/exp125/dbm_models/dbm_BEST --train_file results/exp125/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp125_dbm_ll.pkl

python ais.py results/exp267/dbm_models/rbm1_BEST --train_file results/exp267/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp267_rbm_ll.pkl

python ais.py results/exp267/dbm_models/dbm_BEST --train_file results/exp267/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp267_dbm_ll.pkl

python ais.py results/exp36/dbm_models/rbm1_BEST --train_file results/exp36/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp36_rbm_ll.pkl

python ais.py results/exp36/dbm_models/dbm_BEST --train_file results/exp36/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp36_dbm_ll.pkl

python ais.py results/exp90/dbm_models/rbm1_BEST --train_file results/exp90/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp90_rbm_ll.pkl

python ais.py results/exp90/dbm_models/dbm_BEST --train_file results/exp90/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp90_dbm_ll.pkl

python ais.py results/exp282/dbm_models/rbm1_BEST --train_file results/exp282/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp282_rbm_ll.pkl

python ais.py results/exp282/dbm_models/dbm_BEST --train_file results/exp282/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp282_dbm_ll.pkl

python ais.py results/exp102/dbm_models/rbm1_BEST --train_file results/exp102/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp102_rbm_ll.pkl

python ais.py results/exp102/dbm_models/dbm_BEST --train_file results/exp102/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp102_dbm_ll.pkl

python ais.py results/exp216/dbm_models/rbm1_BEST --train_file results/exp216/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp216_rbm_ll.pkl

python ais.py results/exp216/dbm_models/dbm_BEST --train_file results/exp216/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp216_dbm_ll.pkl

python ais.py results/exp21/dbm_models/rbm1_BEST --train_file results/exp21/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp21_rbm_ll.pkl

python ais.py results/exp21/dbm_models/dbm_BEST --train_file results/exp21/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp21_dbm_ll.pkl

python ais.py results/exp68/dbm_models/rbm1_BEST --train_file results/exp68/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp68_rbm_ll.pkl

python ais.py results/exp68/dbm_models/dbm_BEST --train_file results/exp68/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp68_dbm_ll.pkl

python ais.py results/exp185/dbm_models/rbm1_BEST --train_file results/exp185/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp185_rbm_ll.pkl

python ais.py results/exp185/dbm_models/dbm_BEST --train_file results/exp185/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp185_dbm_ll.pkl

python ais.py results/exp168/dbm_models/rbm1_BEST --train_file results/exp168/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp168_rbm_ll.pkl

python ais.py results/exp168/dbm_models/dbm_BEST --train_file results/exp168/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp168_dbm_ll.pkl

python ais.py results/exp158/dbm_models/rbm1_BEST --train_file results/exp158/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp158_rbm_ll.pkl

python ais.py results/exp158/dbm_models/dbm_BEST --train_file results/exp158/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp158_dbm_ll.pkl

python ais.py results/exp296/dbm_models/rbm1_BEST --train_file results/exp296/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp296_rbm_ll.pkl

python ais.py results/exp296/dbm_models/dbm_BEST --train_file results/exp296/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp296_dbm_ll.pkl

python ais.py results/exp24/dbm_models/rbm1_BEST --train_file results/exp24/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp24_rbm_ll.pkl

python ais.py results/exp24/dbm_models/dbm_BEST --train_file results/exp24/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp24_dbm_ll.pkl

python ais.py results/exp347/dbm_models/rbm1_BEST --train_file results/exp347/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp347_rbm_ll.pkl

python ais.py results/exp347/dbm_models/dbm_BEST --train_file results/exp347/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp347_dbm_ll.pkl

python ais.py results/exp174/dbm_models/rbm1_BEST --train_file results/exp174/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp174_rbm_ll.pkl

python ais.py results/exp174/dbm_models/dbm_BEST --train_file results/exp174/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp174_dbm_ll.pkl

python ais.py results/exp390/dbm_models/rbm1_BEST --train_file results/exp390/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp390_rbm_ll.pkl

python ais.py results/exp390/dbm_models/dbm_BEST --train_file results/exp390/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp390_dbm_ll.pkl

python ais.py results/exp261/dbm_models/rbm1_BEST --train_file results/exp261/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp261_rbm_ll.pkl

python ais.py results/exp261/dbm_models/dbm_BEST --train_file results/exp261/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp261_dbm_ll.pkl

python ais.py results/exp134/dbm_models/rbm1_BEST --train_file results/exp134/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp134_rbm_ll.pkl

python ais.py results/exp134/dbm_models/dbm_BEST --train_file results/exp134/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp134_dbm_ll.pkl

python ais.py results/exp137/dbm_models/rbm1_BEST --train_file results/exp137/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp137_rbm_ll.pkl

python ais.py results/exp137/dbm_models/dbm_BEST --train_file results/exp137/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp137_dbm_ll.pkl

python ais.py results/exp60/dbm_models/rbm1_BEST --train_file results/exp60/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp60_rbm_ll.pkl

python ais.py results/exp60/dbm_models/dbm_BEST --train_file results/exp60/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp60_dbm_ll.pkl

python ais.py results/exp50/dbm_models/rbm1_BEST --train_file results/exp50/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp50_rbm_ll.pkl

python ais.py results/exp50/dbm_models/dbm_BEST --train_file results/exp50/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp50_dbm_ll.pkl

python ais.py results/exp237/dbm_models/rbm1_BEST --train_file results/exp237/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp237_rbm_ll.pkl

python ais.py results/exp237/dbm_models/dbm_BEST --train_file results/exp237/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp237_dbm_ll.pkl

python ais.py results/exp167/dbm_models/rbm1_BEST --train_file results/exp167/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp167_rbm_ll.pkl

python ais.py results/exp167/dbm_models/dbm_BEST --train_file results/exp167/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp167_dbm_ll.pkl

python ais.py results/exp194/dbm_models/rbm1_BEST --train_file results/exp194/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp194_rbm_ll.pkl

python ais.py results/exp194/dbm_models/dbm_BEST --train_file results/exp194/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp194_dbm_ll.pkl

python ais.py results/exp290/dbm_models/rbm1_BEST --train_file results/exp290/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp290_rbm_ll.pkl

python ais.py results/exp290/dbm_models/dbm_BEST --train_file results/exp290/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp290_dbm_ll.pkl

python ais.py results/exp210/dbm_models/rbm1_BEST --train_file results/exp210/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp210_rbm_ll.pkl

python ais.py results/exp210/dbm_models/dbm_BEST --train_file results/exp210/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp210_dbm_ll.pkl

python ais.py results/exp318/dbm_models/rbm1_BEST --train_file results/exp318/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp318_rbm_ll.pkl

python ais.py results/exp318/dbm_models/dbm_BEST --train_file results/exp318/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp318_dbm_ll.pkl

python ais.py results/exp53/dbm_models/rbm1_BEST --train_file results/exp53/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp53_rbm_ll.pkl

python ais.py results/exp53/dbm_models/dbm_BEST --train_file results/exp53/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp53_dbm_ll.pkl

python ais.py results/exp162/dbm_models/rbm1_BEST --train_file results/exp162/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp162_rbm_ll.pkl

python ais.py results/exp162/dbm_models/dbm_BEST --train_file results/exp162/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp162_dbm_ll.pkl

python ais.py results/exp110/dbm_models/rbm1_BEST --train_file results/exp110/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp110_rbm_ll.pkl

python ais.py results/exp110/dbm_models/dbm_BEST --train_file results/exp110/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp110_dbm_ll.pkl

python ais.py results/exp75/dbm_models/rbm1_BEST --train_file results/exp75/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp75_rbm_ll.pkl

python ais.py results/exp75/dbm_models/dbm_BEST --train_file results/exp75/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp75_dbm_ll.pkl

python ais.py results/exp140/dbm_models/rbm1_BEST --train_file results/exp140/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp140_rbm_ll.pkl

python ais.py results/exp140/dbm_models/dbm_BEST --train_file results/exp140/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp140_dbm_ll.pkl

python ais.py results/exp366/dbm_models/rbm1_BEST --train_file results/exp366/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp366_rbm_ll.pkl

python ais.py results/exp366/dbm_models/dbm_BEST --train_file results/exp366/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp366_dbm_ll.pkl

python ais.py results/exp126/dbm_models/rbm1_BEST --train_file results/exp126/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp126_rbm_ll.pkl

python ais.py results/exp126/dbm_models/dbm_BEST --train_file results/exp126/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp126_dbm_ll.pkl

python ais.py results/exp150/dbm_models/rbm1_BEST --train_file results/exp150/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp150_rbm_ll.pkl

python ais.py results/exp150/dbm_models/dbm_BEST --train_file results/exp150/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp150_dbm_ll.pkl

python ais.py results/exp309/dbm_models/rbm1_BEST --train_file results/exp309/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp309_rbm_ll.pkl

python ais.py results/exp309/dbm_models/dbm_BEST --train_file results/exp309/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp309_dbm_ll.pkl

python ais.py results/exp198/dbm_models/rbm1_BEST --train_file results/exp198/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp198_rbm_ll.pkl

python ais.py results/exp198/dbm_models/dbm_BEST --train_file results/exp198/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp198_dbm_ll.pkl

python ais.py results/exp381/dbm_models/rbm1_BEST --train_file results/exp381/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp381_rbm_ll.pkl

python ais.py results/exp381/dbm_models/dbm_BEST --train_file results/exp381/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp381_dbm_ll.pkl

python ais.py results/exp363/dbm_models/rbm1_BEST --train_file results/exp363/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp363_rbm_ll.pkl

python ais.py results/exp363/dbm_models/dbm_BEST --train_file results/exp363/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp363_dbm_ll.pkl

python ais.py results/exp243/dbm_models/rbm1_BEST --train_file results/exp243/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp243_rbm_ll.pkl

python ais.py results/exp243/dbm_models/dbm_BEST --train_file results/exp243/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp243_dbm_ll.pkl

python ais.py results/exp183/dbm_models/rbm1_BEST --train_file results/exp183/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp183_rbm_ll.pkl

python ais.py results/exp183/dbm_models/dbm_BEST --train_file results/exp183/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp183_dbm_ll.pkl

python ais.py results/exp161/dbm_models/rbm1_BEST --train_file results/exp161/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp161_rbm_ll.pkl

python ais.py results/exp161/dbm_models/dbm_BEST --train_file results/exp161/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp161_dbm_ll.pkl

python ais.py results/exp255/dbm_models/rbm1_BEST --train_file results/exp255/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp255_rbm_ll.pkl

python ais.py results/exp255/dbm_models/dbm_BEST --train_file results/exp255/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp255_dbm_ll.pkl

python ais.py results/exp42/dbm_models/rbm1_BEST --train_file results/exp42/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp42_rbm_ll.pkl

python ais.py results/exp42/dbm_models/dbm_BEST --train_file results/exp42/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp42_dbm_ll.pkl

python ais.py results/exp15/dbm_models/rbm1_BEST --train_file results/exp15/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp15_rbm_ll.pkl

python ais.py results/exp15/dbm_models/dbm_BEST --train_file results/exp15/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp15_dbm_ll.pkl

python ais.py results/exp27/dbm_models/rbm1_BEST --train_file results/exp27/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp27_rbm_ll.pkl

python ais.py results/exp27/dbm_models/dbm_BEST --train_file results/exp27/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp27_dbm_ll.pkl

python ais.py results/exp44/dbm_models/rbm1_BEST --train_file results/exp44/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp44_rbm_ll.pkl

python ais.py results/exp44/dbm_models/dbm_BEST --train_file results/exp44/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp44_dbm_ll.pkl

python ais.py results/exp120/dbm_models/rbm1_BEST --train_file results/exp120/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp120_rbm_ll.pkl

python ais.py results/exp120/dbm_models/dbm_BEST --train_file results/exp120/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp120_dbm_ll.pkl

python ais.py results/exp281/dbm_models/rbm1_BEST --train_file results/exp281/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp281_rbm_ll.pkl

python ais.py results/exp281/dbm_models/dbm_BEST --train_file results/exp281/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp281_dbm_ll.pkl

