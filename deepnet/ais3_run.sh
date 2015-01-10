#!/bin/sh

python ais.py results/exp12/dbm_models/rbm1_BEST --train_file results/exp12/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp12_rbm_ll.pkl

python ais.py results/exp12/dbm_models/dbm_BEST --train_file results/exp12/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp12_dbm_ll.pkl

python ais.py results/exp2/dbm_models/rbm1_BEST --train_file results/exp2/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp2_rbm_ll.pkl

python ais.py results/exp2/dbm_models/dbm_BEST --train_file results/exp2/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp2_dbm_ll.pkl

python ais.py results/exp135/dbm_models/rbm1_BEST --train_file results/exp135/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp135_rbm_ll.pkl

python ais.py results/exp135/dbm_models/dbm_BEST --train_file results/exp135/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp135_dbm_ll.pkl

python ais.py results/exp51/dbm_models/rbm1_BEST --train_file results/exp51/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp51_rbm_ll.pkl

python ais.py results/exp51/dbm_models/dbm_BEST --train_file results/exp51/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp51_dbm_ll.pkl

python ais.py results/exp288/dbm_models/rbm1_BEST --train_file results/exp288/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp288_rbm_ll.pkl

python ais.py results/exp288/dbm_models/dbm_BEST --train_file results/exp288/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp288_dbm_ll.pkl

python ais.py results/exp152/dbm_models/rbm1_BEST --train_file results/exp152/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp152_rbm_ll.pkl

python ais.py results/exp152/dbm_models/dbm_BEST --train_file results/exp152/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp152_dbm_ll.pkl

python ais.py results/exp111/dbm_models/rbm1_BEST --train_file results/exp111/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp111_rbm_ll.pkl

python ais.py results/exp111/dbm_models/dbm_BEST --train_file results/exp111/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp111_dbm_ll.pkl

python ais.py results/exp293/dbm_models/rbm1_BEST --train_file results/exp293/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp293_rbm_ll.pkl

python ais.py results/exp293/dbm_models/dbm_BEST --train_file results/exp293/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp293_dbm_ll.pkl

python ais.py results/exp77/dbm_models/rbm1_BEST --train_file results/exp77/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp77_rbm_ll.pkl

python ais.py results/exp77/dbm_models/dbm_BEST --train_file results/exp77/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp77_dbm_ll.pkl

python ais.py results/exp113/dbm_models/rbm1_BEST --train_file results/exp113/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp113_rbm_ll.pkl

python ais.py results/exp113/dbm_models/dbm_BEST --train_file results/exp113/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp113_dbm_ll.pkl

python ais.py results/exp105/dbm_models/rbm1_BEST --train_file results/exp105/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp105_rbm_ll.pkl

python ais.py results/exp105/dbm_models/dbm_BEST --train_file results/exp105/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp105_dbm_ll.pkl

python ais.py results/exp482/dbm_models/rbm1_BEST --train_file results/exp482/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp482_rbm_ll.pkl

python ais.py results/exp482/dbm_models/dbm_BEST --train_file results/exp482/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp482_dbm_ll.pkl

python ais.py results/exp215/dbm_models/rbm1_BEST --train_file results/exp215/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp215_rbm_ll.pkl

python ais.py results/exp215/dbm_models/dbm_BEST --train_file results/exp215/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp215_dbm_ll.pkl

python ais.py results/exp258/dbm_models/rbm1_BEST --train_file results/exp258/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp258_rbm_ll.pkl

python ais.py results/exp258/dbm_models/dbm_BEST --train_file results/exp258/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp258_dbm_ll.pkl

python ais.py results/exp9/dbm_models/rbm1_BEST --train_file results/exp9/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp9_rbm_ll.pkl

python ais.py results/exp9/dbm_models/dbm_BEST --train_file results/exp9/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp9_dbm_ll.pkl

python ais.py results/exp399/dbm_models/rbm1_BEST --train_file results/exp399/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp399_rbm_ll.pkl

python ais.py results/exp399/dbm_models/dbm_BEST --train_file results/exp399/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp399_dbm_ll.pkl

python ais.py results/exp444/dbm_models/rbm1_BEST --train_file results/exp444/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp444_rbm_ll.pkl

python ais.py results/exp444/dbm_models/dbm_BEST --train_file results/exp444/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp444_dbm_ll.pkl

python ais.py results/exp128/dbm_models/rbm1_BEST --train_file results/exp128/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp128_rbm_ll.pkl

python ais.py results/exp128/dbm_models/dbm_BEST --train_file results/exp128/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp128_dbm_ll.pkl

python ais.py results/exp101/dbm_models/rbm1_BEST --train_file results/exp101/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp101_rbm_ll.pkl

python ais.py results/exp101/dbm_models/dbm_BEST --train_file results/exp101/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp101_dbm_ll.pkl

python ais.py results/exp41/dbm_models/rbm1_BEST --train_file results/exp41/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp41_rbm_ll.pkl

python ais.py results/exp41/dbm_models/dbm_BEST --train_file results/exp41/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp41_dbm_ll.pkl

python ais.py results/exp291/dbm_models/rbm1_BEST --train_file results/exp291/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp291_rbm_ll.pkl

