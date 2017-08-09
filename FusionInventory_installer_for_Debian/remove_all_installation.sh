#!/bin/bash

echo '=======================================';
echo 'desinstallation';
rm -rf /opt/glpi;
rm -rf /var/www/glpi;
rm -rf /etc/apche2/conf-enabled/glpi.conf;
echo '=======================================';
echo 'Note : you may have a cron bug, do crontab -e if you wish to delete the cron task glpi';

