#!bin/bash

#nws installation script

#check if root user
if (( $EUID == 0)); then
    echo "Pleas do not run as root"
    exit
fi

#install nws
wget https://raw.githubusercontent.com/Falk-Witte/nws/main/nws

#install newspaper3k
if [[ -a ${newspaper3k} ]]
then
    echo "newspaper3k is installed"
else
    pip install newspaper3k
fi

#install pyfiglet
if [[ -a ${pyfiglet} ]]
then
    echo "pyfiglet is installed"
else
    pip install pyfiglet
fi

#install colorama
if [[ -a ${colorama} ]]
then
    echo "colorama is installed"
else
    pip install colorama
fi

rm -f $0

