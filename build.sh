#!/bin/sh

JAVA_VERSION=8u92
DEBEZIUM_VERSION=0.1

echo ""
echo "****************************************************************"
echo "** Building  debezium/jdk8:$JAVA_VERSION"
echo "****************************************************************"
docker build -t debezium/jdk8:$JAVA_VERSION jdk8/$JAVA_VERSION

echo ""
echo "****************************************************************"
echo "** Building  debezium/zookeeper:$DEBEZIUM_VERSION"
echo "****************************************************************"
docker build -t debezium/zookeeper:$DEBEZIUM_VERSION zookeeper/$DEBEZIUM_VERSION

echo ""
echo "****************************************************************"
echo "** Building  debezium/kafka:$DEBEZIUM_VERSION"
echo "****************************************************************"
docker build -t debezium/kafka:$DEBEZIUM_VERSION kafka/$DEBEZIUM_VERSION

echo ""
echo "****************************************************************"
echo "** Building  debezium/connect:$DEBEZIUM_VERSION"
echo "****************************************************************"
docker build -t debezium/connect:$DEBEZIUM_VERSION connect/$DEBEZIUM_VERSION

echo ""
echo "****************************************************************"
echo "** Building  debezium/example-mysql:$DEBEZIUM_VERSION"
echo "****************************************************************"
docker build -t debezium/example-mysql:$DEBEZIUM_VERSION examples/mysql/$DEBEZIUM_VERSION
