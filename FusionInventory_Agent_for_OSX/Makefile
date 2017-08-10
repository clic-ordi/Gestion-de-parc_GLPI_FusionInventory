#Maintenance script for FusionInventory-Agent on OSX

force-agent-inventory:
	sudo /opt/fusioninventory-agent/fusioninventory-agent;

check-running:
	echo 'HELP : the following number is the agent PID, if it is different than 1 the service is working'
	make check-running-no-help;

check-running-no-help:
	sudo launchctl list|grep fusion;

start-agent:
	sudo launchctl start org.fusioninventory.agent
	make check-running-no-help;

stop-agent: 
	sudo launchctl stop org.fusioninventory.agent
	make check-running-no-help;

force-stop-agent:
	sudo killall perl
	make check-running-no-help;

help:
	./help.sh;

configuration-help:
	./configuration.sh;