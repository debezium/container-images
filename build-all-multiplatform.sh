#!/bin/bash

set -eo pipefail

DEBEZIUM_VERSION="1.9"
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

# A list of Debezium versions that should be built
# with multi platform build
DEBEZIUM_MULTIPLATFORM_VERSIONS="1.9 2.0 latest"

MONGO_VERSIONS="3.2"
MONGO_MULTIPLATFORM_VERSIONS="3.4 3.6 4.0 4.2 4.4 5.0 6.0"

POSTGRES_VERSIONS="9.6 10 11 12 13 14 15"
POSTGRES_MULTIPLATFORM_VERSIONS="9.6-alpine 10-alpine 11-alpine 12-alpine 13-alpine 14-alpine 15-alpine"

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
    if [[ "${DEBEZIUM_MULTIPLATFORM_VERSIONS}" =~ (" "|^)${DBZ}(" "|$) ]]; then
      ./build-debezium-multiplatform.sh "${DBZ}" "${MULTIPLATFORM_PLATFORMS}"
    else
      ./build-debezium.sh "${DBZ}"
    fi;
  done
fi;
