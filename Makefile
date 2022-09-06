PHP_NGINX	=	/home/ade-la-c/data/php_nginx

DB			=	/home/ade-la-c/data/db

all:	up

up:
	docker-compose -f srcs/docker-compose.yml up --build

down:
	docker-compose -f srcs/docker-compose.yml down

first:
	curl https://wordpress.org/latest.tar.gz --output latest
	tar -xf latest
	rm -rf latest
	mv wordpress ${PHP_NGINX}/wordpress