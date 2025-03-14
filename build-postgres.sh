#!/bin/bash

set -eo pipefail

if [[ -z "$1" ]]; then
    echo ""
    echo "A version must be specified."
    echo ""
    echo "Usage:  build-postgres <version>";
    echo ""
    exit 1;
fi

if [ -z "${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}" ]; then
  DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME=quay.io/debezium
fi;

echo ""
echo "****************************************************************"
echo "** Building  ${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/postgres:$1"
echo "****************************************************************"
docker build -t "${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/postgres:$1" "postgres/$1"


if [[ "$PUSH_IMAGES" == "true" || "$DRY_RUN" == "false" ]]; then
    echo "Pushing the image into the registry"
    docker push "${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/postgres:$1"
    if [ -n "${DEBEZIUM_DOCKER_REGISTRY_SECONDARY_NAME}" ]; then
      docker tag "${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/postgres:$1" "${DEBEZIUM_DOCKER_REGISTRY_SECONDARY_NAME}/postgres:$1"
      docker push "${DEBEZIUM_DOCKER_REGISTRY_SECONDARY_NAME}/postgres:$1"
    fi;
fi
