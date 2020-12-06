.PHONY: up
up:
	@docker-compose up -d --scale slave=3 --scale sentinel=3

.PHONY: down
down:
	@docker-compose down

.PHONY: stop-master
stop-master:
	@docker-compose stop master

.PHONY: logs
logs:
	@docker-compose logs --tail="all" -f

.PHONY: replicas-status
replicas-status:
	@docker-compose exec sentinel redis-cli -p 26379 SENTINEL replicas mymaster

.PHONY: master-status
master-status:
	@docker-compose exec sentinel redis-cli -p 26379 SENTINEL master mymaster

.PHONY: sentinels-status
sentinels-status:
	@docker-compose exec sentinel redis-cli -p 26379 SENTINEL sentinels mymaster

.PHONY: rescue
rescue:
	@docker-compose start master

.PHONY: failover
failover:
	@docker-compose exec master redis-cli -p 6379 DEBUG sleep 30

.PHONY: master-ip
master-ip:
	@docker-compose exec sentinel redis-cli -p 26379 SENTINEL get-master-addr-by-name mymaster
