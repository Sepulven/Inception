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

# Creates the folder in which the certification and the keys are going to be stored
RUN mkdir /etc/nginx/ssl

# Run the openssl toolkit with req to create a key and ssl certificate with the given flags
RUN openssl req -x509 -nodes -newkey rsa:4096 \
    -keyout /etc/nginx/ssl/asepulve.key \
    -out   /etc/nginx/ssl/asepulve.crt \
    -subj "/C=PT/L=Lisboa/ST=Lisboa/O=42Lisbon/"



# Notes about openssl
#  openssl: It's a toolkit that provides tools and libraries for secure communication
#  req: creates and processes certificate requests in PKCS#10 format. It can additionally create self signed certificates for use as root CAs for example. 
#  -x509: This option chooses the self signed certificate instead of a certificate request
#  -nodes: The private key is not encrypted, avoiding the need to enter a passphrase (stands for NO  data encryption)
#  -newkey rsa:4096: Creates a new key with RSA algo with 4096 bits in size   
#  -keyout [OUTFILE]: This gives the filename to write the newly created private key.
#  -out [OUTFILE]: This specifies the output filename to write to or standard output by default. (It has the certificate)
#  -subj [KEYVALUEPAIR]: Replaces subject field of input request with specified data and outputs modified request. The arg must be formatted as 
#
#  Notes: By default this key has the expiration date for 30 days from the creation of the keys and certificates. We can change that with another flags -days [values]

#Copies our nginx file to the file system(COPY does replace the file)
COPY ./default_inception.conf /etc/nginx/conf.d

# Copies the main nginx file with my specifications
COPY ./nginx.conf /etc/nginx/nginx.conf

# Copies the bash script to the Desktop
COPY ./nginx.sh /home/

# Copies the index.html in order to test SSL
COPY ./index.html /var/www/html/index.html

# Grant permission to the script
RUN chmod +x /home/nginx.sh

# Exposes port 80, no other duty besides documentation.
EXPOSE 80

# Exposes port 443 for SSL/TLS configuration
EXPOSE 443

# Runs the entrypoint script given it absolute path
ENTRYPOINT ["/home/nginx.sh"]
