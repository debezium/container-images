#!/bin/bash

DEBEZIUM_VERSION=0.9
MONGO_VERSION="3.2 3.4 3.6 4.0"
POSTGRES_VERSIONS="9.6 9.6-alpine 10 10-alpine 11 11-alpine"

for i in $MONGO_VERSION; do
  ./build-mongo.sh $i
  if [ $? -ne 0 ]; then
      exit $?;
  fi
done

for i in $POSTGRES_VERSIONS; do
  ./build-postgres.sh $i
  if [ $? -ne 0 ]; then
      exit $?;
  fi
done

./build-debezium.sh $DEBEZIUM_VERSION
