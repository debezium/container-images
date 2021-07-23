#!/bin/bash

set -eo pipefail

DEBEZIUM_VERSION="1.6"
MONGO_VERSIONS="3.2 3.4 3.6 4.0 4.2"
POSTGRES_VERSIONS="9.6 10 11 12"

for MONGO_VERSION in $MONGO_VERSIONS; do
  ./build-mongo.sh "$MONGO_VERSION"
done

for POSTGRES_VERSION in $POSTGRES_VERSIONS; do
  ./build-postgres.sh "$POSTGRES_VERSION"
done

./build-debezium.sh "$DEBEZIUM_VERSION"
