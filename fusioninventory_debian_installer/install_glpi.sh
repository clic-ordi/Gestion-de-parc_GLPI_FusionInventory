#!/bin/bash

echo '======================================='
echo '===========GLPI INSTALLATION==========='
echo '================SCRIPT================='

#echo "nombre d'argument du script : $#";

if [ "$#" -lt 6 ]
	then
	echo './install_glpi.sh SQL_LOGIN GLPI_BDD_NAME SQL_ROOT_ID SQL_ROOT_MDP GLPI_URL'
	exit 0;

else

	echo '======================================='
	echo 'beginning setup for glpi'
	service apache2 stop
	echo '======================================='

	echo 'deleting previous installation'
	rm -rf /opt/glpi
	echo '======================================='

	echo 'downloading glpi-9.1.6.tgz'
	cd /tmp
	rm -rf /tmp/*
	wget $6
	cd /opt/
	tar -xzf /tmp/glpi*.tgz
	rm /etc/apache2/conf-available/glpi.conf
	echo '======================================='

	echo 'creating glpi.conf'
	touch /etc/apache2/conf-available/glpi.conf
	echo 'Alias /glpi /var/www/glpi' >> /etc/apache2/conf-available/glpi.conf
	echo '<Directory /var/www/glpi>' >> /etc/apache2/conf-available/glpi.conf
	echo 'DirectoryIndex index.php' >> /etc/apache2/conf-available/glpi.conf
	echo 'Options FollowSymLinks' >> /etc/apache2/conf-available/glpi.conf
	echo 'AllowOverride Limit Options FileInfo' >> /etc/apache2/conf-available/glpi.conf
	echo 'Require all granted' >> /etc/apache2/conf-available/glpi.conf
	echo '</Directory>' >> /etc/apache2/conf-available/glpi.conf
	echo 'enabling glpi.conf'
	cd /etc/apache2/conf-enabled
	ln -s ../conf-available/glpi.conf
	echo '======================================='

	#/!\ Tester en 701, puis en 751, puis 777 si ça marche pas
	chmod -R 751 /opt/glpi/files
	chmod -R 751 /opt/glpi/config
	echo 'giving permissions to /files and /config'
	echo '======================================='

	echo 'moving glpi under var/www'
	mkdir /var/www #not present on every distrib it seems
	mv /opt/glpi /var/www/glpi
	echo '======================================='

	#phpmyadmin is not needed

	#echo 'installing phpmyadmin'
	#apt-get install -y phpmyadmin
	#echo '======================================='

	echo 'giving permissions to www-data'
	chown -R www-data:www-data /var/www/glpi
	echo '======================================='

	echo '...in case mysql is not installed : installing mysql'
	sudo apt-get install -y mysql-server mysql-client
	#phpmyadmin is not needed
	#echo 'reconfiguration of phpmyadmin'
	#dpkg-reconfigure phpmyadmin
	echo '======================================='
	echo 'restarting server'
	service apache2 restart
	echo 'installation complete'
	echo 'do not forget deleting install/install.php'
	echo '======================================='
	exit 0;
fi
