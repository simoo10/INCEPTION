FROM debian:buster

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y \
    php7.3 php7.3-fpm wget unzip php7.3-mysql
WORKDIR /var/www/html
RUN     wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN     chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
COPY    tools/config.sh config.sh
RUN     chmod +x config.sh
RUN mkdir -p /run/php/
RUN apt-get remove -y unzip wget && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN mkdir -p /var/run/php && \
    chmod 755 /var/run/php && \
    chown www-data:www-data /var/run/php
CMD ["bash","config.sh" ]