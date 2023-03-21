#!/bin/bash

set -eo pipefail

if [ -z "${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}" ]; then
  DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME=quay.io/debezium
fi;

#
# Parameter 1: image name
# Parameter 2: path to component (if different)
# Parameter 3: image tag if different from versioned
#
build_docker_image () {
    IMAGE_NAME=$1;
    IMAGE_PATH=$2;
    IMAGE_TAG=$3;
    
    if [ -z "$IMAGE_PATH" ]; then
        IMAGE_PATH=${IMAGE_NAME};
    fi

    if [ -z "$IMAGE_TAG" ]; then
        IMAGE_TAG=${DEBEZIUM_VERSION};
    fi

    IMAGE_PATH="${IMAGE_PATH}/${IMAGE_TAG}"

    PLATFORM_VAR=$(echo "$IMAGE_NAME" | tr '[:lower:]' '[:upper:]' | tr - _)_PLATFORM
    PLATFORM=${!PLATFORM_VAR}
    if [ -z "${PLATFORM}" ]; then
      PLATFORM=${DEFAULT_PLATFORM};
    fi;

    echo ""
    echo "****************************************************************"
    echo "** Validating  ${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/${IMAGE_NAME}"
    echo "****************************************************************"
    echo ""
    docker run --rm -i hadolint/hadolint:latest < "${IMAGE_PATH}"

    echo "****************************************************************"
    echo "** Building    ${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/${IMAGE_NAME}:${IMAGE_TAG}"
    echo "****************************************************************"

    TAGS=("-t ${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/${IMAGE_NAME}:latest")

    if [ -z "$RELEASE_TAG" ]; then
        echo "****************************************************************"
        echo "** Stream Tag  ${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/${IMAGE_NAME}:${IMAGE_TAG}       "
        echo "****************************************************************"
        TAGS+=("-t ${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/${IMAGE_NAME}:${IMAGE_TAG}")
	if [ -n "${DEBEZIUM_DOCKER_REGISTRY_SECONDARY_NAME}" ]; then
          TAGS+=("-t ${DEBEZIUM_DOCKER_REGISTRY_SECONDARY_NAME}/${IMAGE_NAME}:${IMAGE_TAG}")
	fi;
    fi;

    if [ -n "$RELEASE_TAG" ]; then
        echo "****************************************************************"
        echo "** Release Tag ${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/${IMAGE_NAME}:${RELEASE_TAG}       "
        echo "****************************************************************"

        TAGS+=("-t ${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/${IMAGE_NAME}:${RELEASE_TAG}")
	if [ -n "${DEBEZIUM_DOCKER_REGISTRY_SECONDARY_NAME}" ]; then
            TAGS+=("-t ${DEBEZIUM_DOCKER_REGISTRY_SECONDARY_NAME}/${IMAGE_NAME}:${RELEASE_TAG}")
	fi;
    fi

    echo "Build Image with Tags " "${TAGS[@]}" " and platform ${PLATFORM}"

    # shellcheck disable=SC2068
    docker buildx build --push --platform "${PLATFORM}" \
      --build-arg DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME="$DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME" \
      --label "build-at=$(date +%s)" \
        ${TAGS[@]} \
        "${IMAGE_PATH}"
}

function usage() {
  MSG=$1

  echo ""
  echo "$MSG"
  echo ""
  echo "Usage:  build-debezium <version> <platform>";
  echo ""
  echo "  Where platform can be for example:"
  echo "   linux/amd64"
  echo "   linux/amd64,linux/arm64"
  echo "   linux/arm64"
  echo ""
  echo " Note that you can specify platforms for each component"
  echo " individually by setting an env variable <component-in-uppercase>_PLATFORM"
  echo " (for example BASE_CONNECT_PLATFORM=amd/linux64)"
  echo ""
  exit 1;
}


if [[ -z "$1" ]]; then
  usage "A version must be specified."
fi

if [[ -z "$2" ]]; then
  usage "Platform must be specified."
fi
DEFAULT_PLATFORM=$2

DEBEZIUM_VERSION="$1"

build_docker_image base base latest
build_docker_image zookeeper
build_docker_image kafka
build_docker_image connect-base
build_docker_image connect
build_docker_image server
if [[ "$SKIP_UI" != "true" ]]; then
    build_docker_image debezium-ui ui
fi
build_docker_image example-mysql examples/mysql
build_docker_image example-mysql-gtids examples/mysql-gtids
build_docker_image example-postgres examples/postgres
build_docker_image example-mongodb examples/mongodb

echo ""
echo "**********************************"
echo "Successfully created Docker images"
echo "**********************************"
echo ""
