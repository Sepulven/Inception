#!/bin/bash

#Adminer is a db manager in a php file.
#We can run it and expose it for the host machine and access the db through
# the same sort of informatioin we provided in the wp config file.

if ! [ -d "/var/www/html/adminer"];
then
	mkdir -p /var/www/html/adminer
	cd /var/www/html/adminer

	# We use these two flags to download our file.
	# -O -> Automatically saves the file using the name from the URL.
	# -L -> stands for location, in case the link has redirects
	curl -LO https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php

	# We can add some style to it:
	
	curl -LO https://raw.githubusercontent.com/pepa-linha/Adminer-Design-Dark/master/adminer.css
	mv adminer-4.8.1.php index.php

	sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 0.0.0.0:9001|g' /etc/php/7.4/fpm/pool.d/www.conf

	# Creates the folder for php
	mkdir -p /run/php
	# The /run/php directory is a temporary filesystem location used by PHP and its associated processes, like PHP-FPM (FastCGI Process Manager), to store runtime data. Here’s a closer look at its purpose:
	touch /run/php/php7.4-fpm.pid

	echo "adminer index.php file has been created."
else
	echo "Adminer has already been installed"
fi

echo "Adminer is running in the foreground..."
/usr/sbin/php-fpm7.4 --nodaemonize --allow-to-run-as-root
