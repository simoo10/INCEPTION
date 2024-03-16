FROM	debian:bullseye
RUN    apt upgrade -y
RUN	apt update -y
RUN	apt install nginx -y
RUN    apt install openssl -y
RUN touch /etc/nginx/conf.d/nginx.conf
RUN mkdir /etc/nginx/ssl

COPY ./tools/nginx.sh nginx.sh
RUN     chmod +x nginx.sh

RUN mkdir -p /run/nginx

CMD ["sh", "nginx.sh"]