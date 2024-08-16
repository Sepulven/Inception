#Inception Makefile made by Arthur Aguiar a.k.a: asepulve

.PHONY: all build up stop down clean

all : build

build:
	docker compose -f ./srcs/docker-compose.yml build

# The process of the container is running:
up:
	docker compose -f ./srcs/docker-compose.yml up

# The process of the container isn't running:
stop:
	docker compose -f ./srcs/docker-compose.yml stop

# The process of the container isn't running and all resources has been cleaned
# from the enviroment:

## Networks and volumes defined as external are never removed.
down:
	docker compose -f ./srcs/docker-compose.yml down

# From the evaluation sheet
clean:
	docker stop $$(docker ps -qa);
	docker rm $$(docker ps -qa);
	docker rmi -f $$(docker images -qa);
	#docker volume rm $$(docker volume ls -q); # => NO VOLUMES YET
	#docker network rm $$(docker network ls -q) 2>/dev/null  # => NO NETWORKS YET

