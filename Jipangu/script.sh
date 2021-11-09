#!/bin/bash
echo "nameserver 192.168.122.1" | tee /etc/resolv.conf > /dev/null
apt-get update -y
apt-get install nano -y
apt-get install isc-dhcp-server -y

cp -r ~/backup/etc/default /etc/
cp -r ~/backup/etc/dhcp /etc/

service isc-dhcp-server restart
