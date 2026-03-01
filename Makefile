.PHONY: up down build rebuild logs shell ps

SERVICE := jupyter

up:
	docker compose up -d --build

down:
	docker compose down

build:
	docker compose build --no-cache

rebuild:
	docker compose down
	docker compose build --no-cache
	docker compose up -d
	@echo "Rebuilt and started. Open http://localhost:8888"

logs:
	docker compose logs -f $(SERVICE)

shell:
	docker compose exec $(SERVICE) bash

ps:
	docker compose ps