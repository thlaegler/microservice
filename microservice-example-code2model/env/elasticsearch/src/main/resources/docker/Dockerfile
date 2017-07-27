FROM elasticsearch:2.4.5

LABEL app "elasticsearch"
LABEL maintainer "john.doe"
LABEL package "com.laegler.microservice.example.code2model"
LABEL namespace "code2model-001"
LABEL version "0.0.1-SNAPSHOT"

COPY logging.yml /usr/share/elasticsearch/config/
COPY elasticsearch.yml /usr/share/elasticsearch/config/

USER root
RUN chown elasticsearch:elasticsearch config/elasticsearch.yml

USER elasticsearch
ENV PATH=$PATH:/usr/share/elasticsearch/bin
CMD ["elasticsearch"]

EXPOSE 9200
EXPOSE 9300