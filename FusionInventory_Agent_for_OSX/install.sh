#!/bin/bash

######################FusionInventory-Agent setup script####
LANGAGE="fr"
LINK='https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.3.21/FusionInventory-Agent-2.3.21-1.pkg.tar.gz'
############################################################

# FusionInventory-Agent setup script for osx using download link :
PWD=$(pwd)
echo'############Installing homebrew#############################'
#Checking homebrew is present 
HOMEBREW=$("homebrew -v")
echo "DEBUG : $HOMEBREW"
if [ $(HOMEBREW) != '']; then
	echo "# homebrew is already installed"
else
	echo "# Installing homebrew"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
echo '############Installing make#############################'
brew install make
echo '############Downloading the agent installer########################'
brew install wget
mkdir /opt/fusioninventory-agent_temp
cd /opt/fusioninventory-agent_temp
wget $(LINK)
tar xfz fusioninventory-agent_macosx-intel_*.pkg.tar.gz
sudo installer -pkg FusionInventory-Agent.pkg -target / -lang $(LANGAGE)
echo '############Terminating#####################################'
rm -rf /opt/fusioninventory-agent_temp
cd $(PWD)
echo 'done'
make configuration-help
make help;