#!/bin/sh

mysql_install_db;
service mariadb start;

mariadb -e "create database if not exists $DBNAME;"
mariadb -e "create user if not exists '$DBUSER' identified by '$DBPASS';"
mariadb -e "GRANT ALL PRIVILEGES ON $DBNAME.* TO '$DBUSER';"
mariadb -e "FLUSH PRIVILEGES;"
service mariadb stop
exec mysqld_safe