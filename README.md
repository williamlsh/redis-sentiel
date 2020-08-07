# Deploy containerized Redis Sentinel with Docker Compose

This repository exhibits the minimal situation of Redis Sentinel deployed with Docker compose based on [Redis Sentinel Documentation](#https://redis.io/topics/sentinel) within a _bridge_ network.

## Steps to deployment

Rising up 1 master and 1 replica, 3 sentinels.

```bash
sudo make up
```

Testing failover.

```bash
sudo make failover
```

Viewing all logs.

```bash
sudo make logs
```

More commands, please refer to Makefile.

A tutorial blog post associated with this repository is at: [How to Deploy Containerized Redis Sentinel](https://williamlsh.github.io/posts/how-to-deploy-containerized-redis-sentinel/)

## Author

William

## License

MIT License
