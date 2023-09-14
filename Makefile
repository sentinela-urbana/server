build:
	docker compose up --build
up:
	docker compose up -d
down:
	docker compose down -d
logs:
	docker compose logs -f
migrate-up:
	docker exec -it base-ror-project-web-1 rails db:migrate
run:
	docker compose run web
