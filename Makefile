.PHONY: setup
setup: 
	docker-compose build
	
.PHONY: start
start: 
	docker-compose up

.PHONY: stop
stop: 
	docker-compose down

.PHONY: rails.command
rails.command:
	docker-compose run --rm sample_graphql_api bundle exec rails ${arg}

.PHONY: rspec
rspec:
	docker-compose run --rm sample_graphql_api bundle exec rspec ${arg}

.PHONY: ci.rspec
ci.rspec:	
	docker-compose run --rm sample_graphql_api bundle exec rails db:migrate:reset
	docker-compose run --rm sample_graphql_api bundle exec rspec
