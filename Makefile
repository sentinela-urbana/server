make-build:
	docker compose up build
make-up:
	docker compose up -d
make-migrate-up:
	docker exec -it base-ror-project-web-1 rails db:migrate 
make-run:
	docker compose run web