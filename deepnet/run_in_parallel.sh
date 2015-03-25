#!/bin/sh

( experiments/impute_run_exp4000.sh  ;  experiments/impute_run_exp4002.sh ) & 

( experiments/impute_run_exp4001.sh  ;  experiments/impute_run_exp4003.sh ) & 
