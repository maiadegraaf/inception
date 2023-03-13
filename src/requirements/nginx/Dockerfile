FROM debian:buster

RUN apt-get update
RUN apt-get install -y nginx openssl curl
RUN apt-get -y install libfcgi0ldbl

COPY conf/nginx.conf /etc/nginx/sites-available/default.conf
COPY start.sh .

RUN chmod +x start.sh

RUN ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default.conf

RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/nginx/key.key -out /etc/nginx/crt.crt -subj "/CN=mgraaf.42.fr"

EXPOSE 443

ENTRYPOINT [ "./start.sh" ]