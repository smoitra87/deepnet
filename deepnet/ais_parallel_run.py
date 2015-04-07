import os, sys
import glob
import commands

if __name__ == '__main__':
    from argparse import ArgumentParser
    parser = ArgumentParser(description="Create parallel run script")
    parser.add_argument("--start", type=int,  help="Starting experiment id")
    parser.add_argument("--end", type=int,  help="ending experiment id")
    parser.add_argument("--nparallel", type=int,  help="Number of parallel runs")
    parser.add_argument("--run_script_name", type=str,  help="Name of run script",\
            default="run_in_parallel.sh")
    parser.add_argument("--schedule", type=str,  help="Annealing schedule", default='slow')
    args = parser.parse_args()

    expids = []
    for result_idx in range(args.start, args.end+1):
        cmd = 'find results/results_{}000/ -maxdepth 1 -type d -name "exp*" -print'.format(result_idx)
        expids.extend(commands.getstatusoutput(cmd)[1].split('\n'))
            

    job_q = [[] for _ in range(args.nparallel)]
    idx = 0
    for _,expid in enumerate(expids):
        results_dir, expid_base = os.path.split(expid)
        best_model_list = glob.glob('{}/imperr_best/*'.format(expid))
        for best_model in best_model_list:
            best_model_base = os.path.split(best_model)[1]
            
            outf = "_".join([expid_base, best_model_base, 'll.pkl'])
            outf = os.path.join(results_dir, "likelihoods", outf)

            if 'dbm' in best_model_base:
                train_pbtxt = 'train_CD_joint.pbtxt'
            else:
                train_pbtxt = 'train_CD_rbm1.pbtxt'

            cmd = "python ais.py {0} --train_file {1}/trainers/{2}".format(best_model, expid, train_pbtxt) 
            cmd += " --numchains 1 --schedule {0} --outf {1}".format(args.schedule,outf)
            print outf
            job_q[idx % args.nparallel].append(cmd)
            idx += 1
        

    with open(args.run_script_name,'w') as fout:
        print >>fout, "#!/bin/sh"
        for qidx in range(args.nparallel):
            print >>fout
            print >>fout, "(" + " ; ".join([' {} ; sleep 5 '.format(cmd) \
                    for cmd in job_q[qidx]]) + ") & ";

   
    os.system('chmod +x {}'.format(args.run_script_name))

