#UI over port 9443
#TCP tunnel server over port 8000
FROM debian:bullseye

#Portainer step by step guide:
#https://www.atlantic.net/dedicated-server-hosting/how-to-install-portainer-docker-ui-web-interface-on-debian/
#https://docs.portainer.io/start/install/server/docker/linux

#https://www.howtoforge.com/how-to-install-portainer-on-debian-11/

#Portainer architecture
#https://docs.portainer.io/start/architecture

#Link to the release binaries
#https://github.com/portainer/portainer/releases/

RUN apt-get upgrade -y
RUN apt-get update -y

RUN apt-get install -y curl vim

RUN apt-get install -y ca-certificates tzdata openssl

RUN update-ca-certificates

COPY ./portainer-config.sh /home/portainer-config.sh
RUN chmod +x /home/portainer-config.sh

EXPOSE 8000 9443

ENTRYPOINT [ "/home/portainer-config.sh" ]

