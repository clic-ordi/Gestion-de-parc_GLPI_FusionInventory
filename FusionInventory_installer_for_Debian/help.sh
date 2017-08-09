#!/bin/bash

echo "*****************HELP PANEL**********************************************";
	echo "*  install : intalls glpi + fusion inventory + few dependancies";
	echo "*  desinstall : deletes most of the files";
	echo "*  install-glpi-only : installs a glpi server";
	echo "*  install-fusioninventory-only : installs the fusioninventory plugin";
	echo "*  complete-install : removes the old installation and set it up again";
	echo "*  post-install : removes install/install.php, must only be done after a successful glpi setup on your web browser";

#	echo "*  bdd-only : script for testion setup_bdd.sql";
echo "*************************************************************************";
echo "Use make complete-install by default";

