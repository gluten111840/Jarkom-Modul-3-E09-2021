#!/bin/bash
apt-get update
apt-get install nano -y
apt-get install isc-dhcp-relay -y
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.204.0.0/16

cp -r ~/backup/etc/default /etc/
cp -r ~/backup/etc/network /etc/

service isc-dhcp-relay start
