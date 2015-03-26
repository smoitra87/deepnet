
exp_to_args = {'exp6000': '--initial_momentum 0.5 --final_momentum 0.9 --model_dir experiments/exp6000/dbm_models --rep_dir experiments/exp6000/dbm_reps --l2_decay 0.01 --base_epsilon 0.1 --model lcdbm --hidden1_width 1449 --hidden2_width 10 --steps 100000 --batchsize 500 --input_width 69 --data_dir datasets/PF00240', 'exp6001': '--initial_momentum 0.5 --final_momentum 0.9 --model_dir experiments/exp6001/dbm_models --rep_dir experiments/exp6001/dbm_reps --l2_decay 0.01 --base_epsilon 0.1 --model lcdbm --hidden1_width 1449 --hidden2_width 50 --steps 100000 --batchsize 500 --input_width 69 --data_dir datasets/PF00240', 'exp6002': '--initial_momentum 0.5 --final_momentum 0.9 --model_dir experiments/exp6002/dbm_models --rep_dir experiments/exp6002/dbm_reps --l2_decay 0.01 --base_epsilon 0.1 --model lcdbm --hidden1_width 1449 --hidden2_width 100 --steps 100000 --batchsize 500 --input_width 69 --data_dir datasets/PF00240'}

#################################33333

name_to_exp = {'deepnet1': ['exp6000'], 'deepnet3': ['exp6002'], 'deepnet2': ['exp6001']}
        