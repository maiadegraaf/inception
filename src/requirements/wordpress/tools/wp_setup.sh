#!bin/bash

mkdir -p /var/www/wordpress


if [ ! -f /var/www/wordpress/wp-config.php ]
then
	cd /var/www/wordpress #go into volume
    wp core download --allow-root
    # while ! echo "SHOW DATABASES;" | mariadb -hmariadb -u${WP_BOSS_LOGIN} -p${WP_BOSS_PASSWORD}; do sleep 1; done
    wp config create --allow-root  --path= --dbname=wordpress --dbuser=BigGuy --dbpass=bigsecret --dbhost=mariadb --config-file=/var/www/wordpress/wp-config.php --skip-packages --skip-plugins 

    echo Created config

	wp core install --allow-root --url=${WP_URL} --admin_user=${WP_BOSS_LOGIN} --admin_password=${WP_BOSS_PASSWORD} --title=mywordpresssite --admin_email=pleasedonotemailme@42.fr
	wp user create SmallGuy pleasedonotemailme2@42.fr --allow-root --user_pass=smallsecret;
	chown -R www-data:www-data /var/www/wordpress
fi
echo "Wordpress started"
php-fpm7.3 -R -F #runs on the foreground as root