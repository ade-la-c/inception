echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PW';" > /var/lib/mysql/init_file
mysqld_safe --init-file=/var/lib/mysql/init_file