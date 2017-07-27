FROM redis:4.0

LABEL app "redis"
LABEL maintainer "john.doe"
LABEL package "com.laegler.microservice.example.code2model"
LABEL namespace "code2model-001"
LABEL version "0.0.1-SNAPSHOT"

COPY redis.conf /etc/redis/redis.conf

ENTRYPOINT ["/usr/bin/redis-server"]

VOLUME ["/data"]

WORKDIR /data

CMD ["/usr/bin/redis-server", "/etc/redis/redis.conf"]

EXPOSE 6379
