#!/bin/bash

set -eo pipefail

function usage() {
  MSG=$1

  echo ""
  echo "$MSG"
  echo ""
  echo "Usage:  build-mongodb-multiplatform <version> <platform>";
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
  DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME=quay.io/debezium
fi;

echo ""
echo "****************************************************************"
echo "** Building  ${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/mongodb:$1 for $PLATFORM"
echo "****************************************************************"
TAGS+=("-t ${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/mongodb:$1")
if [ -n "${DEBEZIUM_DOCKER_REGISTRY_SECONDARY_NAME}" ]; then
  TAGS+=("-t ${DEBEZIUM_DOCKER_REGISTRY_SECONDARY_NAME}/mongodb:$1")
fi;

PUSH_FLAG="--push"
    if [[ "$DRY_RUN" == "true" ]]; then
      PUSH_FLAG=""
    fi

echo "****************************************************************"
echo "Running docker buildx build $PUSH_FLAG --platform \"${PLATFORM}\" \
                        --progress=plain \
                        --build-arg DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME=\"$DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME\" \
                          ${TAGS[*]} \
                          \"mongodb/$1\""
echo "****************************************************************"

# shellcheck disable=SC2068
docker buildx build $PUSH_FLAG --platform "${PLATFORM}" \
      --build-arg DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME="${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}" \
      ${TAGS[@]} \
      "mongodb/$1"