#!/bin/bash

set -eo pipefail

function usage() {
  MSG=$1

  echo ""
  echo "$MSG"
  echo ""
  echo "Usage:  build-informix-multiplatform <informix version> <platform>";
  echo ""
  echo "  Where platform can be for example:"
  echo "   linux/amd64"
  echo "   linux/amd64,linux/arm64"
  echo "   linux/arm64"
  echo ""
  exit 1;
}

if [[ -z "$1" ]]; then
  usage "A informix version must be specified."
fi

if [[ -z "$2" ]]; then
  PLATFORM="linux/amd64,linux/arm64"
  echo "****************************************************************"
  echo "** Using default PLATFORM: $PLATFORM"
  echo "****************************************************************"
else
  PLATFORM="$2"
fi

if [ -z "${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}" ]; then
  DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME=quay.io/rh_integration
fi;

if [ -z "${DEBEZIUM_DOCKER_INFORMIX_REPOSITORY_NAME}" ]; then
  DEBEZIUM_DOCKER_INFORMIX_REPOSITORY_NAME=dbz-informix
fi;

echo ""
echo "****************************************************************"
echo "** Building  ${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/${DEBEZIUM_DOCKER_INFORMIX_REPOSITORY_NAME}:$1 for $PLATFORM"
echo "****************************************************************"


TAGS+=("-t ${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/${DEBEZIUM_DOCKER_INFORMIX_REPOSITORY_NAME}:$1")
if [ -n "${DEBEZIUM_DOCKER_REGISTRY_SECONDARY_NAME}" ]; then
  TAGS+=("-t ${DEBEZIUM_DOCKER_REGISTRY_SECONDARY_NAME}/${DEBEZIUM_DOCKER_INFORMIX_REPOSITORY_NAME}:$1")
fi;

PUSH_FLAG="--push"
  if [[ "$DRY_RUN" == "true" ]]; then
    PUSH_FLAG=""
  fi

echo "****************************************************************"
echo "Running docker buildx build $PUSH_FLAG --platform \"${PLATFORM}\" \
                        --progress=plain \
                          ${TAGS[*]} \
                          \"informix/$1\""
echo "****************************************************************"

# shellcheck disable=SC2068
docker buildx build $PUSH_FLAG --platform "${PLATFORM}" \
  --progress=plain \
  ${TAGS[@]} \
  "informix/$1"
