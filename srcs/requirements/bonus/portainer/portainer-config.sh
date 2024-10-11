#!/bin/sh

echo "Portainer script start"

if [ ! -d "/bin/portainer/" ]; then

	# We are just downloading the binary, changing its permission and running it in the container.
	# Of course we had to map the docker socket to this container. This definition is specified in the 
	# docker-compose.yml.
	#
	# Unfortunately, I could not find any documentation on how to do it.
	# However, chat-gpt prompted me this solution.
	echo "Portainer not installed, installing now."
	curl -L https://github.com/portainer/portainer/releases/download/$PORTAINER_VERSION/portainer-$PORTAINER_VERSION-linux-amd64.tar.gz \
	    -o /tmp/portainer.tar.gz
	tar -xzf /tmp/portainer.tar.gz -C /tmp
	chmod +x /tmp/portainer/
	chown root:root /tmp/portainer/
	mv /tmp/portainer /bin/portainer
	rm -rf /tmp/portainer.tar.gz
fi
echo "Running portainer."

/bin/portainer/portainer
