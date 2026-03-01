.PHONY: up down build rebuild logs shell ps clean

SERVICE := jupyter

up:
	docker compose up -d --build

down:
	docker compose down

clean:
	docker compose down --remove-orphans
	# If you still have a manually created container with the old name, remove it:
	-docker rm -f handson-ml3 2>/dev/null || true

build:
	docker compose build --no-cache

rebuild: clean build up
	@echo "Rebuilt and started. Open http://localhost:8888"

logs:
	docker compose logs -f $(SERVICE)

shell:
	docker compose exec $(SERVICE) bash

ps:
	docker compose ps