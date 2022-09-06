delete from	mysql.user where User='';
delete from mysql.user where User='root' and Host not in ('localhost', '127.0.0.1', '::1');
set password for 'root'@'localhost' = password('$MARIADB_ROOT_PWD');
create database $MARIADB_DB;
create user '$MARIADB_USER'@'%' identified by '$MARIADB_PWD';
grant all privileges on $MARIADB_DB.* to $MARIADB_USER@'%';
flush privileges;