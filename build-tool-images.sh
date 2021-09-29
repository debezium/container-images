#!/bin/bash

set -eo pipefail

if [[ -z "$TAG" ]]; then
    TAG="$1"
fi

DEBEZIUM_TOOLS="tooling website-builder"

for TOOL in $DEBEZIUM_TOOLS; do
  echo ""
  echo "****************************************************************"
  echo "** Building  debezium/$TOOL:$TAG"
  echo "****************************************************************"
  docker build -t "debezium/$TOOL:$TAG" "$TOOL"

  if [ "$PUSH_IMAGES" == "true" ]; then
    echo "Pushing the image into the registry"
    docker push "debezium/$TOOL:$TAG"
  fi
done
