#!/bin/sh

python impute.py --model_file results/exp299/dbm_models/rbm1_BEST --train_file results/exp299/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp299_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp299/dbm_models/dbm_BEST --train_file results/exp299/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp299_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp39/dbm_models/rbm1_BEST --train_file results/exp39/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp39_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp39/dbm_models/dbm_BEST --train_file results/exp39/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp39_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp186/dbm_models/rbm1_BEST --train_file results/exp186/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp186_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp186/dbm_models/dbm_BEST --train_file results/exp186/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp186_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp116/dbm_models/rbm1_BEST --train_file results/exp116/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp116_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp116/dbm_models/dbm_BEST --train_file results/exp116/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp116_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp396/dbm_models/rbm1_BEST --train_file results/exp396/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp396_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp396/dbm_models/dbm_BEST --train_file results/exp396/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp396_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp239/dbm_models/rbm1_BEST --train_file results/exp239/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp239_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp239/dbm_models/dbm_BEST --train_file results/exp239/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp239_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp111/dbm_models/rbm1_BEST --train_file results/exp111/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp111_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp111/dbm_models/dbm_BEST --train_file results/exp111/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp111_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp293/dbm_models/rbm1_BEST --train_file results/exp293/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp293_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp293/dbm_models/dbm_BEST --train_file results/exp293/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp293_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp234/dbm_models/rbm1_BEST --train_file results/exp234/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp234_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp234/dbm_models/dbm_BEST --train_file results/exp234/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp234_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp231/dbm_models/rbm1_BEST --train_file results/exp231/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp231_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp231/dbm_models/dbm_BEST --train_file results/exp231/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp231_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp423/dbm_models/rbm1_BEST --train_file results/exp423/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp423_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp423/dbm_models/dbm_BEST --train_file results/exp423/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp423_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp125/dbm_models/rbm1_BEST --train_file results/exp125/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp125_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp125/dbm_models/dbm_BEST --train_file results/exp125/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp125_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp45/dbm_models/rbm1_BEST --train_file results/exp45/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp45_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp45/dbm_models/dbm_BEST --train_file results/exp45/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp45_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp171/dbm_models/rbm1_BEST --train_file results/exp171/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp171_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp171/dbm_models/dbm_BEST --train_file results/exp171/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp171_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp399/dbm_models/rbm1_BEST --train_file results/exp399/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp399_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp399/dbm_models/dbm_BEST --train_file results/exp399/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp399_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp444/dbm_models/rbm1_BEST --train_file results/exp444/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp444_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp444/dbm_models/dbm_BEST --train_file results/exp444/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp444_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp240/dbm_models/rbm1_BEST --train_file results/exp240/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp240_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp240/dbm_models/dbm_BEST --train_file results/exp240/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp240_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp374/dbm_models/rbm1_BEST --train_file results/exp374/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp374_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp374/dbm_models/dbm_BEST --train_file results/exp374/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp374_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp291/dbm_models/rbm1_BEST --train_file results/exp291/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp291_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp291/dbm_models/dbm_BEST --train_file results/exp291/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp291_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp426/dbm_models/rbm1_BEST --train_file results/exp426/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp426_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp426/dbm_models/dbm_BEST --train_file results/exp426/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp426_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp192/dbm_models/rbm1_BEST --train_file results/exp192/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp192_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp192/dbm_models/dbm_BEST --train_file results/exp192/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp192_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp57/dbm_models/rbm1_BEST --train_file results/exp57/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp57_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp57/dbm_models/dbm_BEST --train_file results/exp57/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp57_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp263/dbm_models/rbm1_BEST --train_file results/exp263/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp263_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp263/dbm_models/dbm_BEST --train_file results/exp263/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp263_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp272/dbm_models/rbm1_BEST --train_file results/exp272/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp272_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp272/dbm_models/dbm_BEST --train_file results/exp272/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp272_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp245/dbm_models/rbm1_BEST --train_file results/exp245/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp245_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp245/dbm_models/dbm_BEST --train_file results/exp245/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp245_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp117/dbm_models/rbm1_BEST --train_file results/exp117/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp117_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp117/dbm_models/dbm_BEST --train_file results/exp117/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp117_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp134/dbm_models/rbm1_BEST --train_file results/exp134/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp134_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp134/dbm_models/dbm_BEST --train_file results/exp134/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp134_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp63/dbm_models/rbm1_BEST --train_file results/exp63/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp63_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp63/dbm_models/dbm_BEST --train_file results/exp63/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp63_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp50/dbm_models/rbm1_BEST --train_file results/exp50/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp50_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp50/dbm_models/dbm_BEST --train_file results/exp50/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp50_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp131/dbm_models/rbm1_BEST --train_file results/exp131/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp131_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp131/dbm_models/dbm_BEST --train_file results/exp131/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp131_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp123/dbm_models/rbm1_BEST --train_file results/exp123/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp123_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp123/dbm_models/dbm_BEST --train_file results/exp123/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp123_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp294/dbm_models/rbm1_BEST --train_file results/exp294/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp294_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp294/dbm_models/dbm_BEST --train_file results/exp294/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp294_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp210/dbm_models/rbm1_BEST --train_file results/exp210/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp210_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp210/dbm_models/dbm_BEST --train_file results/exp210/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp210_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp318/dbm_models/rbm1_BEST --train_file results/exp318/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp318_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp318/dbm_models/dbm_BEST --train_file results/exp318/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp318_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp87/dbm_models/rbm1_BEST --train_file results/exp87/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp87_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp87/dbm_models/dbm_BEST --train_file results/exp87/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp87_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp110/dbm_models/rbm1_BEST --train_file results/exp110/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp110_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp110/dbm_models/dbm_BEST --train_file results/exp110/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp110_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp153/dbm_models/rbm1_BEST --train_file results/exp153/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp153_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp153/dbm_models/dbm_BEST --train_file results/exp153/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp153_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp297/dbm_models/rbm1_BEST --train_file results/exp297/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp297_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp297/dbm_models/dbm_BEST --train_file results/exp297/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp297_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp156/dbm_models/rbm1_BEST --train_file results/exp156/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp156_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp156/dbm_models/dbm_BEST --train_file results/exp156/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp156_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp114/dbm_models/rbm1_BEST --train_file results/exp114/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp114_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp114/dbm_models/dbm_BEST --train_file results/exp114/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp114_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp369/dbm_models/rbm1_BEST --train_file results/exp369/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp369_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp369/dbm_models/dbm_BEST --train_file results/exp369/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp369_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp198/dbm_models/rbm1_BEST --train_file results/exp198/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp198_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp198/dbm_models/dbm_BEST --train_file results/exp198/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp198_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp381/dbm_models/rbm1_BEST --train_file results/exp381/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp381_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp381/dbm_models/dbm_BEST --train_file results/exp381/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp381_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp363/dbm_models/rbm1_BEST --train_file results/exp363/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp363_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp363/dbm_models/dbm_BEST --train_file results/exp363/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp363_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp243/dbm_models/rbm1_BEST --train_file results/exp243/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp243_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp243/dbm_models/dbm_BEST --train_file results/exp243/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp243_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp183/dbm_models/rbm1_BEST --train_file results/exp183/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp183_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp183/dbm_models/dbm_BEST --train_file results/exp183/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp183_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp161/dbm_models/rbm1_BEST --train_file results/exp161/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp161_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp161/dbm_models/dbm_BEST --train_file results/exp161/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp161_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp255/dbm_models/rbm1_BEST --train_file results/exp255/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp255_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp255/dbm_models/dbm_BEST --train_file results/exp255/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp255_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp42/dbm_models/rbm1_BEST --train_file results/exp42/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp42_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp42/dbm_models/dbm_BEST --train_file results/exp42/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp42_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp15/dbm_models/rbm1_BEST --train_file results/exp15/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp15_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp15/dbm_models/dbm_BEST --train_file results/exp15/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp15_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp132/dbm_models/rbm1_BEST --train_file results/exp132/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp132_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp132/dbm_models/dbm_BEST --train_file results/exp132/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp132_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp120/dbm_models/rbm1_BEST --train_file results/exp120/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp120_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp120/dbm_models/dbm_BEST --train_file results/exp120/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp120_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp180/dbm_models/rbm1_BEST --train_file results/exp180/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp180_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp180/dbm_models/dbm_BEST --train_file results/exp180/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp180_dbm_pll.pkl

sleep 2

