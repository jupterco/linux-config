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

# chown -R www-data:www-data jupter/
# sudo apt-get install php7.0-cli php7.0-curl php7.0-dev php7.0-zip php7.0-fpm php7.0-gd php7.0-xml php7.0-mysql php7.0-mcrypt php7.0-mbstring php7.0-opcache -y



# python deve ser a 3.5
# http://curso-r.com/blog/2017/06/08/2017-06-08-keras-no-ubuntu/
# https://rstudio.github.io/keras/
# https://www.tensorflow.org/install/install_linux
# https://tensorflow.rstudio.com/
# https://github.com/aymericdamien/TensorFlow-Examples
# https://askubuntu.com/questions/799184/how-can-i-install-cuda-on-ubuntu-16-04
# https://theintelligenceofinformation.wordpress.com/2017/06/07/how-to-train-deploy-and-develop-tensorflow-ai-models-sparkml-from-jupyter-notebook-to-production/
# 


# www-data
# KdVhFJ2dmkhw3xxO
# crm 
# ikefred@c12!

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


# verificar falha de segurança
# sudo apt-get install iptables-persistent
# https://www.digitalocean.com/community/tutorials/how-to-install-mongodb-on-debian-8



# nginx
# server {
#         listen 80;
#         server_name jupter.co www.jupter.co;
#         root /home/jovianone/www/jupter;
#         index index.html index.htm index.php;
#         location ~ \.php$ {
#                 try_files $uri =404;
#                 fastcgi_pass unix:/var/run/php/php7.0-fpm.sock;
#                 fastcgi_index index.php;
#                 fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
#                 include fastcgi_params;
#         }
# }


# server {
#         listen 80;
#         server_name site.jupter.co;
#         return 301 http://jupter-1.rds.land$request_uri;
# }
