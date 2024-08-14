
# Specifies the base image as bullseye
FROM debian:bullseye

#Link to the guide:
# docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-open-source/#installing-prebuilt-debian-packages

# Update the Debian repository information:
RUN apt-get update

# Install the NGINX Open Source package:
RUN apt-get install -y nginx

# Install curl for troubleshooting in the future:
RUN apt-get install -y curl

#Copies our nginx file to the file system(COPY does replace the file)
#COPY ./nginx.conf /etc/nginx/

# Copies the bash script to the Desktop
COPY ./nginx.sh /home/

# Grant permission to the script
RUN chmod +x /home/nginx.sh

# Runs the entrypoint script given it absolute path
ENTRYPOINT ["/home/nginx.sh"]
