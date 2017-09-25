FROM gcr.io/example/example.base:0.0.1-SNAPSHOT

LABEL image "gcr.io/example/example.oauth2:0.0.1-SNAPSHOT"
LABEL description "example cloud config server image"
LABEL maintainer "John Doe <john.doe@example.org>"

ENV SPRING_CLOUD_CONFIG_SERVER_GIT_URI https://my-account@bitbucket.org/my-account/microservice-config.git
ENV SPRING_CLOUD_CONFIG_SERVER_GIT_USERNAME test
ENV SPRING_CLOUD_CONFIG_SERVER_GIT_PASSWORD test
ENV ORG_EXAMPLE_CONFIG_PORT 8888

ADD target/example.config.jar /app.jar

EXPOSE ${ORG_EXAMPLE_CONFIG_PORT}

ENTRYPOINT ["java", "-jar", "-Djava.security.egd=file:/dev/./urandom", "/app.jar"]
