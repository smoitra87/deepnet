#!/bin/bash

while [ 1 ] ; do
    python manage_impute.py --pull_finished
    python manage_impute.py --update_expalloc
    fab aws_idle_run_impute:deepnet 

    sleep 5
done






