#!/bin/bash

set -eo pipefail

if [[ -z "$TAG" ]]; then
    TAG="$1"
fi

if [ -z "${DEBEZIUM_TOOLS_PLATFORM}" ]; then
  DEBEZIUM_TOOLS_PLATFORM=linux/amd64
fi;

if [ -z "${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}" ]; then
  DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME=quay.io/debezium
fi;

DEBEZIUM_TOOLS="tooling website-builder"

for TOOL in $DEBEZIUM_TOOLS; do
  echo ""
  echo "****************************************************************"
  echo "** Building  ${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/$TOOL:$TAG for ${DEBEZIUM_TOOLS_PLATFORM}"
  echo "****************************************************************"
  unset TAGS
  TAGS+=("-t ${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/${TOOL}:$TAG")
  if [ -n "${DEBEZIUM_DOCKER_REGISTRY_SECONDARY_NAME}" ]; then
    TAGS+=("-t ${DEBEZIUM_DOCKER_REGISTRY_SECONDARY_NAME}/${TOOL}:$TAG")
  fi;

  # shellcheck disable=SC2068
  docker buildx build --push --platform "${DEBEZIUM_TOOLS_PLATFORM}" \
        --build-arg DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME="${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}" \
        ${TAGS[@]} \
	"$TOOL"
done
