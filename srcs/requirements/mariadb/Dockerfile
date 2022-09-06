FROM	debian:buster

# EXPOSE	3306

RUN		apt-get update -y && \
		apt-get upgrade -y && \
		apt-get install mariadb-server mariadb-client -y

RUN mkdir -p /var/lib/mysqld /run/mysqld

COPY	./my.cnf /etc/mysql/

COPY	./start.sh /

CMD		/start.sh
