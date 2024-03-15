#!/bin/bash

openssl req -x509 -nodes -out $SSLCERT -keyout $SSLKEY -subj "/C=MA/ST=Rehamna/L=Benguerir/O=42/OU=1337/CN=$DOMAINNAME/UID=met-tahe"

echo "server {
    listen 443 ssl;
    listen [::]:443 ssl;

    server_name $DOMAINNAME localhost;

    ssl_certificate $SSLCERT;
    ssl_certificate_key $SSLKEY; 
    ssl_protocols TLSv1.3 TLSv1.2;" > /etc/nginx/conf.d/nginx.conf
echo '
    index index.php index.html index.htm;
    root /var/www/html;

    location ~ [^/]\.php(/|$) {
            try_files $uri =404;
            fastcgi_pass wordpress:9000;
            include fastcgi_params;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        }
}' >> /etc/nginx/conf.d/nginx.conf

nginx -g "daemon off;"