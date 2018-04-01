

echo -------------------------------------------------------------------
echo Install nginx [1/0]
echo -------------------------------------------------------------------

read option
if [ $option -eq 1 ] ; then
 	sudo yum install nginx -y
fi


## Install NGINX

## Install PHP and PHP-FPM
$ sudo yum install php -y
$ sudo yum install php-fpm -y

## Configure NGINX (see below)
$ sudo nano /etc/nginx/conf.d/default.conf

## Configure PHP-FPM (see below)
$ sudo nano /etc/php-fpm.d/www.conf

## Add NGINX and PHP-FPM service start to boot sequence
$ sudo chkconfig nginx on
$ sudo chkconfig php-fpm on

## Start NGINX and PHP-FPM service
$ sudo service nginx start
$ sudo service php-fpm start