python ais.py results/exp291/dbm_models/dbm_BEST --train_file results/exp291/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp291_dbm_ll.pkl

python ais.py results/exp426/dbm_models/rbm1_BEST --train_file results/exp426/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp426_rbm_ll.pkl

python ais.py results/exp426/dbm_models/dbm_BEST --train_file results/exp426/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp426_dbm_ll.pkl

python ais.py results/exp71/dbm_models/rbm1_BEST --train_file results/exp71/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp71_rbm_ll.pkl

python ais.py results/exp71/dbm_models/dbm_BEST --train_file results/exp71/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp71_dbm_ll.pkl

python ais.py results/exp393/dbm_models/rbm1_BEST --train_file results/exp393/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp393_rbm_ll.pkl

python ais.py results/exp393/dbm_models/dbm_BEST --train_file results/exp393/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp393_dbm_ll.pkl

python ais.py results/exp74/dbm_models/rbm1_BEST --train_file results/exp74/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp74_rbm_ll.pkl

python ais.py results/exp74/dbm_models/dbm_BEST --train_file results/exp74/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp74_dbm_ll.pkl

python ais.py results/exp263/dbm_models/rbm1_BEST --train_file results/exp263/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp263_rbm_ll.pkl

python ais.py results/exp263/dbm_models/dbm_BEST --train_file results/exp263/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp263_dbm_ll.pkl

python ais.py results/exp272/dbm_models/rbm1_BEST --train_file results/exp272/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp272_rbm_ll.pkl

python ais.py results/exp272/dbm_models/dbm_BEST --train_file results/exp272/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp272_dbm_ll.pkl

python ais.py results/exp245/dbm_models/rbm1_BEST --train_file results/exp245/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp245_rbm_ll.pkl

python ais.py results/exp245/dbm_models/dbm_BEST --train_file results/exp245/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp245_dbm_ll.pkl

python ais.py results/exp117/dbm_models/rbm1_BEST --train_file results/exp117/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp117_rbm_ll.pkl

python ais.py results/exp117/dbm_models/dbm_BEST --train_file results/exp117/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp117_dbm_ll.pkl

python ais.py results/exp179/dbm_models/rbm1_BEST --train_file results/exp179/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp179_rbm_ll.pkl

python ais.py results/exp179/dbm_models/dbm_BEST --train_file results/exp179/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp179_dbm_ll.pkl

python ais.py results/exp371/dbm_models/rbm1_BEST --train_file results/exp371/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp371_rbm_ll.pkl

python ais.py results/exp371/dbm_models/dbm_BEST --train_file results/exp371/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp371_dbm_ll.pkl

python ais.py results/exp63/dbm_models/rbm1_BEST --train_file results/exp63/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp63_rbm_ll.pkl

python ais.py results/exp63/dbm_models/dbm_BEST --train_file results/exp63/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp63_dbm_ll.pkl

python ais.py results/exp65/dbm_models/rbm1_BEST --train_file results/exp65/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp65_rbm_ll.pkl

python ais.py results/exp65/dbm_models/dbm_BEST --train_file results/exp65/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp65_dbm_ll.pkl

python ais.py results/exp242/dbm_models/rbm1_BEST --train_file results/exp242/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp242_rbm_ll.pkl

python ais.py results/exp242/dbm_models/dbm_BEST --train_file results/exp242/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp242_dbm_ll.pkl

python ais.py results/exp131/dbm_models/rbm1_BEST --train_file results/exp131/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp131_rbm_ll.pkl

python ais.py results/exp131/dbm_models/dbm_BEST --train_file results/exp131/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp131_dbm_ll.pkl

python ais.py results/exp123/dbm_models/rbm1_BEST --train_file results/exp123/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp123_rbm_ll.pkl

python ais.py results/exp123/dbm_models/dbm_BEST --train_file results/exp123/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp123_dbm_ll.pkl

python ais.py results/exp294/dbm_models/rbm1_BEST --train_file results/exp294/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp294_rbm_ll.pkl

python ais.py results/exp294/dbm_models/dbm_BEST --train_file results/exp294/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp294_dbm_ll.pkl

python ais.py results/exp98/dbm_models/rbm1_BEST --train_file results/exp98/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp98_rbm_ll.pkl

python ais.py results/exp98/dbm_models/dbm_BEST --train_file results/exp98/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp98_dbm_ll.pkl

python ais.py results/exp218/dbm_models/rbm1_BEST --train_file results/exp218/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp218_rbm_ll.pkl

python ais.py results/exp218/dbm_models/dbm_BEST --train_file results/exp218/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp218_dbm_ll.pkl

python ais.py results/exp78/dbm_models/rbm1_BEST --train_file results/exp78/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp78_rbm_ll.pkl

python ais.py results/exp78/dbm_models/dbm_BEST --train_file results/exp78/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp78_dbm_ll.pkl

python ais.py results/exp11/dbm_models/rbm1_BEST --train_file results/exp11/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp11_rbm_ll.pkl

python ais.py results/exp11/dbm_models/dbm_BEST --train_file results/exp11/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp11_dbm_ll.pkl

