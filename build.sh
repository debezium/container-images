#!/bin/sh

echo ""
echo "****************************************************************"
echo "** Building  debezium/jdk8"
echo "****************************************************************"
docker build -t debezium/jdk8 jdk8/

echo ""
echo "****************************************************************"
echo "** Building  debezium/zookeeper"
echo "****************************************************************"
docker build -t debezium/zookeeper zookeeper/

echo ""
echo "****************************************************************"
echo "** Building  debezium/kafka"
echo "****************************************************************"
docker build -t debezium/kafka kafka/

echo ""
echo "****************************************************************"
echo "** Building  debezium/connect"
echo "****************************************************************"
docker build -t debezium/connect connect/

echo ""
echo "****************************************************************"
echo "** Building  debezium/example-mysql"
echo "****************************************************************"
docker build -t debezium/example-mysql examples/mysql/
