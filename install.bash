#!bin/bash

#nws installation script

#check if root user
if (( $EUID == 0)); then
    echo "Pleas do not run as root"
    exit
fi

#clone repo
git clone https://github.com/Falk-Witte/nws

#install newspaper3k

if [[ -a ${newspaper3k} ]]
then
    echo "newspaper3k is installed"
else
    pip install newspaper3k
fi

rm -f $0

