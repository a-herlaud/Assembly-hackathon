COMPOSE = docker compose -f srcs/docker-compose.yml

.PHONY: all build up down exec exec-ollama logs clean fclean

all: up

# build:
# 	$(COMPOSE) build

up: build
	$(COMPOSE) up --build -d

down:
	$(COMPOSE) down

exec-agent:
	$(COMPOSE) exec -it agent bash

exec-ollama:
	$(COMPOSE) exec -it ollama bash

logs:
	$(COMPOSE) logs -f

clean: down

fclean: down
	$(COMPOSE) down -v --rmi local