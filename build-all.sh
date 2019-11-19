#!/bin/bash

set -eo pipefail

DEBEZIUM_VERSION="1.0"
MONGO_VERSIONS="3.2 3.4 3.6 4.0 4.2"
POSTGRES_VERSIONS="9.6 9.6-alpine 10 10-alpine 11 11-alpine 12 12-alpine"

for MONGO_VERSION in $MONGO_VERSIONS; do
  ./build-mongo.sh "$MONGO_VERSION"
done

for POSTGRES_VERSION in $POSTGRES_VERSIONS; do
  ./build-postgres.sh "$POSTGRES_VERSION"
done

./build-debezium.sh "$DEBEZIUM_VERSION"
