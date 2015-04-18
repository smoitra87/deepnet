#!/bin/sh

( experiments/impute_run_exp18000.sh  ;  experiments/impute_run_exp18004.sh  ;  experiments/impute_run_exp18008.sh  ;  experiments/impute_run_exp18012.sh  ;  experiments/impute_run_exp18016.sh ) & 

( experiments/impute_run_exp18001.sh  ;  experiments/impute_run_exp18005.sh  ;  experiments/impute_run_exp18009.sh  ;  experiments/impute_run_exp18013.sh  ;  experiments/impute_run_exp18017.sh ) & 

( experiments/impute_run_exp18002.sh  ;  experiments/impute_run_exp18006.sh  ;  experiments/impute_run_exp18010.sh  ;  experiments/impute_run_exp18014.sh  ;  experiments/impute_run_exp18018.sh ) & 

( experiments/impute_run_exp18003.sh  ;  experiments/impute_run_exp18007.sh  ;  experiments/impute_run_exp18011.sh  ;  experiments/impute_run_exp18015.sh  ;  experiments/impute_run_exp18019.sh ) & 
