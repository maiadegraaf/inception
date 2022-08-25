#!bin/bash

chmod -R 755 /var/lib/mysql
chown -R mysql:mysql /var/lib/mysql

mysql_install_db --basedir=/usr --datadir=/var/lib/mysql

service mysql start && mysql -u root << EOF  
	CREATE DATABASE IF NOT EXISTS wordpress;

	CREATE USER 'BigGuy'@'%';
	SET PASSWORD FOR 'BigGuy'@'%' = PASSWORD('bigsecret');
	GRANT ALL PRIVILEGES ON wordpress.* TO 'BigGuy'@'%';
	-- IDENTIFIED BY ('itsasecret');
	GRANT ALL ON wordpress.* to 'BigGuy'@'%';
	FLUSH PRIVILEGES;

	CREATE USER 'SmallGuy'@'%';
	SET PASSWORD FOR 'SmallGuy'@'%' = PASSWORD('smallsecret');
EOF

mysqladmin -u root -p$WP_ROOT_PW shutdown

mysqld #starts database server in foreground