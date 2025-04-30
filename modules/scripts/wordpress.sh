#!/bin/bash
apt update -y
apt install apache2 php php-mysql wget unzip -y
cd /var/www/html
wget https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
cp -r wordpress/* .
rm -rf wordpress latest.tar.gz
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html