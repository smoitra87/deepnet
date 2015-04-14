#!/bin/sh

( experiments/impute_run_exp16000.sh  ;  experiments/impute_run_exp16002.sh ) & 

( experiments/impute_run_exp16001.sh  ;  experiments/impute_run_exp16003.sh ) & 
