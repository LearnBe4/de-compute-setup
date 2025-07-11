build:
	docker compose build

build-nc:
	docker compose build --no-cache

build-progress:
	docker compose build --no-cache --progress=plain

down:
	docker compose down --volumes --remove-orphans

run:
	make down && docker compose up

run-scaled:
	make down && docker compose up --scale spark-worker=2

run-d:
	make down && docker compose up -d

stop:
	docker-compose stop
