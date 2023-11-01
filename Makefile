build:
	docker build
up:
	docker compose up -d
down:
	docker compose down -d
logs:
	docker compose logs -f
migrate-up:
	docker exec -it app rails db:migrate
run:
	docker compose run web
db-reset:
	docker exec -it app rails db:drop && \
		docker exec -it app rails db:create && \
		docker exec -it app rails db:migrate && \
		docker exec -it app rails db:seed
