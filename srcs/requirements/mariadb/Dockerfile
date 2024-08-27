FROM debian:bullseye

RUN apt-get update

RUN apt-get upgrade -y

RUN apt-get install -y curl vim

# Install mariadb-server for dependencies in the future
RUN apt-get install -y mariadb-server

# DB config file script
COPY ./db-config.sh /tmp/db-config.sh
RUN chmod +x /tmp/db-config.sh

EXPOSE 3306

ENTRYPOINT ["sh", "-c",  "/tmp/db-config.sh"]
