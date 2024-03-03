DIR= cd srcs
RUN= sudo docker compose up -d
BUILD= sudo docker compose build
PS= sudo docker compose ps
DOWN= sudo docker compose down
RMIMG= sudo docker rmi wordpress mariadb nginx
RMVOL= sudo docker volume rm -f wp_data mdb_data
all:vol_cr
		${DIR} && ${RUN}

vol_cr:
	mkdir -p /home/met-tahe/data/mariadb
	mkdir -p /home/met-tahe/data/wordpress
ps:
	${DIR} && ${PS}
clean:
	${DIR} && ${DOWN} && ${RMVOL}
mount_rm:
	sudo rm -rf /home/met-tahe/data
vol_rm:
	${RMVOL}
fclean:clean
		${RMIMG}