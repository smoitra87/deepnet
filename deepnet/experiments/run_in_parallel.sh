#!/bin/sh

( cd exp11001 ; ./runall.sh ; cd ..  ;  cd exp11004 ; ./runall.sh ; cd .. ) & 

( cd exp11002 ; ./runall.sh ; cd .. ) & 

( cd exp11000 ; ./runall.sh ; cd ..  ;  cd exp11003 ; ./runall.sh ; cd .. ) & 
