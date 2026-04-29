#!/bin/bash

set -eo pipefail

COMPONENTS=$*
if [ -z "$COMPONENTS" ]; then
  COMPONENTS="informix ryuk mongodb mariadb"
fi;

echo "****************************************************************"
echo "** Copying images ${COMPONENTS} **"
echo "****************************************************************"

function shouldBuild() {
  [[ "$COMPONENTS" =~ (" "|^)$1(" "|$) ]]
}

# IMAGE VERSIONS TO BE BUILD/COPY
INFORMIX_VERSIONS="12 14 15"
RYUK_VERSIONS="0.12.0 0.13.0 0.14.0"
MONGO_VERSIONS="7 7.0 7.0.31 8 8.0 8.2"
MARIA_VERSIONS="11.4.3 11.7"

docker buildx prune -f || true

if shouldBuild "informix"; then
  for INFORMIX_VERSION in $INFORMIX_VERSIONS; do
    ./build-informix-multiplatform.sh "$INFORMIX_VERSION"
  done
fi;

if shouldBuild "ryuk"; then

  RYUK_SRC_IMAGE="testcontainers/ryuk"
  RYUK_DST_IMAGE="quay.io/debezium/testcontainers-ryuk"

  for RYUK_VERSION in $RYUK_VERSIONS; do
    ./copy-image.sh "$RYUK_SRC_IMAGE" "$RYUK_VERSION" "$RYUK_DST_IMAGE" amd64,arm64
  done
fi;

if shouldBuild "mongodb"; then

  MONGO_SRC_IMAGE="docker.io/library/mongo"
  MONGO_DST_IMAGE="quay.io/debezium/official-mongo"

  for MONGO_VERSION in $MONGO_VERSIONS; do
    ./copy-image.sh "$MONGO_SRC_IMAGE" "$MONGO_VERSION" "$MONGO_DST_IMAGE" amd64,arm64
  done
fi;

if shouldBuild "mariadb"; then

  MARIA_SRC_IMAGE="docker.io/library/mariadb"
  MARIA_DST_IMAGE="quay.io/debezium/official-mariadb"

  for MARIA_VERSION in $MARIA_VERSIONS; do
    ./copy-image.sh "$MARIA_SRC_IMAGE" "$MARIA_VERSION" "$MARIA_DST_IMAGE" amd64,arm64
  done
fi;
