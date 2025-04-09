#!/bin/bash

set -eo pipefail

if [ -z "${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}" ]; then
  DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME=quay.io/rh_integration
fi;

# Parameter 1: Oracle version path
# Parameter 2: Oracle edition
# Parameter 3: Base image name, that the installation is based upon
# Parameter 4: Debezium adapter to configuration [logminer, xstream]
# Parameter 5: Build containerized (CDB) [true, false]
build_oracle_image() {
  IMAGE_VERSION=$1;
  IMAGE_EDITION=$2;
  BASE_IMAGE_NAME=$3
  ADAPTER_NAME=$4;
  CONTAINERIZED=$5;

  TARGET_IMAGE_NAME=dbz-oracle:${IMAGE_VERSION}

  if [[ "$ADAPTER_NAME" == "xstream" ]]; then
    TARGET_IMAGE_NAME=${TARGET_IMAGE_NAME}-xs
  fi

  if [[ "$IMAGE_EDITION" == "se" ]]; then
    TARGET_IMAGE_NAME=${TARGET_IMAGE_NAME}-se
  fi

  if [[ "$CONTAINERIZED" != "true" ]]; then
    TARGET_IMAGE_NAME=${TARGET_IMAGE_NAME}-noncdb
  fi

  # Oracle's container registry images do not have Oracle installed, so this process
  # needs to bake the Oracle installation into a final image. This is done by the
  # container at runtime.
  echo "****************************************************************************************************************"
  echo "** Running ${BASE_IMAGE_NAME} Oracle installation (Containerized ${CONTAINERIZED} Adapter ${ADAPTER_NAME})"
  echo "****************************************************************************************************************"
  echo ""
  docker run -d --name oracle -p 1521:1521 --memory=4g -e DEBEZIUM_ADAPTER="${ADAPTER_NAME}" "${BASE_IMAGE_NAME}"

  # Cleanup pipe if it still exists
  rm -f .logpipe

  # Waits until the installation has completed within the container
  mkfifo .logpipe && (docker logs -f oracle | tee .logpipe & awk '/DATABASE SETUP WAS NOT SUCCESSFUL/ { exit 1 } /DATABASE IS READY TO USE/ { exit 0 }' < .logpipe; kill $!; rm .logpipe)

  echo ""
  echo "****************************************************************************************************************"
  echo "** Creating ${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/${TARGET_IMAGE_NAME}"
  echo "****************************************************************************************************************"
  echo ""
  docker stop oracle
  docker commit oracle "${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}"/"${TARGET_IMAGE_NAME}"
  docker container rm oracle

  if [[ "$PUSH_IAMGES" == "true" || "$DRY_RUN" == "false" ]]; then
    echo "****************************************************************************************************************"
    echo "** Pushing Image ${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/${TARGET_IMAGE_NAME}"
    echo "****************************************************************************************************************"
    echo ""
    docker push "${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/${TARGET_IMAGE_NAME}"
  fi

}

# Parameter 1: Oracle version path
# Parameter 2: Oracle edition
# Parameter 3: Containerized (true/false)
build_oracle_edition() {
  IMAGE_VERSION=$1;
  IMAGE_EDITION=$2;
  CONTAINERIZED=$3;

  if [[ "$CONTAINERIZED" == "false" ]]; then
    if [[ "$IMAGE_VERSION" != "19.3.0" ]]; then
      echo "** ${IMAGE_VERSION} does not support non-CDB installation, skipped."
      return;
    fi
  fi

  IMAGE_PATH="${IMAGE_VERSION}/cdb"
  if [[ "$CONTAINERIZED" != "true" ]]; then
    IMAGE_PATH="${IMAGE_VERSION}/noncdb"
  fi

  if [[ "$CONTAINERIZED" == "true" ]]; then
    IMAGE_NAME=dbz-oracle-base:${IMAGE_VERSION}-${IMAGE_EDITION}
  else
    IMAGE_NAME=dbz-oracle-base:${IMAGE_VERSION}-${IMAGE_EDITION}-noncdb
  fi

  DOCKERFILE_SOURCE="oracle/${IMAGE_PATH}/Dockerfile.${IMAGE_EDITION}"

  # The dbz-oracle-base image is one that is based on Oracle's container registry image
  # with our installation and setup scripts baked into the image.
  echo "****************************************************************************************************************"
  echo "** Building ${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/${IMAGE_NAME} from ${DOCKERFILE_SOURCE}"
  echo "****************************************************************************************************************"
  echo ""
  DOCKER_BUILDKIT=0 docker build -f "${DOCKERFILE_SOURCE}" \
    -t "${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/${IMAGE_NAME}" oracle/

  build_oracle_image "${IMAGE_VERSION}" "${IMAGE_EDITION}" "${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/${IMAGE_NAME}" logminer "${CONTAINERIZED}"
  build_oracle_image "${IMAGE_VERSION}" "${IMAGE_EDITION}" "${DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME}/${IMAGE_NAME}" xstream "${CONTAINERIZED}"
}

# Parameter 1: Oracle version path
build_oracle() {
  # Builds Oracle Standard Editions
  build_oracle_edition "$1" se true
  build_oracle_edition "$1" se false
  # Builds Oracle Enterprise Editions
  build_oracle_edition "$1" ee true
  build_oracle_edition "$1" ee false
}

if [[ -z "$1" ]]; then
  echo ""
  echo "An Oracle version must be specified, i.e. \"19.3.0\""
  echo ""
  echo "Usage:  build-oracle <oracle-version>";
  echo ""
  exit 1;
fi

ORACLE_VERSION="$1"

build_oracle "${ORACLE_VERSION}"