.PHONY: restore
restore:
	@git restore sentinel-*

.PHONY: up
up:
	@sudo docker-compose up -d

.PHONY: down
down: restore
	@sudo docker-compose down

.PHONY: stop-master
stop-master:
	@sudo docker-compose stop redis-master

.PHONY: logs
logs:
	@sudo docker-compose logs --tail="all" -f
