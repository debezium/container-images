#!/bin/bash

set -eo pipefail

if [[ -z "$TAG" ]]; then
    TAG="$1"
fi

DEBEZIUM_TOOLS="tooling website-builder"

if [ -z "${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}" ]; then
  DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME=quay.io/debezium
fi;


for TOOL in $DEBEZIUM_TOOLS; do
  echo ""
  echo "****************************************************************"
  echo "** Building  ${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/$TOOL:$TAG"
  echo "****************************************************************"
  docker build -t "${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/$TOOL:$TAG" "$TOOL"

  if [ "$PUSH_IMAGES" == "true" ]; then
    echo "Pushing the image into the registry"
    docker push "${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/$TOOL:$TAG"
    if [ -n "${DEBEZIUM_DOCKER_REGISTRY_SECONDARY_NAME}" ]; then
      docker tag "${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/$TOOL:$TAG" "${DEBEZIUM_DOCKER_REGISTRY_SECONDARY_NAME}/$TOOL:$TAG"
      docker push "${DEBEZIUM_DOCKER_REGISTRY_SECONDARY_NAME}/$TOOL:$TAG"
    fi;
  fi
done
