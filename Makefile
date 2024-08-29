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

prune-volumes:
	docker system prune --volumes --force


# --force -> Skip the confirmation prompt.
# --all -> all danglings images
# Cleans up all of the installation proccess.
prune-images:
	docker system prune --all --force

prune-container:
	docker container prune -f

prune-network:
	docker network prune -f


# !!! Atenttion need to get fixed
#
#prune-volume:
#	docker volume rm -f m

stop-containers:
	docker stop $$(docker ps -qa)

rm-containers:
	docker rm $$(docker ps -qa)

rm-images:
	docker rmi -f $$(docker images -qa);

rm-volumes:
	docker volume rm $$(docker volume ls -q);

rm-network:
	docker network rm $$(docker network ls -q) 2>/dev/null

# From the evaluation sheet
clean:
	docker stop $$(docker ps -qa);
	docker rm $$(docker ps -qa);
	docker rmi -f $$(docker images -qa);
	docker volume rm $$(docker volume ls -q);
	rm -rf ~/data/wordpress/* ~/data/mariadb/*
	docker network rm $$(docker network ls -q);
