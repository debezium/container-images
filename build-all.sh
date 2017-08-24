#!/bin/sh

JAVA_VERSION=8u121
DEBEZIUM_VERSION=0.6
MONGO_VERSION=3.2
POSTGRES_VERSION=9.6

./build-java.sh $JAVA_VERSION
if [ $? -ne 0 ]; then
    exit $?;
fi

./build-mongo.sh $MONGO_VERSION
if [ $? -ne 0 ]; then
    exit $?;
fi

./build-postgres.sh $POSTGRES_VERSION
if [ $? -ne 0 ]; then
    exit $?;
fi

./build-debezium.sh $DEBEZIUM_VERSION
