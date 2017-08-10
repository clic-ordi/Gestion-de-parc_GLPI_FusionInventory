#!/bin/bash

echo "--HOW TO CONFIGURE THE AGENT--"
echo " * To configure the agent, do a right clic on the FusionInventory-Agent.pkg package and select 'Show the package content' "
echo " * Go in the Resources directory and modify the agent.cfg file according to you needs:"
echo " *[!]  server= /http/[ - ip_or_domain - ]/glpi/plugins/fusioninventory/front/plugin_fusioninventory.communication.php"
echo " *     uncomment the logfile = /var/log/fusioninventory.log to get some log files"
echo " *[!]  Increase backend-collect-timeout value from 30 to 180 because the command used to get some hardware information can be very long"
