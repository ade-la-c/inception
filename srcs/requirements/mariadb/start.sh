echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$PASSWORD';" > /var/lib/mysql/pass-reset
mysqld_safe --init-file=/var/lib/mysql/pass-reset
