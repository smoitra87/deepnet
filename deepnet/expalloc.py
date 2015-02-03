
exp_to_args = {'exp2000': '--initial_momentum 0.5 --final_momentum 0.9 --model_dir experiments/exp2000/dbm_models --rep_dir experiments/exp2000/dbm_reps --l2_decay 0.01 --base_epsilon 0.1 --model warmlcrbm --hidden1_width 1449 --data_dir datasets/PF00240 --input_width 69 --batchsize 200', 'exp2001': '--initial_momentum 0.5 --final_momentum 0.9 --model_dir experiments/exp2001/dbm_models --rep_dir experiments/exp2001/dbm_reps --l2_decay 0.01 --base_epsilon 0.1 --model rbm --hidden1_width 1449 --data_dir datasets/PF00240 --input_width 69 --batchsize 200', 'exp2002': '--initial_momentum 0.5 --final_momentum 0.9 --model_dir experiments/exp2002/dbm_models --rep_dir experiments/exp2002/dbm_reps --l2_decay 0.01 --base_epsilon 0.1 --model warmrbm --hidden1_width 1449 --data_dir datasets/PF00240 --input_width 69 --batchsize 200'}

#################################33333

name_to_exp = {'deepnet1': ['exp2000'], 'deepnet3': ['exp2002'], 'deepnet2': ['exp2001']}
        