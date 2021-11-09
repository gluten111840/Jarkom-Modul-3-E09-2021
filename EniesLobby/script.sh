#!/bin/bash
echo "nameserver 192.168.122.1" | tee /etc/resolv.conf > /dev/null
apt-get update
apt-get install nano -y
apt-get install bind9 -y
service bind9 start

cp -r ~/backup/etc/bind /etc/

service bind9 restart
