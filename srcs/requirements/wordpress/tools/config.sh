#!/bin/bash

sleep 10
wp core download --allow-root
wp config create --dbhost=mariadb --dbname=mydata --dbuser=user1 --dbpass=user1234 --allow-root
wp core install --url=https://met-tahe.42.fr --title=website --admin_user=met-tahe --admin_password=met-tahe123 --admin_email=met-tahe@gmail.com --allow-root
wp user create usr usr@gmail.com --role=subscriber --user_pass=usr123@ --allow-root
sed -i -e 's/.*listen = .*/listen = 9000/' /etc/php/7.3/fpm/pool.d/www.conf
php-fpm7.3 -F -R --nodaemonize