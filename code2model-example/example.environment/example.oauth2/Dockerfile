FROM gcr.io/example/example.base:0.0.1-SNAPSHOT

LABEL image "gcr.io/example/example.oauth2:0.0.1-SNAPSHOT"
LABEL description "example oauth2 server image"
LABEL maintainer "John Doe <john.doe@example.org>"

ENV ORG_EXAMPLE_CONFIG_ENDPOINT http://example.config:8888
ENV ORG_EXAMPLE_CONFIG_GIT_BRANCH master
ENV ORG_EXAMPLE_USERS_HTTP_PORT 8091

ADD target/example.oauth2.jar /app.jar

EXPOSE ${ORG_EXAMPLE_USERS_HTTP_PORT}

ENTRYPOINT ["java", "-jar", "/app.jar"]