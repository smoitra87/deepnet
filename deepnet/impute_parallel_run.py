import os, sys

if __name__ == '__main__':
    from argparse import ArgumentParser
    parser = ArgumentParser(description="Create parallel run script")
    parser.add_argument("--start_expid", type=int,  help="Starting experiment id")
    parser.add_argument("--end_expid", type=int,  help="ending experiment id")
    parser.add_argument("--nparallel", type=int,  help="Number of parallel runs")
    parser.add_argument("--infer_method", type=str, default="gaussian_exact", \
            help = "Inference method for imputation error")
    parser.add_argument("--model_prefix", type=str, help='model prefix')
    parser.add_argument("--skip", type=int, default=1,  help="Skip these many files")
    parser.add_argument("--mf_steps", type=int, default=1)
    args = parser.parse_args()


    job_q = [[] for _ in range(args.nparallel)]
    for idx in range(args.start_expid, args.end_expid+1):
        job_q[idx % args.nparallel].append('exp%d'%(idx))
        os.system("python impute_jobwriter_intermediate.py --expid " +\
                "exp{0} --outputf experiments/impute_run_exp{0}.sh".format(idx) +\
                " --skip {} --infer_method {}".format(args.skip, args.infer_method) +\
                " --mf_steps {}".format(args.mf_steps) +\
                " --model_prefix {}".format(args.model_prefix))
        os.system("chmod +x experiments/impute_run_exp{}.sh".format(idx))

    with open('run_in_parallel.sh','w') as fout:
        print >>fout, "#!/bin/sh"
        for qidx in range(args.nparallel):
            print >>fout
            print >>fout, "(" + " ; ".join([\
                    ' experiments/impute_run_{}.sh '.format(expidx) \
                    for expidx in job_q[qidx]]) + ") & ";

    os.system('chmod +x run_in_parallel.sh')
