#!/bin/bash

set -eo pipefail

function usage() {
  MSG=$1

  echo ""
  echo "$MSG"
  echo ""
  echo "Usage:  build-mongodb-multiplatform <release version> <base version> <platform>";
  echo ""
  echo "  Where platform can be for example:"
  echo "   linux/amd64"
  echo "   linux/amd64,linux/arm64"
  echo "   linux/arm64"
  echo ""
  exit 1;
}

if [[ -z "$1" ]]; then
  usage "A release version must be specified."
fi

if [[ -z "$2" ]]; then
  usage "A base version must be specified."
fi

if [[ -z "$3" ]]; then
  usage "Platform must be specified."
fi

PLATFORM=$3

if [ -z "${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}" ]; then
  DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME=quay.io/debezium
fi;

echo ""
echo "****************************************************************"
echo "** Building  ${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/mongo:$1 based on mongo version $2 for $PLATFORM"
echo "****************************************************************"
TAGS+=("-t ${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/mongo:$1")
if [ -n "${DEBEZIUM_DOCKER_REGISTRY_SECONDARY_NAME}" ]; then
  TAGS+=("-t ${DEBEZIUM_DOCKER_REGISTRY_SECONDARY_NAME}/mongo:$1")
fi;

PUSH_FLAG="--push"
    if [[ "$DRY_RUN" == "true" ]]; then
      PUSH_FLAG=""
    fi

echo "****************************************************************"
echo "Running docker buildx build $PUSH_FLAG --platform \"${PLATFORM}\" \
                        --progress=plain \
                        --build-arg IMAGE_TAG=\"$2\" \
                          ${TAGS[*]} \
                          \"mongo/$1\""
echo "****************************************************************"

# shellcheck disable=SC2068
docker buildx build $PUSH_FLAG --platform "${PLATFORM}" \
      --build-arg IMAGE_TAG="$2" \
      ${TAGS[@]} \
      "mongo/$1"