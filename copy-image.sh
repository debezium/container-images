#!/bin/bash

set -eo pipefail

# Usage examples:
#   ./copy-image.sh docker.io/library/mongo 8 quay.io/debezium/official-mongo amd64,arm64
#   ./copy-image.sh testcontainers/ryuk 0.14.0 quay.io/debezium/testcontainers-ryuk amd64,arm64

function usage() {
  MSG=$1

  echo ""
  echo "$MSG"
  echo ""
  echo "Usage:  copy-image <src_image> <src_version> <dst_image> <platform>";
  echo ""
  echo "  Where platform can be for example:"
  echo "   amd64"
  echo "   amd64,arm64"
  echo "   arm64"
  echo ""
  echo " Note that you can specify platforms for each image you want to copy"
  echo " individually by setting an env variable <component-in-uppercase>_PLATFORM"
  echo " (for example BASE_CONNECT_PLATFORM=amd/linux64)"
  echo ""
  exit 1;
}

if [[ -z "$1" ]]; then
  usage "A source image should be provided."
else
  SRC_IMAGE="$1"
fi

if [[ -z "$2" ]]; then
  usage "The version for source image should be provided."
else
  SRC_VERSION="$2"
fi

if [[ -z "$3" ]]; then
  usage "A destination image should be provided."
else
  DST_IMAGE="$3"
fi

if [[ -z "$4" ]]; then
  usage "A platform (or list of platforms) should be proviced."
else
  PLATFORMS="$4"
fi

echo "****************************************************************"
echo "** Copying ${SRC_IMAGE}:${SRC_VERSION} **"
echo "**    into ${DST_IMAGE}:${SRC_VERSION} **"
echo "**    for platforms ${PLATFORMS} **"
echo "****************************************************************"

# Using skopeo to copy the images into owned registry
COPIED_IMAGES=()
for ARCH in ${PLATFORMS//,/ }; do
    skopeo copy --override-arch "${ARCH}" \
      "docker://${SRC_IMAGE}:${SRC_VERSION}" \
      "docker://${DST_IMAGE}:temp-${ARCH}"

    COPIED_IMAGES+=("${DST_IMAGE}:temp-${ARCH}")
done

# Building image with multiple architectures and pushing into registry
# User must be already logged in on dest registry
docker buildx imagetools create \
  -t "${DST_IMAGE}:${SRC_VERSION}" \
  "${COPIED_IMAGES[@]}"

# Deleting temporary images (arch ones) from remote reigstry
for IMAGE in "${COPIED_IMAGES[@]}"; do
    skopeo delete "docker://${IMAGE}"
done
