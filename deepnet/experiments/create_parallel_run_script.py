import os, sys


if __name__ == '__main__':
    from argparse import ArgumentParser
    parser = ArgumentParser(description="Create parallel run script")
    parser.add_argument("--start_expid", type=int,  help="Starting experiment id")
    parser.add_argument("--end_expid", type=int,  help="ending experiment id")
    parser.add_argument("--nparallel", type=int,  help="Number of parallel runs")
    args = parser.parse_args()


    job_q = [[] for _ in range(args.nparallel)]
    for idx in range(args.start_expid, args.end_expid+1):
        job_q[idx % args.nparallel].append('exp%d'%(idx))

    with open('run_in_parallel.sh','w') as fout:
        print >>fout, "#!/bin/sh"
        for qidx in range(args.nparallel):
            print >>fout
            print >>fout, "(" + " ; ".join([' cd {} ; ./runall.sh ; cd .. '.format(expidx) \
                    for expidx in job_q[qidx]]) + ") & ";

   
    os.system('chmod +x run_in_parallel.sh')


