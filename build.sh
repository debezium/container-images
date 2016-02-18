#!/bin/sh

echo ""
echo "****************************************************************"
echo "** Building  debezium/jre8"
echo "****************************************************************"
docker build -t debezium/jre8 jre8/

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
