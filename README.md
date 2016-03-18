This repository contains the primary Docker images for Debezium.

# What is Debezium?

Debezium is a distributed platform that turns your existing databases into event streams, so applications can see and respond in near real-time to each row-level change in the databases. Debezium is built on top of Kafka and provides Kafka Connect compatible connectors that monitor specific database management systems. Debezium records the history of data changes in Kafka logs, so your application can be stopped and restarted at any time and can easily consume all of the events it missed while it was not running, ensuring that all events are processed correctly and completely.

Debezium is open source under the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0.html)

# Tutorial for running Debezium with Docker

We have the a tutorial that walks you through running Debezium on Docker, but the tutorial is different for each version of Debezium:

* [Debezium 0.1](tutorials/0.1)

Give it a go, and let us know what you think:

* [On Twitter](https://twitter.com/debezium)
* [Chat with us](https://gitter.im/debezium/user)
* [Join the mailing list](https://groups.google.com/forum/#!forum/debezium)
* [Get the code](https://github.com/debezium/debezium)
