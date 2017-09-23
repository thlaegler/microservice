FROM gcr.io/example/example.base:0.0.1-SNAPSHOT

LABEL image "gcr.io/example/example.oauth2:0.0.1-SNAPSHOT"
LABEL description "example cloud config server image"
LABEL maintainer "John Doe <john.doe@example.org>"

ENV ORG_EXAMPLE_CONFIG_HTTP_PORT 8888
ENV ORG_EXAMPLE_CONFIG_GIT_URI https://tlaegler@bitbucket.org/tlaegler/microservice-config.git
ENV ORG_EXAMPLE_CONFIG_GIT_USERNAME test
ENV ORG_EXAMPLE_CONFIG_GIT_PASSWORD test

ADD target/example.config.jar /app.jar

EXPOSE ${ORG_EXAMPLE_CONFIG_HTTP_PORT}

ENTRYPOINT ["java", "-jar", "-Djava.security.egd=file:/dev/./urandom", "/app.jar"]
