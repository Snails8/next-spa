DC := docker-compose exec web
ARG := $1

up:
	docker-compose up -d --build

#create-project:
#	docker-compose up -d --build
#	docker-compose exec app composer create-project --prefer-dist laravel/laravel .
#	docker-compose exec app composer require predis/predis

reinstall:
	@make destroy
	@make install

stop:
	docker-compose stop

restart:
	docker-compose down
	docker-compose up -d

down:
	docker-compose down

destroy:
	docker-compose down --rmi all --volumes

ps:
	docker-compose ps

web:
	docker-compose exec web /bin/ash

yarn:
	docker-compose exec web yarn
	docker-compose exec web yarn dev