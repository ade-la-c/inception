# cat .setup 2> /dev/null
# if [ $? -ne 0 ]; then
# 	# modification de la DB mysql
# 	mysql_install_db
# 	usr/bin/mysqld_safe --datadir=/var/lib/mysql &

# 	# ping pour attendre que la DB soit accessible
# 	while ! mysqladmin ping -h "$MARIADB_HOST" --silent; do
# 	sleep 1
# 	done

# 	#creation de la DB avec mariadb
# 	eval "echo \"$(cat /tmp/create_db.sql)\"" | mariadb
# 	touch .setup
# fi
# #lancement de la DB mysql
# usr/bin/mysqld_safe --datadir=/var/lib/mysql


if [ ! -d "/var/lib/mysql/wordpress" ]; then 

    mysql_install_db
    service mysql start
	echo "DROP DATABASE wordpress;" | mysql -u root --password=$MARIADB_PWD;
	echo "CREATE USER 'root'@'%' IDENTIFIED BY 'root';" | mysql -u root --password=$MARIADB_PWD;
	echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password;
	echo "ALTER DATABASE wordpress CHARACTER SET = 'utf8mb4' COLLATE = 'utf8mb4_general_ci';" | mysql -u root --password=$MARIADB_PWD;
	echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;" |  mysql -u root --password=$MARIADB_PWD;
	echo "FLUSH PRIVILEGES;" |  mysql -u root --password=$MARIADB_PWD;
    service mysql stop 
fi
#sleep 5
echo "ALTER USER 'root'@'localhost'IDENTIFIED BY '$DB_PASSWORD';" > /var/lib/mysql/pass-reset
mysqld_safe --init-file=/var/lib/mysql/pass-reset