#!/bin/bash

DEBEZIUM_VERSION=0.9
MONGO_VERSION=3.2
POSTGRES_VERSIONS="9.6 9.6-alpine 10.0 10.0-alpine"

./build-mongo.sh $MONGO_VERSION
if [ $? -ne 0 ]; then
    exit $?;
fi

for i in $POSTGRES_VERSIONS; do
  ./build-postgres.sh $i
  if [ $? -ne 0 ]; then
      exit $?;
  fi
done

./build-debezium.sh $DEBEZIUM_VERSION
