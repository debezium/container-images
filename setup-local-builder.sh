#!/bin/sh

## Create a buildx builder for local tests builds
#
# It requires a local registry running on port 5500
#   Run the registry:
#     docker run -d -p 5500:5000 --restart=always --name registry registry:2
#   Set DEBEZIUM_DOCKER_REGISTRY_SECONDARY_NAME variable:
#     export DEBEZIUM_DOCKER_REGISTRY_SECONDARY_NAME=localhost:5500/debeziumquay
#
#
# Source: https://stackoverflow.com/a/73641001/6134498
name=debezium-container-builder

docker buildx ls | grep -q $name && docker buildx rm $name
docker buildx create --driver-opt network=host --use --name $name
