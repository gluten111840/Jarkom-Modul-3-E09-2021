#!/bin/bash
apt-get update -y
apt-get install nano -y
apt-get install apache2 -y
apt-get install php -y
apt-get install libapache2-mod-php7.0 -y
service apache2 start

cp -r ~/backup/var/www /var/
cp -r ~/backup/etc/apache2 /etc/

cd /etc/apache2/sites-available
a2ensite super.franky.e09.com

service apache2 restart
