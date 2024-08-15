#Inception Makefile made by Arthur Aguiar a.k.a: asepulve



all : build

build:
	docker compose -f ./srcs/docker-compose.yml build
up:
	docker compose -f ./srcs/docker-compose.yml up

stop:
	docker compose -f ./srcs/docker-compose.yml stop


