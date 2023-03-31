#!/bin/bash

set -eo pipefail

DEBEZIUM_VERSION="2.2"
if [ -z "$DEBEZIUM_VERSIONS" ]; then
  DEBEZIUM_VERSIONS="$DEBEZIUM_VERSION"
fi

COMPONENTS=$*
if [ -z "$COMPONENTS" ]; then
  COMPONENTS="mongo postgres debezium"
fi;

if [ -z "$MULTIPLATFORM_PLATFORMS" ]; then
  MULTIPLATFORM_PLATFORMS="linux/amd64,linux/arm64"
fi;

echo ""
echo "****************************************************************"
echo "** Building components ${COMPONENTS} **"
echo "****************************************************************"

function shouldBuild() {
  [[ "$COMPONENTS" =~ (" "|^)$1(" "|$) ]]
}

# A list of Debezium versions that should not be built
# with multi platform build
DEBEZIUM_SINGLEPLATFORM_VERSIONS="1.0 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8"

MONGO_VERSIONS="3.2"
MONGO_MULTIPLATFORM_VERSIONS="3.4 3.6 4.0 4.2 4.4 5.0 6.0"

POSTGRES_VERSIONS="9.6 10 11 12 13 14"
POSTGRES_MULTIPLATFORM_VERSIONS="15 9.6-alpine 10-alpine 11-alpine 12-alpine 13-alpine 14-alpine 15-alpine"

if shouldBuild "mongo"; then
  for MONGO_VERSION in $MONGO_VERSIONS; do
    ./build-mongo-multiplatform.sh "$MONGO_VERSION" "linux/amd64"
  done

  for MONGO_VERSION in $MONGO_MULTIPLATFORM_VERSIONS; do
    ./build-mongo-multiplatform.sh "$MONGO_VERSION" "${MULTIPLATFORM_PLATFORMS}"
  done
fi;

if shouldBuild "postgres"; then
  for POSTGRES_VERSION in $POSTGRES_VERSIONS; do
    ./build-postgres-multiplatform.sh "$POSTGRES_VERSION" "linux/amd64"
  done

  for POSTGRES_VERSION in $POSTGRES_MULTIPLATFORM_VERSIONS; do
    ./build-postgres-multiplatform.sh "$POSTGRES_VERSION" "${MULTIPLATFORM_PLATFORMS}"
  done
fi;

if shouldBuild "debezium"; then
  for DBZ in $DEBEZIUM_VERSIONS; do
    if [[ "${DEBEZIUM_SINGLEPLATFORM_VERSIONS}" =~ (" "|^)${DBZ}(" "|$) ]]; then
      ./build-debezium.sh "${DBZ}"
    else
      ./build-debezium-multiplatform.sh "${DBZ}" "${MULTIPLATFORM_PLATFORMS}"
    fi;
  done
fi;
