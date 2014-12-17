#!/bin/bash

while [ 1 ] ; do
    python manage_experiments.py --pull_finished
    python manage_experiment.py --update_expalloc
    fab aws_idle_run_exp:deepnet 
done






