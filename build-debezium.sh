#!/bin/bash

set -eo pipefail

#
# Parameter 1: image name
# Parameter 2: path to component (if different)
#
build_docker_image () {
    IMAGE_NAME=$1;
    IMAGE_PATH=$2;
    
    if [ -z "$IMAGE_PATH" ]; then
        IMAGE_PATH=${IMAGE_NAME};
    fi
    
    IMAGE_PATH="${IMAGE_PATH}/${DEBEZIUM_VERSION}"

    echo ""
    echo "****************************************************************"
    echo "** Validating  debezium/${IMAGE_NAME}"
    echo "****************************************************************"
    echo ""
    docker run --rm -i hadolint/hadolint:latest < "${IMAGE_PATH}"

    echo "****************************************************************"
    echo "** Building    debezium/${IMAGE_NAME}:${DEBEZIUM_VERSION}"
    echo "****************************************************************"
    docker build -t "debezium/${IMAGE_NAME}" "${IMAGE_PATH}"
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

build_docker_image zookeeper
build_docker_image kafka
build_docker_image connect-base
build_docker_image connect
build_docker_image example-mysql examples/mysql
build_docker_image example-mysql-gtids examples/mysql-gtids
build_docker_image example-postgres examples/postgres
build_docker_image example-mongodb examples/mongodb

echo ""
echo "**********************************"
echo "Successfully created Docker images"
echo "**********************************"
echo ""
