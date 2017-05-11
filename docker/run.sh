#!/bin/sh

echo "Launching Elasticsearch rally against hosts ${TARGET_HOSTS}, using track ${RALLY_TRACK}, challenge ${RALLY_CHALLENGE}"
scl enable git19 -- esrally --pipeline=benchmark-only --target-hosts=${TARGET_HOSTS} --track=${RALLY_TRACK} --challenge=${RALLY_CHALLENGE}

