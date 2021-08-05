#!/bin/bash

if [[ -z "$1" ]]; then
    echo ""
    echo "A version must be specified."
    echo ""
    echo "Usage:  build-mongo <version>";
    echo ""
    exit 1;
fi

echo ""
echo "****************************************************************"
echo "** Building  debezium/mongo-initiator:$1"
echo "****************************************************************"
docker build -t "debezium/mongo-initiator:$1" "mongo-initiator/$1"

if [ "$PUSH_IMAGES" == "true" ]; then
    echo "Pushing the image into the registry"
    docker push "debezium/mongo-initiator:$1"
fi
