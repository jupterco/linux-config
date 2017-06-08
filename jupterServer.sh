#!/bin/bash

# Debian Jessie

sudo apt-get update

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


echo -------------------------------------------------------------------
echo Install TensorFlow [1/0]
echo -------------------------------------------------------------------

read option
if [ $option -eq 1 ] ; then
	sudo apt-get install python3-numpy python3-dev python3-pip python3-wheel
	cd ~/
	git clone https://github.com/tensorflow/tensorflow 
	cd tensorflow
fi

sudo apt-get update

echo -------------------------------------------------------------------
echo Install MySQL [1/0]
echo -------------------------------------------------------------------

read option
if [ $option -eq 1 ] ; then
	sudo apt-get install mysql-server
	sudo mysql_secure_installation
fi