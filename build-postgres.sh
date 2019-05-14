#!/bin/bash

if [[ -z "$1" ]]; then
    echo ""
    echo "A version must be specified."
    echo ""
    echo "Usage:  build-postgres <version>";
    echo ""
    exit 1;
fi

echo ""
echo "****************************************************************"
echo "** Building  debezium/postgres:$1"
echo "****************************************************************"
docker build -t "debezium/postgres:$1" "postgres/$1"
