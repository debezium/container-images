#!/bin/sh

JAVA_VERSION=8u92
DEBEZIUM_VERSION=0.2

echo ""
echo "****************************************************************"
echo "** Building  debezium/jdk8:$JAVA_VERSION"
echo "****************************************************************"
docker build -t debezium/jdk8:$JAVA_VERSION jdk8/$JAVA_VERSION
