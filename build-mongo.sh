#!/bin/sh

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
echo "** Building  debezium/mongo-replicaset-initiator:$1"
echo "****************************************************************"
docker build -t debezium/mongo-replicaset-initiator:$1 mongo/$1/mongo-replicaset-initiator
