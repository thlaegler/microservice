FROM ubuntu

LABEL maintainer "myCompanyName"
LABEL package "org.example.microservice"
LABEL namespace "model2code-example-oauth2"
LABEL version ""
    
EXPOSE 8080
EXPOSE 7070
EXPOSE 6060

#RUN apt-get update && apt-get install -y curl

ADD oauth2.jar /app.jar
RUN sh -c 'touch /app.jar'

#Could be overridden by kubernetes manifest spec.template.spec.containers[].cmd
ENTRYPOINT ["java","-jar","/app.jar"]

