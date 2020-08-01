.PHONY: restore
restore:
	@git restore conf

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

.PHONY: replicas-status
replicas-status:
	@sudo docker-compose exec sentinel-5000 redis-cli -p 5000 sentinel replicas mymaster

.PHONY: master-status
master-status:
	@sudo docker-compose exec sentinel-5000 redis-cli -p 5000 sentinel master mymaster

.PHONY: sentinels-status
sentinels-status:
	@sudo docker-compose exec sentinel-5000 redis-cli -p 5000 sentinel sentinels mymaster

.PHONY: rescue
rescue:
	@sudo docker-compose start redis-master