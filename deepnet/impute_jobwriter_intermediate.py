import os, sys
import glob


if __name__ == '__main__':
    from argparse import ArgumentParser
    parser = ArgumentParser()
    parser.add_argument("--expid", type=str, help='experiment id')
    args = parser.parse_args()

    expid  = args.expid

    models = glob.glob('experiments/{}/dbm_models/*'.format(expid))

    if not os.path.exists('experiments/likelihoods/{}'.format(expid)):
        os.system('mkdir -p experiments/likelihoods/{}'.format(expid))

    with open("impute_run.sh", 'w') as fout:
        for model in models : 
            model_file = os.path.basename(model)
            cmd = 'python impute.py  ' +\
             '--model_file {}'.format(model) +\
             ' --train_file  experiments/{}/trainers/train_CD_rbm1.pbtxt '.format(expid) +\
             '--outf experiments/likelihoods/{0}/{0}_{1}_pll.pkl --infer-method gaussian_exact'.format(expid, model_file)
            print >>fout, cmd
            print >>fout
            print >>fout, "sleep 5"
            print >>fout

            
