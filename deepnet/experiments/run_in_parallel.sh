#!/bin/sh

( cd exp18020 ; ./runall.sh ; cd ..  ;  cd exp18024 ; ./runall.sh ; cd ..  ;  cd exp18028 ; ./runall.sh ; cd ..  ;  cd exp18032 ; ./runall.sh ; cd ..  ;  cd exp18036 ; ./runall.sh ; cd .. ) & 

( cd exp18021 ; ./runall.sh ; cd ..  ;  cd exp18025 ; ./runall.sh ; cd ..  ;  cd exp18029 ; ./runall.sh ; cd ..  ;  cd exp18033 ; ./runall.sh ; cd ..  ;  cd exp18037 ; ./runall.sh ; cd .. ) & 

( cd exp18022 ; ./runall.sh ; cd ..  ;  cd exp18026 ; ./runall.sh ; cd ..  ;  cd exp18030 ; ./runall.sh ; cd ..  ;  cd exp18034 ; ./runall.sh ; cd ..  ;  cd exp18038 ; ./runall.sh ; cd .. ) & 

( cd exp18023 ; ./runall.sh ; cd ..  ;  cd exp18027 ; ./runall.sh ; cd ..  ;  cd exp18031 ; ./runall.sh ; cd ..  ;  cd exp18035 ; ./runall.sh ; cd ..  ;  cd exp18039 ; ./runall.sh ; cd .. ) & 
