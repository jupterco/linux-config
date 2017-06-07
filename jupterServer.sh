#!/bin/bash

# Debian Jessie

echo -------------------------------------------------------------------
echo Install git [1/0]
echo -------------------------------------------------------------------

read option
if [ $option -eq 1 ] ; then
	sudo apt-get install -y git
fi


echo -------------------------------------------------------------------
echo Install nginx [1/0]
echo -------------------------------------------------------------------

read option
if [ $option -eq 1 ] ; then
	sudo apt-get install -y nginx
fi

echo -------------------------------------------------------------------
echo Install php7.0 [1/0]
echo -------------------------------------------------------------------

read option
if [ $option -eq 1 ] ; then
	sudo apt-get install -y curl
	curl https://www.dotdeb.org/dotdeb.gpg | sudo apt-key add -
	echo 'deb http://packages.dotdeb.org jessie all' >> /etc/apt/sources.list
	echo 'deb-src http://packages.dotdeb.org jessie all' >> /etc/apt/sources.list
	sudo apt-get update
	sudo apt-get install -y php7.0
fi

