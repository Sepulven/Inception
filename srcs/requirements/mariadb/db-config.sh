#!/bin/bash
## The sleep command given time for the mariadb start properly before
## executing
if [ -d "/var/lib/mysql/$DATABASE_NAME"]; 
then
    service mariadb start > /dev/null # Silence
    while !mysqladmin ping -u root --silent; do
        echo "Waiting for MariaDB to stop..."
        sleep 2
    done

    ## These queries must be escaped with (``) or MariaDB won't ever accept it. With single quotes for some scenarios.
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE_NAME\`;"
    mysql -u root -e "CREATE USER IF NOT EXISTS \`$MYSQL_USERNAME\`@'%';"
    mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO \`$MYSQL_USERNAME\`@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
    mysql -u root -e "FLUSH PRIVILEGES ; "

    echo "MariaDB has been created."

    service mariadb stop > /dev/null # Silence 
    while mysqladmin ping -u root --silent; do
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
# By default mysql listen on port 3306
