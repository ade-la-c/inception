# FROM	debian:buster

# EXPOSE	3306

# RUN		apt-get update -y && \
# 		apt-get upgrade -y && \
# 		apt-get install mariadb-server -y && \
# 		apt-get install mariadb-client -y && \
# 		apt-get install vim -y

# RUN		mkdir -p /var/lib/mysqld /run/mysqld

# COPY	./create_db.sql /tmp/create_db.sql/

# COPY	./my.cnf /etc/my.cnf.d/

# COPY	./entrypoint.sh /
# RUN		chmod +x ./entrypoint.sh
# # RUN		mysql-install-db --datadir=/var/lib/mysql --auth-root-authentication-method=normal

# RUN		chown -R mysql:root /var/lib/mysql
# RUN		chown -R mysql:root /run/mysqld

# ENTRYPOINT [ "sh", "entrypoint.sh" ]



FROM debian:buster

RUN apt-get update
RUN apt-get upgrade

RUN apt-get install -y mariadb-server
RUN apt-get -y install vim

COPY entrypoint.sh .

EXPOSE 3306
COPY ./my.cnf /etc/mysql
COPY ./entrypoint.sh .

ENTRYPOINT [ "sh", "entrypoint.sh" ]
# CMD		/entrypoint.sh