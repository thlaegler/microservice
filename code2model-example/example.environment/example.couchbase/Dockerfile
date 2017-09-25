FROM couchbase

LABEL image "gcr.io/example/example.couchbase:0.0.1-SNAPSHOT"
LABEL description "example couchbase image"
LABEL maintainer "John Doe <john.doe@example.org>"

ENV ORG_EXAMPLE_COUCHBASE_MASTER=root
ENV ORG_EXAMPLE_COUCHBASE_HOST=example.couchbase
ENV ORG_EXAMPLE_COUCHBASE_PORT_CLIENT=2379
ENV ORG_EXAMPLE_COUCHBASE_PORT_PEER=2380

COPY configure-node.sh /opt/couchbase

CMD ["/opt/couchbase/configure-node.sh"]