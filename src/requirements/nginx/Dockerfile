FROM debian:buster

RUN apt-get update
RUN apt-get install -y nginx openssl curl
RUN apt-get -y install libfcgi0ldbl

COPY conf/nginx.conf /etc/nginx/sites-available/default.conf

# RUN ln -s /etc/nginx/sites-available/mgraaf.42.fr /etc/nginx/sites-enabled/mgraaf.42.fr

# RUN openssl req -nodes -newkey rsa:4096 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=NL/ST=FunkyState/L=BlepCity/O=Bloebla Inc./CN=Ms. Fliebel" -x509
RUN openssl req -nodes -newkey rsa:4096 -keyout /etc/nginx/key.key -out /etc/nginx/crt.crt -subj "/C=NL/ST=FunkyState/L=BlepCity/O=Bloebla Inc./CN=Ms. Fliebel" -x509
# RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/CN=mgraaf.42.fr"
# RUN chmod 775 /etc/ssl/private/nginx-selfsigned.key
# RUN chmod 775 /etc/ssl/certs/nginx-selfsigned.crt

EXPOSE 443

ENTRYPOINT echo "Running nginx" && nginx -g 'daemon off;'