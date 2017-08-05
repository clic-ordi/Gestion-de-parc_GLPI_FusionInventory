#!/bin/bash


echo '=======================================';
echo 'installing dependancies'
echo '=======================================';
sudo apt update;
sudo apt install -y apache2 php mysql-server libapache2-mod-php php-mysql php-curl php-mbstring  php-gd php7.0-ldap php-xml php-simplexml php-xmlrpc php-apcu-bc php-imap xml-core;
echo '=======================================';
echo 'done'
echo '=======================================';
