#!/bin/bash

######################FusionInventory-Agent setup script####
LINK='https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.3.21/FusionInventory-Agent-2.3.21-1.pkg.tar.gz'
############################################################

# FusionInventory-Agent setup script for osx using download link :

echo'############Installing homebrew#############################'
#Checking homebrew is present 
HOMEBREW=$(brew -v)

echo "DEBUG : $PWD ; $HOMEBREW "
echo "DEBUG : $LINK "

if [ $(HOMEBREW) != '']; then
	echo "# homebrew is already installed"
else
	echo "# Installing homebrew"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
echo '############Installing make#############################';
brew install make;
echo '############Downloading the agent installer########################';
brew install wget;

mkdir /temp/fusioninventory-agent;
cd /temp/fusioninventory-agent;

sudo wget -P /temp/fusioninventory-agent/ $LINK;
sudo tar -xzf /temp/fusioninventory-agent/FusionInventory-Agent*.tar.gz;
ls -al;

sudo installer -pkg FusionInventory-Agent*.pkg -target / -lang en;
echo '############Terminating#####################################';
rm /temp/fusioninventory-agent/*.tar.gz*;
echo 'done';
s