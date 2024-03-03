#!/bin/sh

# mkdir /var/run/mysqld/
# chown -R nobody:nogroup /var/run/mysqld
# chmod 777 /var/run/mysqld

mysql_install_db;
service mysql start;

sleep 5

mysql -e "create database if not exists $DBNAME;"
mysql -e "create user if not exists '$DBUSER' identified by '$DBPASS';"
mysql -e "GRANT ALL PRIVILEGES ON $DBNAME.* TO '$DBUSER';"
mysql -e "FLUSH PRIVILEGES;"
service mysql stop
exec mysqld_safe