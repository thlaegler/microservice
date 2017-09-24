# example architecture

a simple example showcase.

More about it: https://thlaegler.github.io/microservice


## prepare

Append /etc/hosts file with these lines:

```
127.0.0.1	example.mysql
127.0.0.1	example.redis
127.0.0.1	example.elasticsearch
127.0.0.1	example.config
127.0.0.1	example.gateway
127.0.0.1	example.oauth2
127.0.0.1	example.users
127.0.0.1	example. .....
```

Append environment variables (e.g. in file /etc/environment) with following lines:

```
SPRING_CLOUD_CONFIG_URI="http://example.config:8888"
SPRING_CLOUD_CONFIG_LABEL="master"
SPRING_CLOUD_CONFIG_SERVER_GIT_URI="https://my-account@bitbucket.org/my-account/microservice-config.git"
SPRING_CLOUD_CONFIG_SERVER_GIT_USERNAME="test"
SPRING_CLOUD_CONFIG_SERVER_GIT_PASSWORD="test"
```

## run

- maven and docker build: `mvn clean install`
- docker compose: `docker-compose up`
- ...
- `docker-compose down --rmi all --volumes  --remove-orphans`