#!/bin/bash

set -eo pipefail

DEBEZIUM_VERSION="1.6"
if [ -z "$DEBEZIUM_VERSIONS" ]; then
  DEBEZIUM_VERSIONS="$DEBEZIUM_VERSION"
fi
MONGO_VERSIONS="3.2 3.4 3.6 4.0 4.2 5.0"
POSTGRES_VERSIONS="9.6 10 11 12"

for MONGO_VERSION in $MONGO_VERSIONS; do
  ./build-mongo.sh "$MONGO_VERSION"
done

for POSTGRES_VERSION in $POSTGRES_VERSIONS; do
  ./build-postgres.sh "$POSTGRES_VERSION"
done

for DBZ in $DEBEZIUM_VERSIONS; do
  ./build-debezium.sh "$DBZ"
done
