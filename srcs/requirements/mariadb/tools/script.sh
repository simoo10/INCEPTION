#!/bin/sh

mysql_install_db;
service mysql start;

mysql -e "create database if not exists mydata;"
mysql -e "create user if not exists user1 identified by 'user1234';"
mysql -e "GRANT ALL PRIVILEGES ON mydata.* TO user1;"
mysql -e "FLUSH PRIVILEGES;"
service mariadb stop
mysql