python ais.py results/exp80/dbm_models/rbm1_BEST --train_file results/exp80/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp80_rbm_ll.pkl

python ais.py results/exp80/dbm_models/dbm_BEST --train_file results/exp80/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp80_dbm_ll.pkl

python ais.py results/exp200/dbm_models/rbm1_BEST --train_file results/exp200/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp200_rbm_ll.pkl

python ais.py results/exp200/dbm_models/dbm_BEST --train_file results/exp200/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp200_dbm_ll.pkl

python ais.py results/exp285/dbm_models/rbm1_BEST --train_file results/exp285/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp285_rbm_ll.pkl

python ais.py results/exp285/dbm_models/dbm_BEST --train_file results/exp285/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp285_dbm_ll.pkl

python ais.py results/exp170/dbm_models/rbm1_BEST --train_file results/exp170/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp170_rbm_ll.pkl

python ais.py results/exp170/dbm_models/dbm_BEST --train_file results/exp170/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp170_dbm_ll.pkl

python ais.py results/exp312/dbm_models/rbm1_BEST --train_file results/exp312/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp312_rbm_ll.pkl

python ais.py results/exp312/dbm_models/dbm_BEST --train_file results/exp312/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp312_dbm_ll.pkl

python ais.py results/exp377/dbm_models/rbm1_BEST --train_file results/exp377/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp377_rbm_ll.pkl

python ais.py results/exp377/dbm_models/dbm_BEST --train_file results/exp377/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp377_dbm_ll.pkl

python ais.py results/exp369/dbm_models/rbm1_BEST --train_file results/exp369/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp369_rbm_ll.pkl

python ais.py results/exp369/dbm_models/dbm_BEST --train_file results/exp369/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp369_dbm_ll.pkl

python ais.py results/exp209/dbm_models/rbm1_BEST --train_file results/exp209/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp209_rbm_ll.pkl

python ais.py results/exp209/dbm_models/dbm_BEST --train_file results/exp209/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp209_dbm_ll.pkl

python ais.py results/exp339/dbm_models/rbm1_BEST --train_file results/exp339/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp339_rbm_ll.pkl

python ais.py results/exp339/dbm_models/dbm_BEST --train_file results/exp339/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp339_dbm_ll.pkl

python ais.py results/exp143/dbm_models/rbm1_BEST --train_file results/exp143/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp143_rbm_ll.pkl

python ais.py results/exp143/dbm_models/dbm_BEST --train_file results/exp143/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp143_dbm_ll.pkl

python ais.py results/exp54/dbm_models/rbm1_BEST --train_file results/exp54/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp54_rbm_ll.pkl

python ais.py results/exp54/dbm_models/dbm_BEST --train_file results/exp54/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp54_dbm_ll.pkl

python ais.py results/exp191/dbm_models/rbm1_BEST --train_file results/exp191/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp191_rbm_ll.pkl

python ais.py results/exp191/dbm_models/dbm_BEST --train_file results/exp191/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp191_dbm_ll.pkl

python ais.py results/exp207/dbm_models/rbm1_BEST --train_file results/exp207/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp207_rbm_ll.pkl

python ais.py results/exp207/dbm_models/dbm_BEST --train_file results/exp207/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp207_dbm_ll.pkl

python ais.py results/exp204/dbm_models/rbm1_BEST --train_file results/exp204/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp204_rbm_ll.pkl

python ais.py results/exp204/dbm_models/dbm_BEST --train_file results/exp204/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp204_dbm_ll.pkl

python ais.py results/exp300/dbm_models/rbm1_BEST --train_file results/exp300/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp300_rbm_ll.pkl

python ais.py results/exp300/dbm_models/dbm_BEST --train_file results/exp300/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp300_dbm_ll.pkl

python ais.py results/exp342/dbm_models/rbm1_BEST --train_file results/exp342/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp342_rbm_ll.pkl

python ais.py results/exp342/dbm_models/dbm_BEST --train_file results/exp342/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp342_dbm_ll.pkl

python ais.py results/exp47/dbm_models/rbm1_BEST --train_file results/exp47/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp47_rbm_ll.pkl

python ais.py results/exp47/dbm_models/dbm_BEST --train_file results/exp47/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp47_dbm_ll.pkl

python ais.py results/exp56/dbm_models/rbm1_BEST --train_file results/exp56/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp56_rbm_ll.pkl

python ais.py results/exp56/dbm_models/dbm_BEST --train_file results/exp56/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp56_dbm_ll.pkl

python ais.py results/exp471/dbm_models/rbm1_BEST --train_file results/exp471/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp471_rbm_ll.pkl

python ais.py results/exp471/dbm_models/dbm_BEST --train_file results/exp471/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp471_dbm_ll.pkl

python ais.py results/exp159/dbm_models/rbm1_BEST --train_file results/exp159/trainers/train_CD_rbm1.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp159_rbm_ll.pkl

python ais.py results/exp159/dbm_models/dbm_BEST --train_file results/exp159/trainers/train_CD_joint.pbtxt --numchains 20 --numchains_unclamped 1000 --schedule slow --outf results/likelihoods/exp159_dbm_ll.pkl

