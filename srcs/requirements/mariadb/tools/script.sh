#!/bin/sh

mysql_install_db;
service mysql start;

mysql -e "create database if not exists $DBNAME;"
mysql -e "create user if not exists $DBUSER identified by '$DBPASS';"
mysql -e "GRANT ALL PRIVILEGES ON $DBNAME.* TO $DBUSER;"
mysql -e "FLUSH PRIVILEGES;"
service mariadb stop
mysql