import os, sys
import re
import glob
from operator import itemgetter

if __name__ == '__main__':
    from argparse import ArgumentParser
    parser = ArgumentParser()
    parser.add_argument("--expid", type=str, nargs='+',  help='experiment id')
    parser.add_argument("--outputf", type=str, help='job file')
    parser.add_argument("--skip", type=int, default=1,  help="Skip these many files")
    parser.add_argument("--infer_method", type=str, default="gaussian_exact", \
            help = "Inference method for imputation error")
    args = parser.parse_args()

    jobf = args.outputf if args.outputf else "impute_run.sh"
    with open(jobf, 'w') as fout:
        for expid in args.expid:

            models = glob.glob('experiments/{}/dbm_models/*'.format(expid))
            models = [re.findall('rbm1_\d+',m)[0] for m in models \
                    if re.findall('rbm1_\d+',m)]
            model_tups = [(int("".join(re.findall('\d+',m))), m) for \
                    m in models]

            model_tups = sorted(model_tups, key=itemgetter(0))
            model_tups = model_tups[::args.skip]

            models = map(itemgetter(1), model_tups)
            models = ['experiments/{0}/dbm_models/{1}'.format(expid,m)\
                    for m in models]

            if not os.path.exists('experiments/likelihoods/{}'.format(expid)):
                os.system('mkdir -p experiments/likelihoods/{}'.format(expid))

            for model in models : 
                model_file = os.path.basename(model)
                cmd = 'python impute.py  ' +\
                 '--model_file {}'.format(model) +\
                 ' --train_file  experiments/{}/trainers/train_CD_rbm1.pbtxt '.format(expid) +\
                 '--outf experiments/likelihoods/{0}/{0}_{1}_pll.pkl --infer-method {2}'.format(\
                 expid, model_file, args.infer_method)
                print >>fout, cmd
                print >>fout
                print >>fout, "sleep 5"
                print >>fout

            
