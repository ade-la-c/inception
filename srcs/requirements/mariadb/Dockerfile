FROM	debian:buster

EXPOSE	3306

RUN		apt-get update -y && \
		apt-get upgrade -y && \
		apt-get install mariadb-server -y

COPY	./my.cnf /etc/mysql

COPY	./start.sh /

CMD		[ "./start.sh" ]
