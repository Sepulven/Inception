#!/bin/bash
#tail -f 2> /dev/null

if ! [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]; 
then
    service mariadb start
    while ! mysqladmin ping -u root --silent ; do
        echo "Waiting for MariaDB to start..."
        sleep 2
    done

    # It has to be spaces for the indetention of the queries
    # We must SHUTDOWN the servic'e's session if we want to stop mariadb service
    export __QUERY="
        USE 'mysql';
        ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
        FLUSH PRIVILEGES;
        CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
        CREATE USER IF NOT EXISTS '$MYSQL_USERNAME'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
        GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USERNAME'@'%';
        FLUSH PRIVILEGES;
        SHUTDOWN;
        "
    # We need to specify the --socket and --host because these files (my.cnf or my.ini)
    # does not have the correct access to these attr.
    export __MYSQL_FLAGS="--socket=$MYSQL_SOCKET --host=$MYSQL_TCPIP_HOST"

    mysql $__MYSQL_FLAGS -uroot --password="" -e "$__QUERY" > /dev/null
    #$? holds the status value of the last executed code
    #-eq(operator that means equal)
    if [ $? -eq 0 ]; then
        echo "MySQL setup completed successfully:"
    else
        echo "MySQL setup failed:"
    fi
    echo "mysql $__MYSQL_FLAGS -uroot --password='' -e '$__QUERY'"

    # service mariadb stop 2> /dev/null > /dev/null
    # while mysqladmin $__MYSQL_FLAGS ping -u root -p"$MYSQL_ROOT_PASSWORD" 2> /dev/null; do
    #     echo "Waiting for MariaDB to stop..."
    #     sleep 2
    # done

    echo "We are going to kill all of the process of mysqld after mysql shutdown.";
    for PID in $(ps aux | grep '[m]ysqld' | awk '{print $2}'); do
        echo "Killing MySQL process with PID: $PID"
        kill -9 $PID
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