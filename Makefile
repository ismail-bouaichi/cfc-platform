.PHONY: up down build logs restart status migrate install shell-auth shell-gateway clean

# --- CORE COMMANDS ---
up:
	docker-compose up -d

down:
	docker-compose down

build:
	docker-compose up -d --build

logs:
	docker-compose logs -f

restart:
	docker-compose down && docker-compose up -d

status:
	docker-compose ps

# --- LARAVEL SPECIFIC (Microservices) ---

# Run migrations for ALL Laravel services at once
migrate:
	docker exec -it cfc-auth-service php artisan migrate --force
	docker exec -it cfc-formation-service php artisan migrate --force
	docker exec -it cfc-registration-service php artisan migrate --force

# Install dependencies for ALL services
install:
	docker exec -it cfc-auth-service composer install
	docker exec -it cfc-formation-service composer install
	docker exec -it cfc-registration-service composer install
	docker exec -it cfc-api-gateway npm install
	docker exec -it cfc-notification-service npm install

# --- SHELL ACCESS ---

# Quickly jump into the Auth service container
shell-auth:
	docker exec -it cfc-auth-service sh

# Quickly jump into the API Gateway
shell-gateway:
	docker exec -it cfc-api-gateway sh

# --- CLEANUP ---

# Warning: This removes volumes (DB data)
clean:
	docker-compose down -v