PHP_NGINX	=	/home/ade-la-c/data/php_nginx

DB			=	/home/ade-la-c/data/database

all:	up
		sudo mkdir -p /home/ade-la-c/data
		sudo mkdir -p /home/ade-la-c/data/php_nginx
		sudo mkdir -p /home/ade-la-c/data/database
		sudo chmod 777 /etc/hosts
		sudo echo "127.0.0.1 ade-la-c.42.fr" >> /etc/hosts
		sudo echo "127.0.0.1 www.ade-la-c.42.fr" >> /etc/hosts

up:
	docker-compose -f srcs/docker-compose.yml up --build

down:
	docker-compose -f srcs/docker-compose.yml down

first:
	curl https://wordpress.org/latest.tar.gz --output latest
	tar -xf latest
	rm -rf latest
	mv wordpress ${PHP_NGINX}/wordpress