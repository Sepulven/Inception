
# Specifies the base image as bullseye
FROM debian:bullseye

# Link to the guide:
# docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-open-source/#installing-prebuilt-debian-packages

# Update the Debian repository information:
RUN apt-get update

# Update apt-get for protection againts vulnerabilities:
RUN apt-get upgrade -y

# Install the NGINX Open Source package:
RUN apt-get install -y nginx

# Install curl for troubleshooting in the future:
RUN apt-get install -y curl

# Install vim for text editing:
RUN apt-get install -y vim

# Install openssl for TLS configurations:
RUN apt-get install -y openssl

#Copies our nginx file to the file system(COPY does replace the file)
#COPY ./nginx.conf /etc/nginx/

# Copies the bash script to the Desktop
COPY ./nginx.sh /home/

# Grant permission to the script
RUN chmod +x /home/nginx.sh

# Exposes port 80, no other duty besides documentation.
EXPOSE 80

# Exposes port 443 for SSL/TLS configuration
EXPOSE 443

# Runs the entrypoint script given it absolute path
ENTRYPOINT ["/home/nginx.sh"]
