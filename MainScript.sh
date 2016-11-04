#!/bin/bash

yum install git-core -y 
yum install gcc -y
git clone https://github.com/ArunSinghJ/RaspiLogging
gcc /root/RaspiLogging/ExpHmax.c -o ExpHmax
chmod +x ExpHmax Newlogscript.sh ExpHmax.c
echo "@reboot ./root/RaspiLogging/Newlogscript.sh" > /etc/crontab
reboot 




