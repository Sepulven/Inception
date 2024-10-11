#https://www.adminer.org/
#https://packages.debian.org/bullseye/adminer



#This is the link we are going to be downloading from
#https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php

# List of all file for adminer in bullseye
# https://packages.debian.org/bullseye/all/adminer/filelist
FROM debian:bullseye

RUN apt-get update

RUN apt-get upgrade -y

RUN apt-get install -y curl vim

RUN apt-get install -y php php-fpm php-mysql php-cli php-mysql

COPY ./adminer-config.sh /home/adminer-config.sh
RUN chmod +x /home/adminer-config.sh

#COPY ./www.conf /etc/php/7.4/fpm/pool.d/www.conf

EXPOSE 9001

ENTRYPOINT ["/home/adminer-config.sh"]