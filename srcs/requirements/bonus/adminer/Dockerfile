#https://www.adminer.org/
#https://packages.debian.org/bullseye/adminer


# List of all file for adminer in bullseye
# https://packages.debian.org/bullseye/all/adminer/filelist
FROM debian:bullseye

RUN apt-get update

RUN apt-get upgrade -y

RUN apt-get install -y curl vim

RUN apt-get install -y php-fpm php-mysql php-cli php-mysql

COPY ./adminer-config.sh /home/adminer-config.sh
RUN chmod +x /home/adminer-config.sh

ENTRYPOINT ["/home/adminer-config.sh"]