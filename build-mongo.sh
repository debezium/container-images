#!/bin/bash

set -eo pipefail

if [[ -z "$1" ]]; then
    echo ""
    echo "A version must be specified."
    echo ""
    echo "Usage:  build-mongo <version>";
    echo ""
    exit 1;
fi

if [ -z "${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}" ]; then
  DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME=debezium
fi;

if [ -z "${DEBEZIUM_DOCKER_REGISTRY_SECONDARY_NAME}" ]; then
  DEBEZIUM_DOCKER_REGISTRY_SECONDARY_NAME=quay.io
fi;

echo ""
echo "****************************************************************"
echo "** Building  ${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/mongo-initiator:$1"
echo "****************************************************************"
docker build -t "${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/mongo-initiator:$1" "mongo-initiator/$1"

if [ "$PUSH_IMAGES" == "true" ]; then
    echo "Pushing the image into the registry"
    docker push "${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/mongo-initiator:$1"
    docker tag "${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/mongo-initiator:$1" "${DEBEZIUM_DOCKER_REGISTRY_SECONDARY_NAME}/${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/mongo-initiator:$1"
    docker push "${DEBEZIUM_DOCKER_REGISTRY_SECONDARY_NAME}/${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/mongo-initiator:$1"
fi
