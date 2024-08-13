



# Docker Files References
https://docs.docker.com/reference/dockerfile/


1. Write your command inside the **Dockerfile**
2. Build the docker file with:
   ```sudo docker build -t <images name> <directory to build from>```

	-t allows you to name the the image

Docker gathers all the files and subdirectories in this directory and sends them to the Docker daemon.

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

## Dockerfile

	### RUN
		Executes command in the container during the build process.(Build time)
	### CMD
		Executes command when the container is instatied.(Run time)
	### COPY
		Copies files from the host system into the container.
	### WORKDIR
		Changes working directory. (Works like cd)
	(<https://docs.docker.com/reference/dockerfile/)[https://docs.docker.com/reference/dockerfile/]


## .dockerignore file

	The .dockerignore file ignores all the files the same way .gitignore does, it doesn't send the specified files to the build
	context. Thus it reduces the size of the image.

### Bried History of Container in OS
	https://d2iq.com/blog/brief-history-containers
