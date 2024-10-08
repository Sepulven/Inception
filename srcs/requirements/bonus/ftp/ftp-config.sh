#!/bin/bash
if [ ! -f "/etc/vsftpd.conf.bak" ]; then

	# Creates a backup of the default configuration file
	# We might need this for backup in the future
	cp /etc/vsftpd.conf /etc/vsftpd.conf.bak
	mv /home/vsftpd.conf /etc/vsftpd.conf

	touch /tmp/vsftpd.log

	# Needed so vsftpd can run
	mkdir -p /var/run/vsftpd/empty

	echo $FTP_USER_NAME| tee -a /etc/vsftpd.userlist > /dev/null 2>&1
	echo "vsftp has been configured!"
else
	echo "FTP server has been configured!"
fi

echo "Starting ftp server on port 21..."
vsftpd /etc/vsftpd.conf
echo "We could not start the ftp server"

tail -f
