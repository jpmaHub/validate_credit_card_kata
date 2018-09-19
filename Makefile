.PHONY: down
build:
	docker-compose down

.PHONY: build
build:
	docker-compose build

.PHONY: start-tests
start-tests: down build
	docker-compose run --rm --service-ports web bundle exec rspec

