import os, sys
import glob
import re
from deepnet_aws_helper import JobTable
from deepnet import awsutil

def write_expalloc(exp_to_args, name_to_exp):
    """ Write the expalloc.py file"""

    with open(os.path.join(awsutil.get_deepnet_path(),'expalloc.py'),'w') as fout:
        template = """
exp_to_args = {0}

#################################33333

name_to_exp = {1}
        """.format(str(exp_to_args),str(name_to_exp))
        fout.write(template)


def complete_exps():
    return [os.path.basename(exp) for exp in glob.glob("results/exp*")]


if __name__ == '__main__':
    from argparse import ArgumentParser
    parser = ArgumentParser()
    parser.add_argument("--pull_finished", action='store_true', help="Pull completed experiments")
    parser.add_argument("--update_expalloc", action='store_true', help="Update the experimental allocation table")
    args = parser.parse_args()
   
    if args.update_expalloc:
        os.system("fab aws_write_all_idle:prefix=deepnet,out_file=idle.txt")
        completed = complete_exps() 
 
        import expalloc
        name_to_exp = expalloc.name_to_exp
        for name in name_to_exp:
            name_to_exp[name] = [exp for exp in name_to_exp[name] if exp not in completed]
 
        write_expalloc(expalloc.exp_to_args, name_to_exp)


    if args.pull_finished:
        os.system("fab all_update_jobs")
        with JobTable() as tbl:
            jobs = tbl.get_jobs_by_status(status="finished")
            cmds = [job[5] for job in jobs]
            exps = []
            for cmd in cmds :
                exp = re.findall('/exp\d+/',cmd)
                if not exp : continue
                exps.append(exp[0][1:-1])
            exps = list(set(e for e in exps))

        exps_to_pull = set(exps).difference(complete_exps())
        import expalloc
        pull_requests = {}
        for hostname in expalloc.name_to_exp:
            match = exps_to_pull.intersection(set(expalloc.name_to_exp[hostname]))
            if match : pull_requests[hostname] = list(match)[0]
                
        print pull_requests
        for hostname, exp in pull_requests.items():
            os.system("fab choose_get_folder:hostname={0},local_path=results/,remote_path=deepnet/deepnet/experiments/{1}".format(hostname, exp))


