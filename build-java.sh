#!/bin/sh

if [[ -z "$1" ]]; then
    echo ""
    echo "A version must be specified."
    echo ""
    echo "Usage:  build-debezium <version>";
    echo ""
    exit 1;
fi

echo ""
echo "****************************************************************"
echo "** Building  debezium/jdk8:$1"
echo "****************************************************************"
docker build -t debezium/jdk8:$1 jdk8/$1
