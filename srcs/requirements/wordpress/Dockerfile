FROM debian:bullseye

# Update the Debian repository information:
RUN apt-get update

# Update apt-get for protection againts vulnerabilities:
RUN apt-get upgrade -y

# Installs curl in the system
RUN apt-get install -y curl

RUN apt-get install -y vim


#Bash is not nativaly installed
RUN apt-get install bash

# List of the php extension recommend for the last version of wordpress
# List -> https://make.wordpress.org/hosting/2024/07/10/wordpress-6-6-server-compatibility/
# List -> https://zeropointdevelopment.com/required-php-extensions-for-wordpress-wpquickies/
# List -> https://wordpress.com/support/php-environment/

RUN apt-get install -y php

RUN apt-get install -y php-fpm # fast cgi for nginx

# !!! Very important
# This is the actual list
# -> https://make.wordpress.org/hosting/handbook/server-environment/#php-extensions


# The PHP extensions listed below are required for a WordPress site to work.
RUN apt-get install -y php-json # -> Used for communications with other servers and processing data in JSON format.
RUN apt-get install -y php-mysql # -> Connects to MySQL for database interactions. (Install the mysqli)

# The PHP extensions listed below are highly recommended in order to allow WordPress to operate optimally and to maximise compatibility with many popular plugins and themes.

RUN apt-get install -y php-curl # Performs remote request operations. 
RUN apt-get install -y php-dom  # Used to validate Text Widget content and to automatically configure IIS7+.
RUN apt-get install -y php-exif # (requires php-mbstring) – Works with metadata stored in images. 
RUN apt-get install -y php-fileinfo  #  Used to detect mimetype of file uploads. 

# Comes in the php core
#RUN apt-get install -y php-hash # Used for hashing, including passwords and update packages.

RUN apt-get install -y php-igbinary # Increases performance as a drop in replacement for the standard PHP serializer. 
RUN apt-get install -y php-imagick # Increases performance as a drop in replacement for the standard PHP serializer. 
RUN apt-get install -y php-intl # Enable to perform locale-aware operations including but not limited to formatting, transliteration, encoding conversion, calendar operations, conformant collation, locating text boundaries and working with locale identifiers, timezones and graphemes. 
RUN apt-get install -y php-mbstring # Used to properly handle UTF8 text. 


# This packages doesn't exists
#RUN apt-get install -y php-openssl # SSL-based connections to other hosts. 

#RUN apt-get install -y php-pcre # Increases performance of pattern matching in code searches. 


RUN apt-get install -y php-xml # Used for XML parsing, such as from a third-party site. 
RUN apt-get install -y php-zip #  Used for decompressing Plugins, Themes, and WordPress update packages. 


#Copies the wp_script
COPY ./wp-config.sh /tmp/wp-config.sh

# Changes the permission of the script
RUN chmod +x /tmp/wp-config.sh

RUN /tmp/wp-config.sh

RUN rm /tmp/wp-config.sh

EXPOSE 9000

#CMD tail -f > /dev/null

# Runs php-fpm in foreground mode

# Manual for php-fpm7.4 ->  https://manpages.debian.org/bullseye/php7.4-fpm/php-fpm7.4.8.en.html

# -R --allow-to-run-as-root -> Allows pool to run as root
# -F --nodaemonize -> Force to stay in foreground and ignore daemonize option from configuration file.

ENTRYPOINT ["/usr/sbin/php-fpm7.4", "--nodaemonize",  "--allow-to-run-as-root"]
