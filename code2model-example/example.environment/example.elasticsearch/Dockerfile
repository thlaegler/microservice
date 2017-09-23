FROM elasticsearch:2.4.5

LABEL image "gcr.io/example/example.elasticsearch:0.0.1-SNAPSHOT"
LABEL description "example elasticsearch image"
LABEL maintainer "John Doe <john.doe@example.org>"

COPY logging.yaml /usr/share/elasticsearch/config/
COPY elasticsearch.yaml /usr/share/elasticsearch/config/

USER root
RUN chown elasticsearch:elasticsearch config/elasticsearch.yaml

USER elasticsearch
ENV PATH=$PATH:/usr/share/elasticsearch/bin
CMD ["elasticsearch"]

EXPOSE 9200
EXPOSE 9300