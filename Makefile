# Django Development with Docker Compose
# Usage: make <command>

# Variables
COMPOSE = docker compose --profile dev
EXEC = $(COMPOSE) exec web
DJANGO = $(EXEC) bash -c "cd /app/app && python manage.py

.PHONY: help build up down restart shell logs test clean

# Default target
help:
	@echo "Available commands:"
	@echo "  build          - Build all containers"
	@echo "  up             - Start all services"
	@echo "  down           - Stop all services"
	@echo "  restart        - Restart all services"
	@echo "  shell          - Open Django shell"
	@echo "  bash           - Open bash in web container"
	@echo "  logs           - Show logs for all services"
	@echo "  logs-web       - Show logs for web service only"
	@echo "  makemigrations - Create new migrations"
	@echo "  migrate        - Apply migrations"
	@echo "  createsuperuser- Create Django superuser"
	@echo "  collectstatic  - Collect static files"
	@echo "  test           - Run all tests"
	@echo "  clean          - Remove containers and volumes"
	@echo "  rebuild        - Clean build and start"

# Docker commands
build:
	$(COMPOSE) build

up:
	$(COMPOSE) up

down:
	$(COMPOSE) down

restart:
	$(COMPOSE) restart

logs:
	$(COMPOSE) logs -f

logs-web:
	$(COMPOSE) logs -f web

clean:
	$(COMPOSE) down -v --remove-orphans
	docker system prune -f

rebuild: clean build up

# Django commands
shell:
	$(DJANGO) shell"

bash:
	$(EXEC) bash

makemigrations:
	$(DJANGO) makemigrations"

migrate:
	$(DJANGO) migrate"

createsuperuser:
	$(DJANGO) createsuperuser"

collectstatic:
	$(DJANGO) collectstatic --noinput"

# Testing
test:
	$(DJANGO) test --verbosity=2"

# Utility commands
ps:
	$(COMPOSE) ps

exec-web:
	$(EXEC) bash -c "cd /app/app && bash"

exec-postgres:
	$(COMPOSE) exec postgres psql -U postgres -d app_db 