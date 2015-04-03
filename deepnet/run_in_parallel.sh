#!/bin/sh

( experiments/impute_run_exp11000.sh  ;  experiments/impute_run_exp11001.sh  ;  experiments/impute_run_exp11002.sh  ;  experiments/impute_run_exp11003.sh  ;  experiments/impute_run_exp11004.sh ) & 

( experiments/impute_run_exp10000.sh  ;  experiments/impute_run_exp10001.sh  ;  experiments/impute_run_exp10002.sh  ;  experiments/impute_run_exp10003.sh  ;  experiments/impute_run_exp10004.sh ) & 
