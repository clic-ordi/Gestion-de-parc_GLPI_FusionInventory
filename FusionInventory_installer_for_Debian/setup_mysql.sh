	#!/bin/bash
	echo '===========MYSQL CONFIGURATION========='

#echo "nombre d'argument du script : $#"
if [ $# -lt 5 ]
	then
	echo './setup_mysql.sh SQL_LOGIN SQL_MDP BDD_NAME ROOT_SQL_ID ROOT_SQL_MDP'
	exit 0;
else
	echo '* WARNING : REMOVE ID FROM BOTH SCRIPTS AND .SQL, see readme.mdown'
	echo 'setting up bdd with password and informations that shouldnt be stored here !'
	echo '* !'
	#echo "ARGS : GLPI : $1 $2 ; BDD : $3 ; SQL : $4 $5"
	touch /tmp/setup_bdd_for_glpi.sql
	echo "use mysql;" >> /tmp/setup_bdd_for_glpi.sql
	echo "CREATE DATABASE '$3' character set utf8;" >> /tmp/setup_bdd_for_glpi.sql;
	echo "SET PASSWORD FOR '$1'@'localhost' = PASSWORD('$2');" >> /tmp/setup_bdd_for_glpi.sql
	echo "GRANT ALL PRIVILEGES ON  $3.* TO '$1'@'localhost' IDENTIFIED BY '$2';" >> /tmp/setup_bdd_for_glpi.sql
	
	sudo mysql -u $4 -h localhost -p$5 < /tmp/setup_bdd_for_glpi.sql
	echo 'removing /tmp/setup_bdd_for_glpi.sql'
	rm /tmp/setup_bdd_for_glpi.sql
	echo '======================================='
	exit 0;

fi
