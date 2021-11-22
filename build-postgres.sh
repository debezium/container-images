#!/bin/bash

set -eo pipefail

if [[ -z "$1" ]]; then
    echo ""
    echo "A version must be specified."
    echo ""
    echo "Usage:  build-postgres <version>";
    echo ""
    exit 1;
fi

echo ""
echo "****************************************************************"
echo "** Building  debezium/postgres:$1"
echo "****************************************************************"
docker build -t "debezium/postgres:$1" "postgres/$1"

if [ "$PUSH_IMAGES" == "true" ]; then
    echo "Pushing the image into the registry"
    docker push "debezium/postgres:$1"
    docker tag "debezium/postgres:$1" "quay.io/debezium/postgres:$1"
    docker push "quay.io/debezium/postgres:$1"
fi
