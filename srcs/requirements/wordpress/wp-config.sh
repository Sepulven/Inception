# Downloads the file for wordpress

cd /var/www/html

# --silent -> doesn't print anything to the terminal
# -O -> tells curl to save the file as it is named remotely
curl --silent -O https://wordpress.org/latest.tar.gz .

echo "Wordpress files have downloaded"


# -x -> extract file
# -z -> .gz files
# -f -> path to the file
# Extract file
tar -xzf latest.tar.gz

# Remove .tar.gz
rm latest.tar.gz

# Saves the files in a given directory

mkdir asepulve.42.fr

mv wordpress/* asepulve.42.fr

rm -rf wordpress


echo "Wordpress files discompressed and in folder"


cd asepulve.42.fr

# We will replace the database values with ours
# Comes from the .env file
sed -i "s/database_name_here/$MYSQL_DATABASE_NAME" wp-config-sample.php
sed -i "s/username_here/$MYSQL_USERNAME" wp-config-sample.php
sed -i "s/password_here/$MYSQL_PASSWORD" wp-config-sample.php
sed -i "s/localhost/$MYSQL_LOCALHOST" wp-config-sample.php

mv wp-config-sample.php wp-config.php

echo "Add database config inside the wp-config-sample.php. "

#sed - stream editor for filtering and transforming text 
# sed [OPTION]... {script-only-if-no-other-script} [input-file]
# -i -> changes the actual file
# "s/old/new" -> the script. It searchs in the file for the value and replace it
#It works the same way as vim searching pattern.


# Creates the folder for php
mkdir -p /run/php

# The /run/php directory is a temporary filesystem location used by PHP and its associated processes, like PHP-FPM (FastCGI Process Manager), to store runtime data. Here’s a closer look at its purpose:


# Looks for the attr. listen inside the www.conf and changes it our port
sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 0.0.0.0:9000|g' /etc/php/7.4/fpm/pool.d/www.conf
