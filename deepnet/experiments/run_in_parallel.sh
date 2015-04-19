#!/bin/sh

( cd exp18000 ; ./runall.sh ; cd ..  ;  cd exp18004 ; ./runall.sh ; cd ..  ;  cd exp18008 ; ./runall.sh ; cd ..  ;  cd exp18012 ; ./runall.sh ; cd ..  ;  cd exp18016 ; ./runall.sh ; cd .. ) & 

( cd exp18001 ; ./runall.sh ; cd ..  ;  cd exp18005 ; ./runall.sh ; cd ..  ;  cd exp18009 ; ./runall.sh ; cd ..  ;  cd exp18013 ; ./runall.sh ; cd ..  ;  cd exp18017 ; ./runall.sh ; cd .. ) & 

( cd exp18002 ; ./runall.sh ; cd ..  ;  cd exp18006 ; ./runall.sh ; cd ..  ;  cd exp18010 ; ./runall.sh ; cd ..  ;  cd exp18014 ; ./runall.sh ; cd ..  ;  cd exp18018 ; ./runall.sh ; cd .. ) & 

( cd exp18003 ; ./runall.sh ; cd ..  ;  cd exp18007 ; ./runall.sh ; cd ..  ;  cd exp18011 ; ./runall.sh ; cd ..  ;  cd exp18015 ; ./runall.sh ; cd ..  ;  cd exp18019 ; ./runall.sh ; cd .. ) & 
