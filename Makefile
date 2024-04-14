DOCKER_COMPOSE_FILE := docker-compose.dev.yaml

.PHONY: build-dev dev run stop update upgrade

build-dev:
	docker-compose -f $(DOCKER_COMPOSE_FILE) build

dev: build-dev
	docker-compose -f $(DOCKER_COMPOSE_FILE) up

run: build-dev
	docker-compose -f $(DOCKER_COMPOSE_FILE) up -d

stop:
	docker-compose -f $(DOCKER_COMPOSE_FILE) down

update:
	git pull

upgrade: stop update build-dev run 
