cat .setup 2> /dev/null
if [ $? -ne 0 ]; then
	# modification de la DB mysql
	usr/bin/mysqld_safe --datadir=/var/lib/mysql &

	# ping pour attendre que la DB soit accessible
	while ! mysqladmin ping -h "$MARIADB_HOST" --silent; do
	sleep 1
	done

	#creation de la DB avec mariadb
	eval "echo \"$(cat /tmp/create_db.sql)\"" | mariadb
	touch .setup
fi
#lancement de la DB mysql
usr/bin/mysqld_safe --datadir=/var/lib/mysql