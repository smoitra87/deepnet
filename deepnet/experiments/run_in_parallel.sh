#!/bin/sh

( cd exp4000 ; ./runall.sh ; cd ..  ;  cd exp4002 ; ./runall.sh ; cd .. ) & 

( cd exp4001 ; ./runall.sh ; cd ..  ;  cd exp4003 ; ./runall.sh ; cd .. ) & 
