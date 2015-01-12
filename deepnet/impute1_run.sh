#!/bin/sh

python impute.py --model_file results/exp299/dbm_models/rbm1_BEST --train_file results/exp299/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp299_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp299/dbm_models/dbm_BEST --train_file results/exp299/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp299_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp12/dbm_models/rbm1_BEST --train_file results/exp12/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp12_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp12/dbm_models/dbm_BEST --train_file results/exp12/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp12_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp326/dbm_models/rbm1_BEST --train_file results/exp326/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp326_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp326/dbm_models/dbm_BEST --train_file results/exp326/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp326_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp186/dbm_models/rbm1_BEST --train_file results/exp186/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp186_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp186/dbm_models/dbm_BEST --train_file results/exp186/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp186_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp135/dbm_models/rbm1_BEST --train_file results/exp135/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp135_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp135/dbm_models/dbm_BEST --train_file results/exp135/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp135_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp108/dbm_models/rbm1_BEST --train_file results/exp108/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp108_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp108/dbm_models/dbm_BEST --train_file results/exp108/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp108_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp350/dbm_models/rbm1_BEST --train_file results/exp350/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp350_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp350/dbm_models/dbm_BEST --train_file results/exp350/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp350_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp288/dbm_models/rbm1_BEST --train_file results/exp288/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp288_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp288/dbm_models/dbm_BEST --train_file results/exp288/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp288_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp239/dbm_models/rbm1_BEST --train_file results/exp239/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp239_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp239/dbm_models/dbm_BEST --train_file results/exp239/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp239_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp48/dbm_models/rbm1_BEST --train_file results/exp48/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp48_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp48/dbm_models/dbm_BEST --train_file results/exp48/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp48_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp111/dbm_models/rbm1_BEST --train_file results/exp111/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp111_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp111/dbm_models/dbm_BEST --train_file results/exp111/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp111_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp269/dbm_models/rbm1_BEST --train_file results/exp269/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp269_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp269/dbm_models/dbm_BEST --train_file results/exp269/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp269_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp236/dbm_models/rbm1_BEST --train_file results/exp236/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp236_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp236/dbm_models/dbm_BEST --train_file results/exp236/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp236_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp77/dbm_models/rbm1_BEST --train_file results/exp77/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp77_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp77/dbm_models/dbm_BEST --train_file results/exp77/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp77_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp266/dbm_models/rbm1_BEST --train_file results/exp266/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp266_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp266/dbm_models/dbm_BEST --train_file results/exp266/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp266_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp231/dbm_models/rbm1_BEST --train_file results/exp231/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp231_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp231/dbm_models/dbm_BEST --train_file results/exp231/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp231_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp105/dbm_models/rbm1_BEST --train_file results/exp105/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp105_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp105/dbm_models/dbm_BEST --train_file results/exp105/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp105_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp177/dbm_models/rbm1_BEST --train_file results/exp177/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp177_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp177/dbm_models/dbm_BEST --train_file results/exp177/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp177_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp125/dbm_models/rbm1_BEST --train_file results/exp125/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp125_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp125/dbm_models/dbm_BEST --train_file results/exp125/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp125_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp215/dbm_models/rbm1_BEST --train_file results/exp215/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp215_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp215/dbm_models/dbm_BEST --train_file results/exp215/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp215_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp45/dbm_models/rbm1_BEST --train_file results/exp45/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp45_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp45/dbm_models/dbm_BEST --train_file results/exp45/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp45_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp36/dbm_models/rbm1_BEST --train_file results/exp36/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp36_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp36/dbm_models/dbm_BEST --train_file results/exp36/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp36_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp9/dbm_models/rbm1_BEST --train_file results/exp9/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp9_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp9/dbm_models/dbm_BEST --train_file results/exp9/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp9_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp182/dbm_models/rbm1_BEST --train_file results/exp182/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp182_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp182/dbm_models/dbm_BEST --train_file results/exp182/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp182_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp282/dbm_models/rbm1_BEST --train_file results/exp282/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp282_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp282/dbm_models/dbm_BEST --train_file results/exp282/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp282_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp444/dbm_models/rbm1_BEST --train_file results/exp444/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp444_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp444/dbm_models/dbm_BEST --train_file results/exp444/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp444_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp344/dbm_models/rbm1_BEST --train_file results/exp344/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp344_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp344/dbm_models/dbm_BEST --train_file results/exp344/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp344_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp216/dbm_models/rbm1_BEST --train_file results/exp216/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp216_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp216/dbm_models/dbm_BEST --train_file results/exp216/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp216_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp101/dbm_models/rbm1_BEST --train_file results/exp101/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp101_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp101/dbm_models/dbm_BEST --train_file results/exp101/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp101_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp374/dbm_models/rbm1_BEST --train_file results/exp374/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp374_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp374/dbm_models/dbm_BEST --train_file results/exp374/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp374_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp68/dbm_models/rbm1_BEST --train_file results/exp68/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp68_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp68/dbm_models/dbm_BEST --train_file results/exp68/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp68_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp291/dbm_models/rbm1_BEST --train_file results/exp291/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp291_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp291/dbm_models/dbm_BEST --train_file results/exp291/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp291_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp212/dbm_models/rbm1_BEST --train_file results/exp212/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp212_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp212/dbm_models/dbm_BEST --train_file results/exp212/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp212_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp168/dbm_models/rbm1_BEST --train_file results/exp168/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp168_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp168/dbm_models/dbm_BEST --train_file results/exp168/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp168_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp71/dbm_models/rbm1_BEST --train_file results/exp71/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp71_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp71/dbm_models/dbm_BEST --train_file results/exp71/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp71_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp192/dbm_models/rbm1_BEST --train_file results/exp192/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp192_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp192/dbm_models/dbm_BEST --train_file results/exp192/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp192_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp296/dbm_models/rbm1_BEST --train_file results/exp296/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp296_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp296/dbm_models/dbm_BEST --train_file results/exp296/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp296_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp74/dbm_models/rbm1_BEST --train_file results/exp74/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp74_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp74/dbm_models/dbm_BEST --train_file results/exp74/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp74_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp96/dbm_models/rbm1_BEST --train_file results/exp96/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp96_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp96/dbm_models/dbm_BEST --train_file results/exp96/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp96_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp347/dbm_models/rbm1_BEST --train_file results/exp347/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp347_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp347/dbm_models/dbm_BEST --train_file results/exp347/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp347_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp272/dbm_models/rbm1_BEST --train_file results/exp272/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp272_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp272/dbm_models/dbm_BEST --train_file results/exp272/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp272_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp107/dbm_models/rbm1_BEST --train_file results/exp107/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp107_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp107/dbm_models/dbm_BEST --train_file results/exp107/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp107_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp390/dbm_models/rbm1_BEST --train_file results/exp390/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp390_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp390/dbm_models/dbm_BEST --train_file results/exp390/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp390_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp117/dbm_models/rbm1_BEST --train_file results/exp117/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp117_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp117/dbm_models/dbm_BEST --train_file results/exp117/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp117_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp189/dbm_models/rbm1_BEST --train_file results/exp189/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp189_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp189/dbm_models/dbm_BEST --train_file results/exp189/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp189_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp134/dbm_models/rbm1_BEST --train_file results/exp134/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp134_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp134/dbm_models/dbm_BEST --train_file results/exp134/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp134_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp371/dbm_models/rbm1_BEST --train_file results/exp371/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp371_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp371/dbm_models/dbm_BEST --train_file results/exp371/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp371_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp188/dbm_models/rbm1_BEST --train_file results/exp188/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp188_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp188/dbm_models/dbm_BEST --train_file results/exp188/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp188_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp60/dbm_models/rbm1_BEST --train_file results/exp60/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp60_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp60/dbm_models/dbm_BEST --train_file results/exp60/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp60_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp65/dbm_models/rbm1_BEST --train_file results/exp65/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp65_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp65/dbm_models/dbm_BEST --train_file results/exp65/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp65_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp6/dbm_models/rbm1_BEST --train_file results/exp6/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp6_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp6/dbm_models/dbm_BEST --train_file results/exp6/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp6_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp237/dbm_models/rbm1_BEST --train_file results/exp237/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp237_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp237/dbm_models/dbm_BEST --train_file results/exp237/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp237_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp131/dbm_models/rbm1_BEST --train_file results/exp131/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp131_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp131/dbm_models/dbm_BEST --train_file results/exp131/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp131_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp270/dbm_models/rbm1_BEST --train_file results/exp270/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp270_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp270/dbm_models/dbm_BEST --train_file results/exp270/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp270_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp194/dbm_models/rbm1_BEST --train_file results/exp194/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp194_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp194/dbm_models/dbm_BEST --train_file results/exp194/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp194_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp294/dbm_models/rbm1_BEST --train_file results/exp294/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp294_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp294/dbm_models/dbm_BEST --train_file results/exp294/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp294_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp138/dbm_models/rbm1_BEST --train_file results/exp138/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp138_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp138/dbm_models/dbm_BEST --train_file results/exp138/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp138_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp210/dbm_models/rbm1_BEST --train_file results/exp210/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp210_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp210/dbm_models/dbm_BEST --train_file results/exp210/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp210_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp218/dbm_models/rbm1_BEST --train_file results/exp218/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp218_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp218/dbm_models/dbm_BEST --train_file results/exp218/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp218_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp336/dbm_models/rbm1_BEST --train_file results/exp336/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp336_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp336/dbm_models/dbm_BEST --train_file results/exp336/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp336_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp53/dbm_models/rbm1_BEST --train_file results/exp53/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp53_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp53/dbm_models/dbm_BEST --train_file results/exp53/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp53_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp11/dbm_models/rbm1_BEST --train_file results/exp11/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp11_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp11/dbm_models/dbm_BEST --train_file results/exp11/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp11_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp420/dbm_models/rbm1_BEST --train_file results/exp420/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp420_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp420/dbm_models/dbm_BEST --train_file results/exp420/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp420_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp110/dbm_models/rbm1_BEST --train_file results/exp110/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp110_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp110/dbm_models/dbm_BEST --train_file results/exp110/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp110_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp200/dbm_models/rbm1_BEST --train_file results/exp200/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp200_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp200/dbm_models/dbm_BEST --train_file results/exp200/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp200_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp153/dbm_models/rbm1_BEST --train_file results/exp153/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp153_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp153/dbm_models/dbm_BEST --train_file results/exp153/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp153_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp140/dbm_models/rbm1_BEST --train_file results/exp140/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp140_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp140/dbm_models/dbm_BEST --train_file results/exp140/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp140_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp170/dbm_models/rbm1_BEST --train_file results/exp170/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp170_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp170/dbm_models/dbm_BEST --train_file results/exp170/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp170_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp156/dbm_models/rbm1_BEST --train_file results/exp156/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp156_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp156/dbm_models/dbm_BEST --train_file results/exp156/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp156_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp126/dbm_models/rbm1_BEST --train_file results/exp126/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp126_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp126/dbm_models/dbm_BEST --train_file results/exp126/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp126_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp377/dbm_models/rbm1_BEST --train_file results/exp377/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp377_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp377/dbm_models/dbm_BEST --train_file results/exp377/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp377_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp144/dbm_models/rbm1_BEST --train_file results/exp144/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp144_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp144/dbm_models/dbm_BEST --train_file results/exp144/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp144_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp309/dbm_models/rbm1_BEST --train_file results/exp309/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp309_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp309/dbm_models/dbm_BEST --train_file results/exp309/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp309_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp209/dbm_models/rbm1_BEST --train_file results/exp209/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp209_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp209/dbm_models/dbm_BEST --train_file results/exp209/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp209_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp372/dbm_models/rbm1_BEST --train_file results/exp372/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp372_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp372/dbm_models/dbm_BEST --train_file results/exp372/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp372_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp381/dbm_models/rbm1_BEST --train_file results/exp381/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp381_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp381/dbm_models/dbm_BEST --train_file results/exp381/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp381_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp143/dbm_models/rbm1_BEST --train_file results/exp143/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp143_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp143/dbm_models/dbm_BEST --train_file results/exp143/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp143_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp164/dbm_models/rbm1_BEST --train_file results/exp164/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp164_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp164/dbm_models/dbm_BEST --train_file results/exp164/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp164_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp243/dbm_models/rbm1_BEST --train_file results/exp243/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp243_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp243/dbm_models/dbm_BEST --train_file results/exp243/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp243_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp191/dbm_models/rbm1_BEST --train_file results/exp191/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp191_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp191/dbm_models/dbm_BEST --train_file results/exp191/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp191_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp264/dbm_models/rbm1_BEST --train_file results/exp264/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp264_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp264/dbm_models/dbm_BEST --train_file results/exp264/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp264_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp161/dbm_models/rbm1_BEST --train_file results/exp161/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp161_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp161/dbm_models/dbm_BEST --train_file results/exp161/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp161_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp204/dbm_models/rbm1_BEST --train_file results/exp204/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp204_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp204/dbm_models/dbm_BEST --train_file results/exp204/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp204_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp213/dbm_models/rbm1_BEST --train_file results/exp213/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp213_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp213/dbm_models/dbm_BEST --train_file results/exp213/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp213_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp42/dbm_models/rbm1_BEST --train_file results/exp42/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp42_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp42/dbm_models/dbm_BEST --train_file results/exp42/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp42_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp342/dbm_models/rbm1_BEST --train_file results/exp342/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp342_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp342/dbm_models/dbm_BEST --train_file results/exp342/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp342_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp315/dbm_models/rbm1_BEST --train_file results/exp315/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp315_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp315/dbm_models/dbm_BEST --train_file results/exp315/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp315_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp27/dbm_models/rbm1_BEST --train_file results/exp27/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp27_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp27/dbm_models/dbm_BEST --train_file results/exp27/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp27_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp56/dbm_models/rbm1_BEST --train_file results/exp56/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp56_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp56/dbm_models/dbm_BEST --train_file results/exp56/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp56_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp197/dbm_models/rbm1_BEST --train_file results/exp197/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp197_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp197/dbm_models/dbm_BEST --train_file results/exp197/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp197_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp120/dbm_models/rbm1_BEST --train_file results/exp120/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp120_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp120/dbm_models/dbm_BEST --train_file results/exp120/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp120_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp159/dbm_models/rbm1_BEST --train_file results/exp159/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp159_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp159/dbm_models/dbm_BEST --train_file results/exp159/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp159_dbm_pll.pkl

sleep 2

python impute.py --model_file results/exp180/dbm_models/rbm1_BEST --train_file results/exp180/trainers/train_CD_rbm1.pbtxt --infer-method exact --outf results/likelihoods/exp180_rbm_pll.pkl

sleep 2

python impute.py --model_file results/exp180/dbm_models/dbm_BEST --train_file results/exp180/trainers/train_CD_rbm1.pbtxt --infer-method mf --mf-steps 5 --hidden-mf-steps 2 --outf results/likelihoods/exp180_dbm_pll.pkl

sleep 2

