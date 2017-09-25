FROM gcr.io/example/example.base:0.0.1-SNAPSHOT

LABEL image "gcr.io/example/example.oauth2:0.0.1-SNAPSHOT"
LABEL description "example oauth2 server image"
LABEL maintainer "John Doe <john.doe@example.org>"

ENV SPRING_CLOUD_CONFIG_URI http://example.config:8888
ENV SPRING_CLOUD_CONFIG_LABEL master
ENV SPRING_PROFILES_ACTIVE local
ENV ORG_EXAMPLE_OAUTH2_PORT 8081

ADD target/example.oauth2.jar /app.jar

EXPOSE ${ORG_EXAMPLE_OAUTH2_PORT}

ENTRYPOINT ["java", "-jar", "-Djava.security.egd=file:/dev/./urandom", "/app.jar"]