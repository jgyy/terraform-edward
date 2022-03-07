#!/bin/bash
apt-get update
apt-get -y install net-tools nginx
MYIP=`ifconfig | grep -E '(inet 10)|(addr:10)' | awk '{ print $2 }' | cut -d ':' -f2`
echo 'this is: '$MYIP > /var/www/html/index.html