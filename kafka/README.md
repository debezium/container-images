[Kafka](http://kafka.apache.org/) is a distributed, partitioned, replicated commit log service. In Debezium, connectors that monitor databases write all change events to Kafka topics, and your client applications consume the relevant Kafka topics to receive and process the change events.

# What is Debezium?

Debezium is a distributed platform that turns your existing databases into event streams, so applications can see and respond in near real-time to each row-level change in the databases. Debezium is built on top of Kafka and provides Kafka Connect compatible connectors that monitor specific database management systems. Debezium records the history of data changes in Kafka logs, so your application can be stopped and restarted at any time and can easily consume all of the events it missed while it was not running, ensuring that all events are processed correctly and completely.

# Running Kafka as part of Debezium

Running Debezium involves Zookeeper, Kafka, and Debezium's connector service. Production environments require running multiple instances of each service to provide the performance, reliability, replication, and fault tolerance. This can be done with a platform like [OpenShift](https://www.openshift.com) that manages multiple Docker containers running on multiple hosts and machines. 

For simple evaluation and experimentation, a single instance of each service can all be run on a single host machine. For example, the following command will start a container that runs Kafka on port 9092 and that looks for Zookeeper in the container named `zookeeper` running on the same host:

    $ docker run -d --name kafka -p 9092:9092 --link zookeeper:zookeeper debezium/kafka

