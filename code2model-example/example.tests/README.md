# Microservice Example project tests

This repository contains tests for all features of project *Example*.


## Remote Tests

### Against localhost

`mvn verify -Pitest-local`

### Against Docker Compose

`mvn verify -Pitest-docker`

### Against Cloud

`mvn verify -Pitest-remote`


## Performance Tests (JMeter)

### Against localhost

`mvn verify -Pptest-local`

### Against Docker Compose

`mvn verify -Pptest-docker` (TODO)

### Against Cloud

`mvn verify -Pptest-remote` (TODO)
