#!/bin/sh

( cd exp13002 ; ./runall.sh ; cd ..  ;  cd exp13004 ; ./runall.sh ; cd ..  ;  cd exp13006 ; ./runall.sh ; cd ..  ;  cd exp13012 ; ./runall.sh ; cd ..  ;  cd exp13014 ; ./runall.sh ; cd ..  ) & 

( cd exp13003 ; ./runall.sh ; cd ..  ;  cd exp13005 ; ./runall.sh ; cd ..  ;  cd exp13013 ; ./runall.sh ; cd ..  ;  cd exp13015 ; ./runall.sh ; cd .. ;  cd exp13016 ; ./runall.sh ; cd .. ) & 
