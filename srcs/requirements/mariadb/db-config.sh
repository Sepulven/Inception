#!/bin/bash
## The sleep command given time for the mariadb start properly before
## executing

if ! [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]; 
then
	service mariadb start
	while ! mysqladmin ping -u root --silent ; do
		echo "Waiting for MariaDB to start..."
		sleep 2
	done

	# We need to specify the --socket and --host because these files (my.cnf or my.ini)
	# does not have the correct access to these attr.

	mysql --socket=$MYSQL_SOCKET --host=$MYSQL_TCPIP_HOST -uroot --password="" -e "
        USE \`mysql\`;
        ALTER USER root@localhost IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
        CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\`;
        CREATE USER IF NOT EXISTS '$MYSQL_USERNAME'@'%';
        GRANT ALL PRIVILEGES ON \`$MYSQL_DATABASE\`.* TO '$MYSQL_USERNAME'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
        FLUSH PRIVILEGES;
        "

	# $? holds the status value of the last executed code
	# -eq(operator that means equal)
	if [ $? -eq 0 ]; then
		echo "MySQL setup completed successfully."
	else
		echo "MySQL setup failed."
	fi

	service mariadb stop
	while mysqladmin ping -u root -p"$MYSQL_ROOT_PASSWORD" --silent; do
		echo "Waiting for MariaDB to stop..."
		sleep 2
	done
else
   echo "Database has already been created."
fi

echo "MariaDB is running in the foreground[...]"


# Using msqld_safe in a docker context must be beneficial given that the MariaDB 
#server restarts if it crashes, logs erros, and applies certain safete configurations.
# Link: https://dev.mysql.com/doc/refman/8.4/en/mysqld-safe.html

mysqld_safe --bind-address=0.0.0.0 --port=3306
## By default mysql listen on port 3306
