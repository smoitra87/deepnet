#!/bin/sh

( cd .. ; experiments/impute_run_exp4000.sh ; cd ..  ;  cd .. ; experiments/impute_run_exp4002.sh ; cd .. ) & 

( cd .. ; experiments/impute_run_exp4001.sh ; cd ..  ;  cd .. ; experiments/impute_run_exp4003.sh ; cd .. ) & 
