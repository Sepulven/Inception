
if [-f "/var/www/html"];
then
	mkdir -p /var/www/html


else
	echo "Adminer has already been installed"
fi


/usr/sbin/php-fpm7.4 --nodaemonize --allow-to-run-as-root