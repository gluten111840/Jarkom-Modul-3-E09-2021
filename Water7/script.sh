#!/bin/bash
echo "nameserver 192.168.122.1" | tee /etc/resolv.conf > /dev/null
apt-get update
apt-get install nano -y
apt-get install squid -y
apt-get install apache2-utils -y
service squid start

cp -r ~/backup/squid /etc/

echo "nameserver 192.204.2.2" > /etc/resolv.conf

service squid restart
