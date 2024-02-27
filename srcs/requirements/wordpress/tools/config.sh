#!/bin/bash

sleep 10
wp core download --allow-root
wp config create --dbhost=$DBHOST --dbname=$DBNAME --dbuser=$DBUSER --dbpass=$DBPASS --allow-root
wp core install --url=$URL --title=$TITLE --admin_user=$ADMIN --admin_password=$ADMINPASS --admin_email=$ADMINEMAIL --allow-root
wp user create $USER $USEREMAIL --role=subscriber --user_pass=USERPASS --allow-root
sed -i -e 's/.*listen = .*/listen = 9000/' /etc/php/7.3/fpm/pool.d/www.conf
php-fpm7.3 -F -R --nodaemonize