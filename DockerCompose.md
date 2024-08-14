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
