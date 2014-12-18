#!/bin/bash

while [ 1 ] ; do
    fab aws_write_all_idle:prefix=deepnet,out_file=idle.txt
    python manage_experiments.py --pull_finished
    while read line
    do
        fab aws_stop_instance:$line
        sleep 0.5
    done < idle.txt
done


