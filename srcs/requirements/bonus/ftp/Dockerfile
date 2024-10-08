# The post in which I am basing myself to do this container.
#   https://hostadvice.com/how-to/web-hosting/ubuntu/how-to-install-and-configure-vsftpd-on-ubuntu-18-04/


## We are going to set up the ftp server to a directory that wordpress can also use.
# so from there we will be able to access the and upload file to wordpress
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

# man passwd:

# The passwd command changes passwords for user accounts.
#A normal user may only change the password for their own account,
# while the superuser may change the password for any account. 
#passwd also changes the account or associated password validity period.
RUN apt-get install -y passwd


# We have to be sure we will have the user directory
RUN mkdir -p /var/www/html/$FTP_USER_NAME

# --disabled-password  -> no password, no special shell settings
# -h -> tell where the home will
# $FTP_USER_NAME is the newly created user
RUN adduser --disabled-password --home /var/www/html/$FTP_USER_NAME $FTP_USER_NAME

# If the user has been created successfully we can then change its password

# id ->Print  user  and group information for each speci fied USER, 
#or (when USER omitted) for the  current user.
RUN id $FTP_USER_NAME && echo "$FTP_USER_NAME:$FTP_USER_PASSWORD" | chpasswd

# Grant the permission to the user
RUN chown $FTP_USER_NAME:$FTP_USER_NAME /var/www/html/$FTP_USER_NAME
RUN chmod u=rwx,g=rx,o=rx /var/www/html/$FTP_USER_NAME

# Grant permission to the ftp server
RUN chown $FTP_USER_NAME:$FTP_USER_NAME /var/www/html/$FTP_USER_NAME

COPY ftp-config.sh /home/
RUN chmod +x /home/ftp-config.sh

# We need to copy the config file for the ftp configuration
COPY ./vsftpd.conf /home/

ENTRYPOINT ["/home/ftp-config.sh"]

# In order to test it:
# On the host machine:
	# 1 -> Install ftp client
	#	sudo apt-get install ftp
	# 2
	# In the host machine we must allow the ports to works
	# sudo ufw enable
	# sudo ufw status verbose
	# sudo ufw allow 21/tcp
	# sudo ufw allow 21100:21110/tcp
	# 2 -> Run the client (it by default assumes that it will be the port 21)
	# 	ftp localhost
	# 3 -> Log In with the user defined in the Dockerfile
	# 4 -> navigate to the folder you want
	# (!pwd) -> we can check our current working directory in the host machine
	# (binary) -> in case we need to put binaries files like photos
	# 5 -> lcd <path>->local change directory, to go to the the local directory
	# 6 -> put command