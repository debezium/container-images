#!/bin/bash

JAVA_VERSION=8u121
DEBEZIUM_VERSION=0.7
MONGO_VERSION=3.2
POSTGRES_VERSIONS="9.6 10.0"

./build-java.sh $JAVA_VERSION
if [ $? -ne 0 ]; then
    exit $?;
fi

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
