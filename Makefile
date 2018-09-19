.PHONY: down
build:
	docker-compose down

.PHONY: build
build:
	docker-compose build

.PHONY: start-project
start-project: down build
	docker-compose run --rm --service-ports web bundle exec rspec

