[Zookeeper](http://zookeeper.apache.org/) is a distributed coordination and consensus service. In Debezium, it is used by [Kafka](http://kafka.apache.org/) to coordinate the availability and responsiblities of each Kafka broker. Reliability is provided by clustering multiple Zookeeper processes, and since Zookeeper uses quorums you need an odd number (typically 3 or 5 in a production environment).

# What is Debezium?

Debezium is a distributed platform that turns your existing databases into event streams, so applications can see and respond in near real-time to each row-level change in the databases. Debezium is built on top of Kafka and provides Kafka Connect compatible connectors that monitor specific database management systems. Debezium records the history of data changes in Kafka logs, so your application can be stopped and restarted at any time and can easily consume all of the events it missed while it was not running, ensuring that all events are processed correctly and completely.

# Running Zookeeper as part of Debezium

Running Debezium involves Zookeeper, Kafka, and Debezium's connector service. Production environments require running multiple instances of each service to provide the performance, reliability, replication, and fault tolerance. This can be done with a platform like [OpenShift](https://www.openshift.com) that manages multiple Docker containers running on multiple hosts and machines. 

For simple evaluation and experimentation, a single instance of each service can all be run on a single host machine. For example, the following command will start a container that runs Zookeeper on port 2181, making it available to other containers running on the same host:

    $ docker run -d --name zookeeper -p 2181:2181 debezium/zookeeper

