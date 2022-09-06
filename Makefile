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

clean:
	docker-compose -f srcs/docker-compose.yml down -v --rmi all --remove-orphans

first:
	curl https://wordpress.org/latest.tar.gz --output latest
	tar -xf latest
	rm -rf latest
	mv wordpress ${PHP_NGINX}/wordpress

fclean	:	clean
	sudo docker system prune --volumes --all --force
	sudo rm -rf /home/ade-la-c/data
	sudo docker network prune --force
	echo docker volume rm $(docker volume ls -q)
	sudo docker image prune --force