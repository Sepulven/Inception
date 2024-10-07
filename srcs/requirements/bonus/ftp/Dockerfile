# The post in which I am basing myself to do this container.
#   https://hostadvice.com/how-to/web-hosting/ubuntu/how-to-install-and-configure-vsftpd-on-ubuntu-18-04/

FROM debian:bullseye


# We need to declare that we want the variables from the args defined in the docker-compose.yml
ARG FTP_USER_NAME
ARG FTP_USER_PASSWORD

RUN apt-get upgrade -y

RUN apt-get update


RUN apt-get install -y curl vim

#https://wiki.debian.org/vsftpd
#vsftpd  an ftp server
RUN apt-get install -y vsftpd

RUN apt-get install -y passwd

#RUN adduser --disabled-password $FTP_USER_NAME
RUN mkdir -p /home/vsftpd
RUN adduser --disabled-password --home /home/vsftpd $FTP_USER_NAME
# -D -> create user with defualt option(no password, no special shell settings)  --disabled-password 
# -h -> tell where the home will
# $FTP_USER_NAME is the newly created user

RUN echo "$FTP_USER_NAME:$FTP_USER_PASSWORD"
# If the user has been created successfully we can then change its password
RUN id $FTP_USER_NAME && echo "$FTP_USER_NAME:$FTP_USER_PASSWORD" | chpasswd

#nobody:nogroup are assigned when we want the directory to have as minimal 
# priviligies as possible.
RUN chown nobody:nogroup /home/vsftpd
RUN chmod a-w /home/vsftpd

#We already have our where we can upload our files
# We just need to change its permissions
RUN mkdir -p /var/www/html
RUN chown $FTP_USER_NAME:$FTP_USER_NAME /var/www/html

COPY ftp-config.sh /home/
RUN chmod +x /home/ftp-config.sh


ENTRYPOINT ["/home/ftp-config.sh"]