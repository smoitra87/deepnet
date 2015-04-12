#!/bin/sh

( cd exp14002 ; ./runall.sh ; cd .. ) & 

( cd exp14001 ; ./runall.sh ; cd ..  ;  cd exp14003 ; ./runall.sh ; cd .. ) & 
