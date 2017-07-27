FROM mysql:5.7

LABEL app "mysql"
LABEL maintainer "john.doe"
LABEL package "com.laegler.microservice.example.code2model"
LABEL namespace "code2model-001"
LABEL version "0.0.1-SNAPSHOT"

ENV MYSQL_ROOT_PASSWORD=root
#ENV MYSQL_DATABASE=controlpanel
ENV MYSQL_USER=readonly
ENV MYSQL_PASSWORD=everythingisawesome

ADD init.sql /docker-entrypoint-initdb.d/init.sql

EXPOSE 3306