FROM gcr.io/example/example.base:0.0.1-SNAPSHOT

LABEL image "gcr.io/example/example.users:0.0.1-SNAPSHOT"
LABEL description "users service image"
LABEL maintainer "John Doe <john.doe@example.org>"

ENV ORG_EXAMPLE_CONFIG_ENDPOINT http://example.config:8888
ENV ORG_EXAMPLE_CONFIG_GIT_BRANCH master
ENV ORG_EXAMPLE_USERS_HTTP_PORT 8091
ENV ORG_EXAMPLE_USERS_GRPC_PORT 7091

ADD target/example.users.app.jar /app.jar

EXPOSE ${ORG_EXAMPLE_USERS_HTTP_PORT}
EXPOSE ${ORG_EXAMPLE_USERS_GRPC_PORT}

ENTRYPOINT ["java", "-jar", "-Djava.security.egd=file:/dev/./urandom", "/app.jar"]