# The post in which I am basing myself to do this container.
#   https://hostadvice.com/how-to/web-hosting/ubuntu/how-to-install-and-configure-vsftpd-on-ubuntu-18-04/

FROM debian:bullseye

RUN apt-get update

RUN apt-get upgrade -y

RUN apt-get install -y curl vim

#https://wiki.debian.org/vsftpd
#vsftpd  an ftp server
RUN apt-get install -y vsftpd

RUN adduser -D -h /home/vsftpd $FTP_USER_NAME
# -D -> create user with defualt option(no password, no special shell settings)
# -h -> tell where the home will
# $FTP_USER_NAME is the newly created user

RUN echo $FT_USER_NAME":"$FTP_USER_PASSWORD | chpasswd

#nobody:nogroup are assigned when we want the directory to have as minimal 
# priviligies as possible.
RUN sudo chown nobody:nogroup /home/vsftpd
RUN chmod a-w /home/vsftpd

#We already have our where we can upload our files
# We just need to change its permissions
RUN chown $FTP_USER_NAME:$FTP_USER_NAME /var/www/html

COPY ftp-config.sh /home/ftp-config.sh
RUN chmod +x /home/ftp-config.sh

ENTRYPOINT ["home/ftp-config.sh"]