
if ! [ -f "/etc/vsftpd.conf.bak"];
then

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

	export __FTP_CONFIG="listen=YES" \
						"background=NO"\
						"listen_ipv6=YES"\
						"anonymous_enable=NO"\
						"local_enable=YES"\
						"write_enable=YES"\
						"local_umask=022"\
						"dirmessage_enable=YES"\
						"use_localtime=YES"\
						"xferlog_enable=YES"\
						"connect_from_port_20=YES"\
						"chroot_local_user=YES"\
						"secure_chroot_dir=/var/run/vsftpd/empty"\
						"pam_service_name=vsftpd"\
						"pasv_enable=Yes"\
						"pasv_min_port=10000"\
						"pasv_max_port=11000"\
						"user_sub_token=$USER"\
						"local_root=/home/$USER/ftp"\
						"userlist_enable=YES"\
						"userlist_file=/etc/vsftpduserlist.conf"\
						"userlist_deny=NO"

	# We are going to be appending this content to the /etc/vsftp.conf
	echo $__FTP_CONFIG >> /etc/vsftpd.conf

else
	echo "FTP server has been configured!"
fi

