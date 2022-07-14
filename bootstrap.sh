#!/bin/bash
echo "Hello go cloud engineers"

#using the ip  command sine the  ifconfig requires package install
ipaddress=$( ip address show | grep "enp0s8$" | awk '{ print $2 }' )
echo $ipaddress

#shwos parameter to determmine support for certain functions
if [[ $1 == "showos" ]]; then
        uname -a
fi 

#Build an Apache web application, with autoscaling
#web server
sudo apt install apache2 -y
sudo service apache2 start

#save ip address to the index.html file for display and potential 
# troubleshooting  if needed
echo $ipaddress > /var/www/html/index.html
echo "hello, go cloud engineers" >> /var/www/html/index.html

#Run Stress
sudo apt install stress -y
stress --cpu 1 --io 4 --vm-bytes 128M --timeout 30s

echo "done"