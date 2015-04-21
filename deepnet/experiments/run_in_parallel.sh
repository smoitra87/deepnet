#!/bin/sh

( cd exp18040 ; ./runall.sh ; cd ..  ;  cd exp18044 ; ./runall.sh ; cd ..  ;  cd exp18048 ; ./runall.sh ; cd ..  ;  cd exp18052 ; ./runall.sh ; cd ..  ;  cd exp18056 ; ./runall.sh ; cd .. ) & 

( cd exp18041 ; ./runall.sh ; cd ..  ;  cd exp18045 ; ./runall.sh ; cd ..  ;  cd exp18049 ; ./runall.sh ; cd ..  ;  cd exp18053 ; ./runall.sh ; cd ..  ;  cd exp18057 ; ./runall.sh ; cd .. ) & 

( cd exp18042 ; ./runall.sh ; cd ..  ;  cd exp18046 ; ./runall.sh ; cd ..  ;  cd exp18050 ; ./runall.sh ; cd ..  ;  cd exp18054 ; ./runall.sh ; cd ..  ;  cd exp18058 ; ./runall.sh ; cd .. ) & 

( cd exp18043 ; ./runall.sh ; cd ..  ;  cd exp18047 ; ./runall.sh ; cd ..  ;  cd exp18051 ; ./runall.sh ; cd ..  ;  cd exp18055 ; ./runall.sh ; cd ..  ;  cd exp18059 ; ./runall.sh ; cd .. ) & 
