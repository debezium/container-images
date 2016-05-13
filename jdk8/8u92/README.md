A simple image with the Azul Zulu build of the OpenJDK Java Development Kit version 8. This is used as a base image for other Debezium images.

# What is Debezium?

Debezium is a distributed platform that turns your existing databases into event streams, so applications can see and respond in near real-time to each row-level change in the databases. Debezium is built on top of Kafka and provides Kafka Connect compatible connectors that monitor specific database management systems. Debezium records the history of data changes in Kafka logs, so your application can be stopped and restarted at any time and can easily consume all of the events it missed while it was not running, ensuring that all events are processed correctly and completely.