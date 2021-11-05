#!/bin/bash

set -eo pipefail

DEBEZIUM_VERSION="1.7"
if [ -z "$DEBEZIUM_VERSIONS" ]; then
  DEBEZIUM_VERSIONS="$DEBEZIUM_VERSION"
fi
MONGO_VERSIONS="3.2 3.4 3.6 4.0 4.2 5.0"
POSTGRES_VERSIONS="9.6 9.6-alpine 10 10-alpine 11 11-alpine 12 12-alpine 13 13-alpine 14 14-alpine"

for MONGO_VERSION in $MONGO_VERSIONS; do
  ./build-mongo.sh "$MONGO_VERSION"
done

for POSTGRES_VERSION in $POSTGRES_VERSIONS; do
  ./build-postgres.sh "$POSTGRES_VERSION"
done

for DBZ in $DEBEZIUM_VERSIONS; do
  ./build-debezium.sh "$DBZ"
done
