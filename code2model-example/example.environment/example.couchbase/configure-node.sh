set -m

/entrypoint.sh couchbase-server &

sleep 15

# Setup index and memory quota
curl -v -X POST http://$ORG_EXAMPLE_COUCHBASE_HOST:$ORG_EXAMPLE_COUCHBASE_PORT_CLIENT/pools/default -d memoryQuota=300 -d indexMemoryQuota=300

# Setup services
curl -v http://$ORG_EXAMPLE_COUCHBASE_HOST:$ORG_EXAMPLE_COUCHBASE_PORT_CLIENT/node/controller/setupServices -d services=kv%2Cn1ql%2Cindex

# Setup credentials
curl -v http://$ORG_EXAMPLE_COUCHBASE_HOST:$ORG_EXAMPLE_COUCHBASE_PORT_CLIENT/settings/web -d port=8091 -d username=Administrator -d password=password

# Setup Memory Optimized Indexes
curl -i -u Administrator:password -X POST http://$ORG_EXAMPLE_COUCHBASE_HOST:$ORG_EXAMPLE_COUCHBASE_PORT_CLIENT/settings/indexes -d 'storageMode=memory_optimized'

# Load travel-sample bucket
curl -v -u Administrator:password -X POST http://$ORG_EXAMPLE_COUCHBASE_HOST:$ORG_EXAMPLE_COUCHBASE_PORT_CLIENT/sampleBuckets/install -d '["travel-sample"]'

if [[ "$HOSTNAME" == *-0 ]]; then
  TYPE="MASTER"
else
  TYPE="WORKER"
fi

echo "Type: $TYPE"

if [ "$TYPE" = "WORKER" ]; then
  sleep 15

  IP=`hostname -I`

  echo "Auto Rebalance: $AUTO_REBALANCE"
  if [ "$AUTO_REBALANCE" = "true" ]; then
    couchbase-cli rebalance --cluster=$ORG_EXAMPLE_COUCHBASE_MASTER:8091 --user=Administrator --password=password --server-add=$IP --server-add-username=Administrator --server-add-password=password
  else
    couchbase-cli server-add --cluster=$ORG_EXAMPLE_COUCHBASE_MASTER:8091 --user=Administrator --password=password --server-add=$IP --server-add-username=Administrator --server-add-password=password
  fi;
fi;

fg 1