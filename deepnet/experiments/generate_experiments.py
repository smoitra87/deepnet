import os, sys
from deepnet.util import ReadModel, ReadOperation, ReadData
import re
import glob
from deepnet import awsutil

def append_to_list(k, param_list):
    if type(params[k][0]) is str :
        param_list.append([k+" "+v for v in params[k]])
    else:
        param_list.append([k if v else "" for v in params[k]])

def get_next_expid(dir="./"):
    expfolders = glob.glob(os.path.join(dir,"exp*"))
    ids = map(int,[re.findall('\d+',f)[0] for f in expfolders if re.findall('\d+',f)])
    return max(ids)+1 if ids else 1

params = { 
    '--base_epsilon' : ['0.5', '0.1', '0.01'],
    '--epsilon_decay' : [False, True],
    '--l2_decay': ['0.01', '0.001']
}


def write_expalloc(exp_to_args, name_to_exp):
    """ Write the expalloc.py file"""

    with open(os.path.join(awsutil.get_deepnet_path(),'expalloc.py'),'w') as fout:
        template = """
exp_to_args = {0}

#################################33333

name_to_exp = {1}
        """.format(str(exp_to_args),str(name_to_exp))
        fout.write(template)

# Order params such that ones towards the end are sampled more
param_list = []
param_list.append(['--initial_momentum 0.5 --final_momentum 0.90000',\
        '--initial_momentum 0.0 --final_momentum 0.0'])
param_list.append(['--model_dir experiments/{0}/dbm_models'+\
        ' --rep_dir experiments/{0}/dbm_reps'])
append_to_list("--epsilon_decay", param_list)
append_to_list("--l2_decay", param_list)
append_to_list("--base_epsilon", param_list)
param_list.append(['--hidden1_width 100 --hidden2_width 100',\
        '--hidden1_width 500 --hidden2_width 500',
        '--hidden1_width 1000 --hidden2_width 1000'])
param_list.append(['--sparsity', '--dropout', ''])
param_list.append(['--data_dir datasets/toy --input_width 100 --batchsize 1000',\
       '--data_dir datasets/PF00240 --input_width 69 --batchsize 200',
       '--data_dir datasets/PF00595 --input_width 81 --batchsize 500'])

if __name__ == '__main__':
    START_EXP_ID = 1

    import shutil
    from itertools import product
    
    from argparse import ArgumentParser
    parser = ArgumentParser(description="Control experiment creation")
    parser.add_argument("expid", type=str, nargs="*", help="experiment ids to be created")
    parser.add_argument("--expalloc", action='store_true', help="Only create the expalloc table")
    parser.add_argument("--prioritize", action='store_true', help="Prioritize the experiments")
    parser.add_argument("--machine_start_idx", type=int, default = 1, help="Min machine idzx")
    parser.add_argument("--machine_end_idx", type=int, default = 10,  help="Max machine idx")
    parser.add_argument("--machine_prefix", type=str, default = 'deepnet',  help="Machine prefix")
    parse_args = parser.parse_args()   

    from collections import defaultdict
    name_to_exp = defaultdict(list)
    exp_to_args = dict()

    from itertools import cycle
    machine_gen = cycle([parse_args.machine_prefix+str(idx) for idx in \
            range(parse_args.machine_start_idx, parse_args.machine_end_idx+1) ])

    for idx, tup in list(enumerate(product(*param_list))):
        expid ='exp'+str(idx + START_EXP_ID) 
        args = " ".join(tup).format(expid)
        
        if parse_args.expalloc:
            exp_to_args[expid] = args
            name_to_exp[next(machine_gen)].append(expid)
            continue

        if expid not in parse_args.expid:
            continue

        if os.path.exists(expid):
            sys.stderr.write("{} already exists".format(expid))
            sys.exit(1)

        shutil.copytree('template', expid)
        cmd ='cd {0} && python setup_protos.py {1}'.format(expid, args) 
        print(cmd)
        os.system(cmd) 
        with open(os.path.join(expid, 'README'),'w') as fout:
            fout.write(args)

    if parse_args.expalloc and parse_args.post_process:
        # Arbitrary post processing rules
        pass


    if parse_args.expalloc:
        import pprint
        name_to_exp = dict(name_to_exp)
        from deepnet import awsutil
        write_expalloc(exp_to_args, name_to_exp)
