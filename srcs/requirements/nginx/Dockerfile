FROM	debian:bullseye
RUN    apt upgrade -y
RUN	apt update -y
RUN	apt install nginx -y
RUN    apt install openssl -y
RUN touch /etc/nginx/conf.d/nginx.conf
RUN mkdir /etc/nginx/ssl
# RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes\
#        -out /etc/nginx/ssl/met-tahe.crt\
#        -keyout /etc/nginx/ssl/met-tahe.key\
#        -subj "/C=MA/ST=Rehamna/L=Benguerir/O=42/OU=1337/CN=met-tahe.42.fr/UID=met-tahe"

COPY ./conf/nginx.sh nginx.sh
RUN     chmod +x nginx.sh

RUN mkdir -p /run/nginx

EXPOSE	443

CMD ["sh", "nginx.sh"]