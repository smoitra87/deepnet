import os, sys
from deepnet.util import ReadModel, ReadOperation, ReadData
import re
import glob
import shutil
from itertools import product
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
    '--base_epsilon' : ['0.1', '0.01'],
    '--l2_decay': ['0.1', '0.01'],
    '--model' : ['sprbm', 'droprbm', 'rbm', 'srbm', 'slcrbm'],
    '--hidden1_width' : ['100', '500', '1449']
}

leftovers  = []
leftovers.append([' --initial_momentum 0.5 --final_momentum 0.9'])
leftovers.append([' --model_dir experiments/{0}/dbm_models --rep_dir experiments/{0}/dbm_reps'])
leftovers.append([' --data_dir datasets/PF00240 --input_width 69 --batchsize 200'])
leftovers.append([' --model ghrbm', ' --model lcrbm'])
append_to_list("--l2_decay", leftovers)
append_to_list("--base_epsilon", leftovers)
leftovers= list(product(*leftovers))

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
param_list.append(['--initial_momentum 0.5 --final_momentum 0.9'])
param_list.append(['--model_dir experiments/{0}/dbm_models'+\
        ' --rep_dir experiments/{0}/dbm_reps'])
append_to_list("--l2_decay", param_list)
append_to_list("--base_epsilon", param_list)
append_to_list("--model", param_list)
append_to_list("--hidden1_width", param_list)
param_list.append(['--data_dir datasets/PF00240 --input_width 69 --batchsize 200'])

if __name__ == '__main__':
    
    from argparse import ArgumentParser
    parser = ArgumentParser(description="Control experiment creation")
    parser.add_argument("expid", type=str, nargs="*", help="experiment ids to be created")
    parser.add_argument("--expalloc", action='store_true', help="Only create the expalloc table")
    parser.add_argument("--machine_start_idx", type=int, default = 1, help="Min machine idzx")
    parser.add_argument("--machine_end_idx", type=int, default = 10,  help="Max machine idx")
    parser.add_argument("--machine_prefix", type=str, default = 'deepnet',  help="Machine prefix")
    parser.add_argument("--start_exp_id", type=int, default = 1000,  help="First experiment id")
    parse_args = parser.parse_args()   

    from collections import defaultdict
    name_to_exp = defaultdict(list)
    exp_to_args = dict()

    from itertools import cycle
    machine_gen = cycle([parse_args.machine_prefix+str(idx) for idx in \
            range(parse_args.machine_start_idx, parse_args.machine_end_idx+1) ])


    tuplist = list(product(*param_list))
    tuplist += leftovers

    # Shuffle the tuplist
    import random
    random.seed(42)
    random.shuffle(tuplist)

    for idx, tup in list(enumerate(tuplist)):
        expid ='exp'+str(idx + parse_args.start_exp_id) 
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

        # find the model #HACKY
        idx = next(idx for idx,e in enumerate(tup) if '--model ' in e)
        model_name = tup[idx].strip().split()[1]

        shutil.copytree('{}_template'.format(model_name), expid)
        cmd ='cd {0} && python setup_protos.py {1}'.format(expid, args) 
        print(cmd)

        os.system(cmd) 
        with open(os.path.join(expid, 'README'),'w') as fout:
            fout.write(args)


    if parse_args.expalloc:
        import pprint
        name_to_exp = dict(name_to_exp)
        from deepnet import awsutil
        write_expalloc(exp_to_args, name_to_exp)
