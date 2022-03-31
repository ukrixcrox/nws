#!bin/bash

#nws installation script

#check if root user
if (( $EUID == 0)); then
    echo "Pleas do not run as root"
    exit
fi

#install nws
wget https://raw.githubusercontent.com/Falk-Witte/nws/main/nws

#move nws into /bin
mv ./nws /bin/nws 

#install newspaper3k
newspaper=~/.local/lib/python3.10/site-packages/newspaper/
newspaper2=/usr/lib/python3.10/site-packages/newspaper/

if [[ -d $newspaper ]] || [[ -d $newspaper2 ]]
then
    echo "newspaper3k is installed"
else
    pip install newspaper3k
fi

#install pyfiglet
pyfiglet=/usr/lib/python3.10/site-packages/pyfiglet/
pyfiglet2=~/.local/lib/python3.10/site-packages/pyfiglet/

if [[ -d $pyfiglet ]] || [[ -d $pyfiglet2 ]]
then
    echo "pyfiglet is installed"
else
    pip install pyfiglet
fi

#install colorama
colorama=~/.local/lib/python3.10/site-packages/colorama/
colorama2=/usr/lib/python3.10/site-packages/colorama/

if [[ -d $colorama ]] || [[ -d $colorama2 ]]
then
    echo "colorama is installed"
else
    pip install colorama
fi

#self destruct after running
rm -f $0

