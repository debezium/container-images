#!/bin/bash

set -eo pipefail

DEBEZIUM_VERSION="3.3"
if [ -z "$DEBEZIUM_VERSIONS" ]; then
  DEBEZIUM_VERSIONS="$DEBEZIUM_VERSION"
fi
POSTGRES_VERSIONS="14 14-alpine 15 15-alpine 16 16-alpine 17 17-alpine 18 18-alpine"

for POSTGRES_VERSION in $POSTGRES_VERSIONS; do
  ./build-postgres.sh "$POSTGRES_VERSION"
done

for DBZ in $DEBEZIUM_VERSIONS; do
  ./build-debezium.sh "$DBZ"
done
