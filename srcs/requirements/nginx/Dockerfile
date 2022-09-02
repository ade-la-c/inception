FROM	debian:buster

RUN		apt-get update -y && \
		apt-get upgrade -y && \
		apt-get install nginx -y && \
		apt-get install openssl -y

COPY	wordpress.conf /etc/nginx/sites-enabled/

RUN		openssl req -x509 -nodes -days 365 -subj "/C=BE/ST=BXL/O=19/CN=localhost" -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt

CMD		nginx -g "daemon off;"
