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


echo -------------------------------------------------------------------
echo Install MySQL [1/0]
echo -------------------------------------------------------------------

read option
if  [$option -eq 1 ] ; then
	sudo apt-get install mysql-server
	sudo mysql_secure_installation # deu problema com acesso
fi


echo -------------------------------------------------------------------
echo Install SuiteCRM [1/0]
echo -------------------------------------------------------------------

read option
if  [$option -eq 1 ] ; then
	cd ~/www/crm/
	git clone https://github.com/salesagility/SuiteCRM.git
fi


echo -------------------------------------------------------------------
echo Install NodeJS [1/0]
echo -------------------------------------------------------------------

read option
if  [$option -eq 1 ] ; then
	curl -sL https://deb.nodesource.com/setup_8.x | bash -
	sudo apt-get install -y nodejs
fi


echo -------------------------------------------------------------------
echo Install MongoDB [1/0]
echo -------------------------------------------------------------------

read option
if  [$option -eq 1 ] ; then
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
	echo "deb http://repo.mongodb.org/apt/debian jessie/mongodb-org/3.4 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
	sudo apt-get update
	sudo apt-get install -y mongodb-org
	sudo systemctl enable mongod.service
	sudo systemctl start mongod
fi

echo -------------------------------------------------------------------
echo Testa Instalação do Mongo [1/0]
echo -------------------------------------------------------------------

read option
if  [$option -eq 1 ] ; then
	sudo systemctl status mongod
fi

