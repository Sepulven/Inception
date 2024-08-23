FROM debian:bullseye

# Update the Debian repository information:
RUN apt-get update

# Update apt-get for protection againts vulnerabilities:
RUN apt-get upgrade -y

# Installs curl in the system
RUN apt-get install -y curl

RUN apt-get install -y vim

# List of the php extension recommend for the last version of wordpress
# List -> https://make.wordpress.org/hosting/2024/07/10/wordpress-6-6-server-compatibility/
# List -> https://zeropointdevelopment.com/required-php-extensions-for-wordpress-wpquickies/
# List -> https://wordpress.com/support/php-environment/



RUN apt-get -y php

RUN apt-get -y php-fpm

# !!! Very important
# This is the actual list
# -> https://make.wordpress.org/hosting/handbook/server-environment/#php-extensions


# The PHP extensions listed below are required for a WordPress site to work.
RUN apt-get php-json # -> Used for communications with other servers and processing data in JSON format.
RUN apt-get php-mysql # -> Connects to MySQL for database interactions. (Install the mysqli)

# The PHP extensions listed below are highly recommended in order to allow WordPress to operate optimally and to maximise compatibility with many popular plugins and themes.

RUN apt-get php-curl # Performs remote request operations. 
RUN apt-get php-dom  # Used to validate Text Widget content and to automatically configure IIS7+.
RUN apt-get php-exif # (requires php-mbstring) – Works with metadata stored in images. 
RUN apt-get php-fileinfo  #  Used to detect mimetype of file uploads. 
RUN apt-get php-hash # Used for hashing, including passwords and update packages.
RUN apt-get php-igbinary # Increases performance as a drop in replacement for the standard PHP serializer. 
RUN apt-get php-imgick # Increases performance as a drop in replacement for the standard PHP serializer. 
RUN apt-get php-intl # Enable to perform locale-aware operations including but not limited to formatting, transliteration, encoding conversion, calendar operations, conformant collation, locating text boundaries and working with locale identifiers, timezones and graphemes. 
RUN apt-get php-mbstring # Used to properly handle UTF8 text. 
RUN apt-get php-openssl # SSL-based connections to other hosts. 
RUN apt-get php-pcre # Increases performance of pattern matching in code searches. 
RUN apt-get php-xml # Used for XML parsing, such as from a third-party site. 
RUN apt-get php-zip #  Used for decompressing Plugins, Themes, and WordPress update packages. 


#Copies the wp_script
COPY ./wp-config.sh /tmp/wp-config.sh

# Changes the permission of the script
RUN chmod +x /tmp/wp-config.sh

RUN /tmp/wp-config.sh

RUN rm /tmp/wp-config.sh



