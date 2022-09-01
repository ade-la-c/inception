echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$PASSWORD';" > /var/lib/mysql/init_file
mysqld_safe --init-file=/var/lib/mysql/init_file
