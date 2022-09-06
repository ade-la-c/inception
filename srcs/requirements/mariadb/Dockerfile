FROM	debian:buster

# EXPOSE	3306

RUN		apt-get update -y && \
		apt-get upgrade -y && \
		apt-get install mariadb-server mariadb-client -y

RUN		mkdir -p /var/lib/mysqld /run/mysqld

COPY	./create_db.sql /tmp/create_db.sql

COPY	./my.cnf /etc/my.cnf.d/

COPY	./entrypoint.sh /
RUN		chmod +x ./entrypoint.sh
RUN		mariadb-install-db --datadir=/var/lib/mysql --auth-root-authentication-method=normal

RUN		chown -R mysql:mysql /var/lib/mysql
RUN		chown -R mysql:mysql /run/mysqld

ENTRYPOINT [ "sh", "entrypoint.sh" ]