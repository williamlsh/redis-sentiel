.PHONY: restore
restore:
	@git restore conf

.PHONY: up
up:
	@docker-compose up -d

.PHONY: down
down: restore
	@docker-compose down

.PHONY: stop-master
stop-master:
	@docker-compose stop redis-master

.PHONY: logs
logs:
	@docker-compose logs --tail="all" -f

.PHONY: replicas-status
replicas-status:
	@docker-compose exec sentinel-5000 redis-cli -p 5000 SENTINEL replicas mymaster

.PHONY: master-status
master-status:
	@docker-compose exec sentinel-5000 redis-cli -p 5000 SENTINEL master mymaster

.PHONY: sentinels-status
sentinels-status:
	@docker-compose exec sentinel-5000 redis-cli -p 5000 SENTINEL sentinels mymaster

.PHONY: rescue
rescue:
	@docker-compose start redis-master

.PHONY: failover
failover:
	@docker-compose exec redis-master redis-cli -p 6379 DEBUG sleep 30

.PHONY: master-addr
master-addr:
	@docker-compose exec sentinel-5000 redis-cli -p 5000 SENTINEL get-master-addr-by-name mymaster