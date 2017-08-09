#!/bin/bash

echo "downloading fusioninventory for glpi";
echo '======INSTALL_FUSIONINVENTORY============';
#echo "nombre d'argument du script : $#";
echo 'installing fusioninventory for glpi';
cd /tmp;
echo "downloading fusioninventory for glpi";
echo "from : $1";
wget $1;
echo '=======================================';
echo "unpacking";
tar -xzf fusioninventory-*.tar.gz;
mv /tmp/fusioninventory /var/www/glpi/plugins/fusioninventory;
echo '=======================================';
#To install daemon module on debian http://forum.fusioninventory.org/viewtopic.php?id=2939
cpan install Proc::Daemon;
echo '=====DONE INSTALL_FUSIONINVENTORY======';


