#!/bin/sh

set -ex
prefix=${PREFIX:-${1:-viaq/}}
version=${VERSION:-${2:-latest}}
docker build -t "${prefix}elasticsearch-rally:${version}" .

if [ -n "${PUSH:-$3}" ]; then
	docker push "${prefix}elasticsearch-rally:${version}"
fi
