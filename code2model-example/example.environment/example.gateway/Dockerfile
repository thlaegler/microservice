FROM gcr.io/example/example.base:0.0.1-SNAPSHOT

LABEL image "gcr.io/example/example.gateway:0.0.1-SNAPSHOT"
LABEL description "example API gateway image"
LABEL maintainer "John Doe <john.doe@example.org>"

ENV SPRING_CLOUD_CONFIG_URI http://example.config:8888
ENV SPRING_CLOUD_CONFIG_LABEL master
ENV SPRING_PROFILES_ACTIVE local
ENV ORG_EXAMPLE_GATEWAY_PORT 8080

ADD target/example.gateway.jar /app.jar

EXPOSE ${ORG_EXAMPLE_GATEWAY_PORT}

ENTRYPOINT ["java", "-jar", "-Djava.security.egd=file:/dev/./urandom", "/app.jar"]