#!/bin/bash

set -eo pipefail

DEBEZIUM_VERSION="3.2"
if [ -z "$DEBEZIUM_VERSIONS" ]; then
  DEBEZIUM_VERSIONS="$DEBEZIUM_VERSION"
fi

COMPONENTS=$*
if [ -z "$COMPONENTS" ]; then
  COMPONENTS="postgres debezium"
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

POSTGRES_VERSIONS="12 13 14"
POSTGRES_MULTIPLATFORM_VERSIONS="15 16 17 12-alpine 13-alpine 14-alpine 15-alpine 16-alpine 17-alpine"

docker buildx prune -f || true
if shouldBuild "postgres"; then
  for POSTGRES_VERSION in $POSTGRES_MULTIPLATFORM_VERSIONS; do
    ./build-postgres-multiplatform.sh "$POSTGRES_VERSION" "${MULTIPLATFORM_PLATFORMS}"
  done

  for POSTGRES_VERSION in $POSTGRES_VERSIONS; do
    ./build-postgres-multiplatform.sh "$POSTGRES_VERSION" "linux/amd64"
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
