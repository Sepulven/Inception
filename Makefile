#Inception Makefile made by Arthur Aguiar a.k.a: asepulve

all :
	docker compose -f ./srcs/docker-compose.yml build
up:

	echo "Hello world";
