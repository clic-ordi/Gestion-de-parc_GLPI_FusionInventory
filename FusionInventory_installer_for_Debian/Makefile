#GLPI installer

#You should immediately remove your ids after use

SQL_GLPI_LOGIN=glpi
SQL_GLPI_PWD=glpimdp

ROOT_SQL_LOGIN=root
ROOT_SQL_PWD=rootmdp

BDD_NAME=glpi_bdd

FUSION_URL=https://github.com/fusioninventory/fusioninventory-for-glpi/releases/download/glpi9.1%2B1.0/fusioninventory-for-glpi_9.1.1.0.tar.gz
GLPI_URL=https://github.com/glpi-project/glpi/releases/download/9.1.6/glpi-9.1.6.tgz

#Do not keep them written in the script !

install-fusioninventory-only:
	echo 'installing fusioninventory'
	sudo ./install_fusioninventory.sh;

install-glpi-only:
	echo 'installing glpi'
	sudo ./install_glpi.sh $(SQL_GLPI_LOGIN) $(SQL_GLPI_PWD) $(BDD_NAME) $(ROOT_SQL_LOGIN) $(ROOT_SQL_PWD) $(GLPI_URL);

complete-install:
	sudo make desinstall
	sudo make install
	sudo service apache2 restart
	rm /tmp/setup_bdd_for_glpi.sql
	echo 'fusioninventory must be installed through the web glpi client in configuration>plugins';

install:
	echo 'installing'
	sudo chmod +x *.sh
	sudo ./global_setup.sh
	sudo ./install_glpi.sh $(SQL_GLPI_LOGIN) $(SQL_GLPI_PWD) $(BDD_NAME) $(ROOT_SQL_LOGIN) $(ROOT_SQL_PWD) $(GLPI_URL)
	sudo ./setup_mysql.sh $(SQL_GLPI_LOGIN) $(SQL_GLPI_PWD) $(BDD_NAME) $(ROOT_SQL_LOGIN) $(ROOT_SQL_PWD)
	sudo ./install_fusioninventory.sh $(FUSION_URL);
	rm /tmp/setup_bdd_for_glpi.sql;
	
desinstall:
	echo 'removing glpi'
	sudo ./remove_all_installation.sh;

#bdd-only:
#	sudo ./setup_mysql.sh $(SQL_GLPI_LOGIN) $(SQL_GLPI_PWD) $(BDD_NAME)  $(ROOT_SQL_LOGIN) $(ROOT_SQL_PWD);

#after the installation it is advised to remove install/install.php
post-install: 
	sudo rm /var/www/glpi/install/install.php;

help:
	./help.sh;
