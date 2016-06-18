#!/bin/sh

JAVA_VERSION=8u92
DEBEZIUM_VERSION=0.2
MONGO_VERSION=3.2

./build-java.sh $JAVA_VERSION
if [ $? -ne 0 ]; then
    exit $?;
fi

./build-mongo.sh $MONGO_VERSION
if [ $? -ne 0 ]; then
    exit $?;
fi

./build-debezium.sh $DEBEZIUM_VERSION