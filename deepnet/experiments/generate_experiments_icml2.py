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


def write_expalloc(exp_to_args, name_to_exp):
    """ Write the expalloc.py file"""

    with open(os.path.join(awsutil.get_deepnet_path(),'expalloc.py'),'w') as fout:
        template = """
exp_to_args = {0}

#################################33333

name_to_exp = {1}
        """.format(str(exp_to_args),str(name_to_exp))
        fout.write(template)

#param_list.append(['--data_dir datasets/PF00240'])

if __name__ == '__main__':
    
    from argparse import ArgumentParser
    parser = ArgumentParser(description="Control experiment creation")
    parser.add_argument("expid", type=str, nargs="*", help="experiment ids to be created")
    parser.add_argument("--expalloc", action='store_true', help="Only create the expalloc table")
    parser.add_argument("--machine_start_idx", type=int, default = 1, help="Min machine idzx")
    parser.add_argument("--machine_end_idx", type=int, default = 10,  help="Max machine idx")
    parser.add_argument("--machine_prefix", type=str, default = 'deepnet',  help="Machine prefix")
    parser.add_argument("--start_exp_id", type=int, default = 1000,  help="First experiment id")
    parser.add_argument("--pfamid", type=str, help="Pfamid to run")
    parse_args = parser.parse_args()   

    from collections import defaultdict
    name_to_exp = defaultdict(list)
    exp_to_args = dict()

    from itertools import cycle
    machine_gen = cycle([parse_args.machine_prefix+str(idx) for idx in \
            range(parse_args.machine_start_idx, parse_args.machine_end_idx+1) ])

    params = { 
        '--base_epsilon' : ['0.1'],
        '--l2_decay': ['0.01'],
        '--model' : ['rbm'],
        '--hidden1_width' : ['1000'],
        '--bernoulli2_hidden1_width' : ['10'],
        '--steps' : ['100000'],
        '--batchsize' : ['500'],
        '--input_width': ['50'],
        '--data_dir': ['datasets/PF00240']
    }
    
    # Make some changes to params
    if parse_args.pfamid:
        pfamid = parse_args.pfamid
        params['--data_dir'] = ['datasets/{}'.format(pfamid)]
        import commands
        cmd = "grep dimensions ../datasets/{}/data.pbtxt ".format(pfamid) +\
                "| tr -d ' '| cut -d: -f2 | head -n1"
        dimensions = commands.getstatusoutput(cmd)[1].strip()
        params["--input_width"] = [dimensions]


    # Order params such that ones towards the end are sampled more
    param_list = []
    param_list.append(['--initial_momentum 0.5 --final_momentum 0.9'])
    param_list.append(['--model_dir experiments/{0}/dbm_models'+\
            ' --rep_dir experiments/{0}/dbm_reps'])
    append_to_list("--l2_decay", param_list)
    append_to_list("--base_epsilon", param_list)
    append_to_list("--model", param_list)
    append_to_list("--hidden1_width", param_list)
    append_to_list("--bernoulli2_hidden1_width", param_list)
    append_to_list("--steps", param_list)
    append_to_list("--batchsize", param_list)
    append_to_list("--input_width", param_list)
    append_to_list("--data_dir", param_list)

    tuplist = list(product(*param_list))

#    # Shuffle the tuplist
#    import random
#    random.seed(42)
#    random.shuffle(tuplist)

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
