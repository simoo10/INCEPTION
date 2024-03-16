DIR= cd srcs
RUN= docker compose up --build -d
BUILD= docker compose build
PS= docker compose ps
DOWN= docker compose down
RMIMG= docker image rm -f wordpress mariadb nginx
RMVOL= docker volume rm -f wp_data mdb_data
RMMOUNT= sudo rm -rf /home/met-tahe/data
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
show_vol:
	docker volume ls
vol_rm:
	${RMVOL}
fclean:clean vol_rm
		${RMIMG}