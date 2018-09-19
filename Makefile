.PHONY: build
build:
	docker-compose build

.PHONY: start-project
start-project: build
	docker-compose run --rm --service-ports web bundle exec rspec
	docker-compose down
