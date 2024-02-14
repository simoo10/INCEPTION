wp core download --allow-root
wp config create --allow-root \
                        --dbname =SQL_DATABASE \
						--dbuser=SQL_USER \
						--dbpass=SQL_PASSWORD \
						--dbhost=mariadb:3306 --path='/var/www/wordpress'
wp core install --url=met-tahe.42.fr --title="MONSTER" --admin_user=met-tahe --admin_password=met-tahe123 --admin_email=met-tahe@gmail.com --allow-root
wp user create usr usr@gmail.com --role=author --user_pass=usr123 --allow-root
sed -i -e 's/.*listen = .*/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf