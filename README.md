This repository contains the primary Docker images for Debezium.

# What is Debezium?

Debezium is a distributed platform that turns your existing databases into event streams, so applications can see and respond in near real-time to each row-level change in the databases. Debezium is built on top of Kafka and provides Kafka Connect compatible connectors that monitor specific database management systems. Debezium records the history of data changes in Kafka logs, so your application can be stopped and restarted at any time and can easily consume all of the events it missed while it was not running, ensuring that all events are processed correctly and completely.

# Running Debezium with Docker

Running Debezium involves Zookeeper, Kafka, and Debezium's connector service. Production environments require running multiple instances of each service to provide the performance, reliability, replication, and fault tolerance. This can be done with a platform like [OpenShift](https://www.openshift.com) that manages multiple Docker containers running on multiple hosts and machines. 

For simple evaluation and experimentation, a single instance of each service can all be run on a single host machine. First, use Docker to start a container that runs Zookeeper on port 2181, naming that container `zookeeper` so that other containers will be able to find and link to it:

    $ docker run -d --name zookeeper -p 2181:2181 debezium/zookeeper

Next, start a container named `kafka` that runs Kafka on port 9092 and that uses the Zookeeper instance running in the container named `zookeeper`:

    $ docker run -d --name kafka -p 9092:9092 --link zookeeper:zookeeper debezium/kafka

Third, start a container named `connect` that runs the Kafka Connect service and all available Debezium connectors, linking to the `kafka` container and exposing Kafka Connect's REST API on port 8083:

    $ docker run -d --name connect -p 8083:8083 --link zookeeper:zookeeper --link kafka:kafka debezium/connect

