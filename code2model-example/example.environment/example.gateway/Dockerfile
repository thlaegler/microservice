FROM gcr.io/example/example.base:0.0.1-SNAPSHOT

LABEL image "gcr.io/example/example.gateway:0.0.1-SNAPSHOT"
LABEL description "example API gateway image"
LABEL maintainer "John Doe <john.doe@example.org>"

ENV ORG_EXAMPLE_CONFIG_ENDPOINT http://example.config:8888
ENV ORG_EXAMPLE_CONFIG_GIT_BRANCH master
ENV ORG_EXAMPLE_USERS_HTTP_PORT 8080

ADD target/example.gateway.jar /app.jar

EXPOSE ${ORG_EXAMPLE_USERS_HTTP_PORT}

ENTRYPOINT ["java", "-jar", "/app.jar"]