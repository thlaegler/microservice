FROM gcr.io/example/example.base:0.0.1-SNAPSHOT

LABEL image "gcr.io/example/example.users:0.0.1-SNAPSHOT"
LABEL description "users service image"
LABEL maintainer "John Doe <john.doe@example.org>"

ENV SPRING_CLOUD_CONFIG_URI http://example.config:8888
ENV SPRING_CLOUD_CONFIG_LABEL master
ENV SPRING_PROFILES_ACTIVE local
ENV ORG_EXAMPLE_USERS_PORT_GRPC 7091
ENV ORG_EXAMPLE_USERS_PORT_REST 8091
ENV ORG_EXAMPLE_USERS_PORT_SOAP 9091

ADD target/example.users.app.jar /app.jar

EXPOSE ${ORG_EXAMPLE_USERS_PORT_GRPC}
EXPOSE ${ORG_EXAMPLE_USERS_PORT_REST}
EXPOSE ${ORG_EXAMPLE_USERS_PORT_SOAP}

ENTRYPOINT ["java", "-jar", "-Djava.security.egd=file:/dev/./urandom", "/app.jar"]