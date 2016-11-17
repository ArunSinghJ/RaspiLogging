#!/bin/bash

yum install git-core -y 
yum install gawk -y
yum install gcc -y
git clone https://github.com/ArunSinghJ/RaspiLogging
gcc /root/RaspiLogging/ExpHmax.c -o ExpHmax
chmod +x ExpHmax Newlogscript.sh ExpHmax.c
sed -i -e 's/\r$//' Newlogscript.sh
echo "@reboot ./RaspiLogging/Newlogscript.sh" >> /etc/crontab
reboot 




