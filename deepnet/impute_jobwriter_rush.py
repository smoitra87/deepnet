import os, sys
import glob

expids = glob.glob('exp_ismb_rush/exp*')
expids = [os.path.basename(expid) for expid in expids]


splits = 4
mf_steps = 5
hid_mf_steps = 2

fouts = []
try:
    for idx in range(1,splits+1):
        jobfile = 'impute%d_run'%idx + '.sh'
        fout = open(jobfile, 'w')
        print >>fout, '#!/bin/sh'
        print >>fout
        fouts.append(fout)

    for idx, expid in enumerate(expids) : 

       cmd =  'python impute.py --model_file exp_ismb_rush/{0}/dbm_models/rbm1_BEST '+\
               '--train_file exp_ismb_rush/{0}/trainers/train_CD_rbm1.pbtxt '+\
               '--infer-method exact --outf exp_ismb_rush/likelihoods/{0}_rbm_pll.pkl'
       cmd = cmd.format(expid)
       print >>fouts[idx%splits], cmd
       print >>fouts[idx%splits]
       print >>fouts[idx%splits], 'sleep 2'
       print >>fouts[idx%splits]

       cmd =  'python impute.py --model_file exp_ismb_rush/{0}/dbm_models/dbm_BEST '+\
               '--train_file exp_ismb_rush/{0}/trainers/train_CD_rbm1.pbtxt '+\
               '--infer-method mf --mf-steps {1} --hidden-mf-steps {2} '+\
               '--outf exp_ismb_rush/likelihoods/{0}_dbm_pll.pkl'
       cmd = cmd.format(expid, mf_steps, hid_mf_steps)
       print >>fouts[idx%splits], cmd
       print >>fouts[idx%splits]
       print >>fouts[idx%splits], 'sleep 2'
       print >>fouts[idx%splits]
finally:
    for fout in fouts: 
        fout.close()
    for idx in range(1,splits+1):
        jobfile = 'impute%d_run'%idx + '.sh'
        os.system('chmod +x '+jobfile)
