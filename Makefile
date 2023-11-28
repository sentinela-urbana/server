up:
	docker compose up --build -d
down:
	docker compose down -d
logs:
	docker compose logs -f
migrate-up:
	docker exec -it app rails db:migrate
seed:
	docker exec -it app rails db:seed
db-reset:
	docker exec -it app rails db:drop && \
		docker exec -it app rails db:create && \
		docker exec -it app rails db:migrate && \
		docker exec -it app rails db:seed
