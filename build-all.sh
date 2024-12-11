#!/bin/bash

set -eo pipefail

DEBEZIUM_VERSION="2.7"
if [ -z "$DEBEZIUM_VERSIONS" ]; then
  DEBEZIUM_VERSIONS="$DEBEZIUM_VERSION"
fi
MONGO_VERSIONS="5.0 6.0 7.0"
POSTGRES_VERSIONS="12 12-alpine 13 13-alpine 14 14-alpine 15 15-alpine 16 16-alpine 17 17-alpine"

for MONGO_VERSION in $MONGO_VERSIONS; do
  ./build-mongo.sh "$MONGO_VERSION"
done

for POSTGRES_VERSION in $POSTGRES_VERSIONS; do
  ./build-postgres.sh "$POSTGRES_VERSION"
done

for DBZ in $DEBEZIUM_VERSIONS; do
  ./build-debezium.sh "$DBZ"
done
