#!/bin/bash

set -eo pipefail

function usage() {
  MSG=$1

  echo ""
  echo "$MSG"
  echo ""
  echo "Usage:  build-postgres-multiplatform <version> <platform>";
  echo ""
  echo "  Where platform can be for example:"
  echo "   linux/amd64"
  echo "   linux/amd64,linux/arm64"
  echo "   linux/arm64"
  echo ""
  exit 1;
}

if [[ -z "$1" ]]; then
  usage "A version must be specified."
fi

if [[ -z "$2" ]]; then
  usage "Platform must be specified."
fi
PLATFORM=$2

if [ -z "${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}" ]; then
  DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME=debezium
fi;

if [ -z "${DEBEZIUM_DOCKER_REGISTRY_SECONDARY_NAME}" ]; then
  DEBEZIUM_DOCKER_REGISTRY_SECONDARY_NAME=quay.io/debezium
fi;

echo ""
echo "****************************************************************"
echo "** Building  ${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/postgres:$1 for $PLATFORM"
echo "****************************************************************"
docker buildx build --push --platform "${PLATFORM}" \
      --build-arg DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME="${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}" \
        -t "${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/postgres:$1" \
        -t "${DEBEZIUM_DOCKER_REGISTRY_SECONDARY_NAME}/postgres:$1" \
        "postgres/$1"
