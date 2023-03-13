#!bin/bash

if [ ! -d /run/mysqld ]
then

	echo "Setting up MariaDB"
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
	# chmod -R 755 /var/lib/mysql
	chown -R mysql:mysql /var/lib/mysql

	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql

# service mysql start && 
cat << EOF > init.sql
	USE mysql;
	FLUSH PRIVILEGES;

	DELETE FROM mysql.user WHERE User='';
	DROP DATABASE test;
	DELETE FROM mysql.db WHERE Db='test';

	ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PW';

	CREATE DATABASE IF NOT EXISTS $DB_NAME;

	CREATE USER '$WP_BG_LOGIN'@'%';
	SET PASSWORD FOR '$WP_BG_LOGIN'@'%' = PASSWORD('$WP_BG_PW');
	GRANT ALL PRIVILEGES ON wordpress.* TO '$WP_BG_LOGIN'@'%';
	GRANT ALL ON wordpress.* to '$WP_BG_LOGIN'@'%';
	FLUSH PRIVILEGES;

	CREATE USER '$WP_SG_LOGIN'@'%';
	SET PASSWORD FOR '$WP_SG_LOGIN'@'%' = PASSWORD('$WP_SG_PW');
EOF

mysqld --user=mysql --bootstrap < init.sql

fi

echo "MariaDB started"

exec mysqld --user=mysql --console #starts database server in foreground