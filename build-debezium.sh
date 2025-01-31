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

    echo ""
    echo "****************************************************************"
    echo "** Validating  ${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/${IMAGE_NAME}"
    echo "****************************************************************"
    echo ""
    docker run --rm -i mirror.gcr.io/hadolint/hadolint:latest < "${IMAGE_PATH}"

    echo "****************************************************************"
    echo "** Building    ${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/${IMAGE_NAME}:${IMAGE_TAG}"
    echo "****************************************************************"
    docker build --build-arg DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME="${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}" \
        -t "${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/${IMAGE_NAME}:latest" "${IMAGE_PATH}"

    if [ -z "$RELEASE_TAG" ]; then
        echo "****************************************************************"
        echo "** Stream Tag  ${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/${IMAGE_NAME}:${IMAGE_TAG}       "
        echo "****************************************************************"
        docker tag "${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/${IMAGE_NAME}:latest" "${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/${IMAGE_NAME}:${IMAGE_TAG}"
        if [ "$PUSH_IMAGES" == "true" ]; then
            echo "Pushing the stream image into the registry"
            docker push "${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/${IMAGE_NAME}:${IMAGE_TAG}"
	    if [ -n "${DEBEZIUM_DOCKER_REGISTRY_SECONDARY_NAME}" ]; then
	      docker tag "${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/${IMAGE_NAME}:${IMAGE_TAG}" "${DEBEZIUM_DOCKER_REGISTRY_SECONDARY_NAME}/${IMAGE_NAME}:${IMAGE_TAG}"
              docker push "${DEBEZIUM_DOCKER_REGISTRY_SECONDARY_NAME}/${IMAGE_NAME}:${IMAGE_TAG}"
	    fi;
            if [ "$DEBEZIUM_VERSION" == "$LATEST_STREAM" ]; then
                echo "Pushing the latest image into the registry"
                docker push "${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/${IMAGE_NAME}:latest"
                if [ -n "${DEBEZIUM_DOCKER_REGISTRY_SECONDARY_NAME}" ]; then
		  docker tag "${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/${IMAGE_NAME}:latest" "${DEBEZIUM_DOCKER_REGISTRY_SECONDARY_NAME}/${IMAGE_NAME}:latest"
                  docker push "${DEBEZIUM_DOCKER_REGISTRY_SECONDARY_NAME}/${IMAGE_NAME}:latest"
		fi;
            fi
        fi
    fi

    if [ -n "$RELEASE_TAG" ]; then
        echo "****************************************************************"
        echo "** Release Tag ${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/${IMAGE_NAME}:${RELEASE_TAG}       "
        echo "****************************************************************"
        docker tag "${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/${IMAGE_NAME}:latest" "${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/${IMAGE_NAME}:${RELEASE_TAG}"
        if [ "$PUSH_IMAGES" == "true" ]; then
            echo "Pushing the stream image into the registry"
            docker push "${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/${IMAGE_NAME}:${RELEASE_TAG}"
	    if [ -n "${DEBEZIUM_DOCKER_REGISTRY_SECONDARY_NAME}" ]; then
              docker tag "${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/${IMAGE_NAME}:${RELEASE_TAG}" "${DEBEZIUM_DOCKER_REGISTRY_SECONDARY_NAME}/${IMAGE_NAME}:${RELEASE_TAG}"
              docker push "${DEBEZIUM_DOCKER_REGISTRY_SECONDARY_NAME}/${IMAGE_NAME}:${RELEASE_TAG}"
	    fi;
        fi
    fi
}


if [[ -z "$1" ]]; then
    echo ""
    echo "A version must be specified."
    echo ""
    echo "Usage:  build-debezium <version>";
    echo ""
    exit 1;
fi

DEBEZIUM_VERSION="$1"

build_docker_image base base latest
build_docker_image zookeeper
build_docker_image kafka
build_docker_image connect-base
build_docker_image connect
build_docker_image server
build_docker_image example-mysql examples/mysql
build_docker_image example-mysql-gtids examples/mysql-gtids
build_docker_image example-mariadb examples/mariadb
build_docker_image example-postgres examples/postgres
build_docker_image example-mongodb examples/mongodb
build_docker_image example-mysql-master examples/mysql-replication/master
build_docker_image example-mysql-replica examples/mysql-replication/replica
build_docker_image platform-conductor
build_docker_image operator
if [[ "$SKIP_UI" != "true" ]]; then
    build_docker_image debezium-ui ui
fi

echo ""
echo "*************************************"
echo "Successfully created container images"
echo "*************************************"
echo ""
