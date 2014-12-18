#!/bin/bash

while [ 1 ] ; do
    python manage_experiments.py --pull_finished
    python manage_experiments.py --update_expalloc
    fab aws_idle_run_exp:deepnet 
    sleep 5
done






