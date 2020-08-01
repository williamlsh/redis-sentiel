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
	@sudo docker-compose exec sentinel-5000 redis-cli -p 5000 SENTINEL replicas mymaster

.PHONY: master-status
master-status:
	@sudo docker-compose exec sentinel-5000 redis-cli -p 5000 SENTINEL master mymaster

.PHONY: sentinels-status
sentinels-status:
	@sudo docker-compose exec sentinel-5000 redis-cli -p 5000 SENTINEL sentinels mymaster

.PHONY: rescue
rescue:
	@sudo docker-compose start redis-master

.PHONY: failover
failover:
	@sudo docker-compose exec redis-master redis-cli -p 6379 DEBUG sleep 30

.PHONY: failover
master-addr:
	@sudo docker-compose exec sentinel-5000 redis-cli -p 5000 SENTINEL get-master-addr-by-name mymaster