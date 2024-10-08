#!/bin/bash
if [ ! -f "/etc/vsftpd.conf.bak" ]; then

	# Creates a backup of the default configuration file
	# We might need this for backup in the future
	cp /etc/vsftpd.conf /etc/vsftpd.conf.bak

	#vsftpd.beasts.org/vsftpd_conf.html -> documentation of the ftp_config backup

	# Explanation on the vsftpd.conf:
	#The format of vsftpd.conf is very simple. Each line is either a comment or a directive. 
	#Comment lines start with a # and are ignored. A directive line has the format:option=value
	#It is important to note that it is an error to put any space between the option, = and value.
	#Each setting has a compiled in default which may be modified in the configuration file. 

	# listen=YES -> the server will respond to Ipv4 
	# background=NO -> forces the vsftp server to run in the foreground

	export __FTP_CONFIG= "listen=YES\n\
						background=NO\n\
						listen_ipv6=NO\n\
						anonymous_enable=NO\n\
						local_enable=YES\n\
						write_enable=YES\n\
						local_umask=022\n\
						dirmessage_enable=YES\n\
						use_localtime=YES\n\
						xferlog_enable=YES\n\
						connect_from_port_20=YES\n\
						chroot_local_user=YES\n\
						secure_chroot_dir=/var/run/vsftpd/empty\n\
						pam_service_name=vsftpd\n\
						pasv_enable=Yes\n\
						pasv_min_port=10000\n\
						pasv_max_port=11000\n\
						user_sub_token=$USER\n\
						local_root=/home/$USER/ftp\n\
						userlist_enable=YES\n\
						userlist_file=/etc/vsftpduserlist.conf\n\
						userlist_deny=NO"

	# We are going to be appending this content to the /etc/vsftp.conf
	echo -e "listen=YES\n\
			  background=NO\n\
			  listen_ipv6=NO\n\
			  anonymous_enable=NO\n\
			  local_enable=YES\n\
			  write_enable=YES\n\
			  local_umask=022\n\
			  dirmessage_enable=YES\n\
			  use_localtime=YES\n\
			  xferlog_enable=YES\n\
			  connect_from_port_20=YES\n\
			  chroot_local_user=YES\n\
			  secure_chroot_dir=/var/run/vsftpd/empty\n\
			  pam_service_name=vsftpd\n\
			  pasv_enable=Yes\n\
			  pasv_min_port=10000\n\
			  pasv_max_port=11000\n\
			  user_sub_token=$USER\n\
			  local_root=/home/$USER/ftp\n\
			  userlist_enable=YES\n\
			  userlist_file=/etc/vsftpduserlist.conf\n\
			  userlist_deny=NO" >> /etc/vsftpd.conf

	echo $FTP_USER_NAME| tee -a /etc/vsftpd.userlist > /dev/null 2>&1
	echo "vsftp has been configured!"
else
	echo "FTP server has been configured!"
fi

echo "Starting ftp server on port 21..."
vsftpd /etc/vsftpd.conf -o debug
echo "We could not start the ftp server"

tail -f
