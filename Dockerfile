FROM redis:alpine

COPY sentinel.conf /usr/local/etc/redis/sentinel.conf

RUN chown -R redis:redis /usr/local/etc/redis

CMD [ "redis-server" ]
