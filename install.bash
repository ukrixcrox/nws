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
newspaper=~/.local/lib/python3.10/site-packages/newspaper/

if [[ -d $newspaper ]]
then
    echo "newspaper3k is installed"
else
    pip install newspaper3k
fi

#install pyfiglet
pyfiglet=/usr/lib/python3.10/site-packages/pyfiglet/

if [[ -a $pyfiglet ]]
then
    echo "pyfiglet is installed"
else
    pip install pyfiglet
fi

#install colorama
colorama=~/.local/lib/python3.10/site-packages/colorama/

if [[ -a $colorama ]]
then
    echo "colorama is installed"
else
    pip install colorama
fi

rm -f $0

