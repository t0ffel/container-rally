# container-rally
Containerized rally for Elasticsearch

## Build image

Build container image via [docker/build_image.sh](docker/build_image.sh) script.

## Run benchmark

To run benchmark deploy PVC to hold the checked out metadata,
deploy deploymentconfig for elasticsearch rally.

### Parameters

* `TARGET_HOSTS` - Elasticsearch hosts to run against, in format `elasticsearch_host:9200`
* `RALLY_TRACK` - name of the Rally track to run
* `RALLY_CHALLENGE` - name of the Rally challenge to run

## Results

Results are automatically sent to another Elasticsearch instance.

