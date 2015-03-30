#!/bin/sh

( cd exp7002 ; ./runall.sh ; cd .. ) & 

( cd exp7000 ; ./runall.sh ; cd .. ) & 

( cd exp7001 ; ./runall.sh ; cd .. ) & 
