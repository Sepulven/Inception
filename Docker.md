



# Docker Files References
https://docs.docker.com/reference/dockerfile/


1. Write your command inside the **Dockerfile**
2. Build the docker file with:
   ```sudo docker build -t <images name> <directory to build from>```

	-t allows you to name the the image

3. Run the Docker Container
	```sudo docker run <image's name>```



4. List all images (including intermediate layers):
	```docker images -a```

## Removing Unused Docker Images 

1. Remove a specific image:
	```docker rmi IMAGE_ID```

2. Remove all dangling images:
	```docker image prune```

3. Remove all unused images (not just dangling):
	```docker image prune -a```

## Dockefile

	### RUN
		Executes command in the container during the build process.(Build time)
	### CMD
		Executes command when the container is instatied.(Run time)
	### COPY
		Copies files from the host system into the container.
	### WORKDIR
		Changes working directory. (Works like cd)
	(<https://docs.docker.com/reference/dockerfile/)[https://docs.docker.com/reference/dockerfile/]
		
