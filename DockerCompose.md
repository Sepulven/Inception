# Docker Compose notes


Docker Compose is a tool for defining and running multi-container applications. It is the key to unlocking a streamlined and efficient development and deployment experience.

.	Start, stop, and rebuild services
.	View the status of running services
.	Stream the log output of running services
.	Run a one-off command on a service

Docker Compose is a tool for defining and running multi-container applications. It is the key to unlocking a streamlined and efficient development and deployment experience.

Compose simplifies the control of your entire application stack, making it easy to manage services, networks, and volumes in a single, comprehensible YAML configuration file. Then, with a single command, you create and start all the services from your configuration file.




## Note:
	When running docker composer from a directory that doesn't have the docker-compose.yml we can specify the file for the configuration file using the ```-f [PATH]``` flag.

	Example:

	```docker composer -f ./srcs/docker-compose.yml```
	(https://docs.docker.com/reference/cli/docker/compose/)[Link]

https://docs.docker.com/compose/


#Default .env file 

Automatic Loading: Docker Compose automatically loads environment variables from a .env file located in the same directory as the docker-compose.yml file. You do not need to specify the path for this .env file using env_file in your docker-compose.yml.

We can define this inside a service definition

env_file:
  - path: ./default.env
    required: true # default
  - path: ./override.env
    required: false


# Networking in DockerCompose:

https://docs.docker.com/compose/networking/

# Volumes in DockerCompose:

## What are Docker Volumes?

    -  Volumes are a mechanism for storing data outside of containers.
    - They are managed by Docker and stored in a dedicated directory on the host system (usually /var/lib/docker/volumes).
    - Volumes allow data persistence even when containers stop or crash.

https://docs.docker.com/engine/storage/volumes/
https://docs.docker.com/reference/cli/docker/volume/inspect/

