The [Postgres](https://www.postgresql.org) relational database management system has a feature called [logical decoding](https://www.postgresql.org/docs/9.4/static/logicaldecoding-explanation.html) that allows clients to extract all persistent changes to a database's tables into a coherent, easy to understand format which can be interpreted without detailed knowledge of the database's internal state. An output plugin transform the data from the write-ahead log's internal representation into the format the consumer of a replication slot desires.

This image is based upon [`postgres:10.0`](https://hub.docker.com/_/postgres/) and adds a Debezium-specific [logical decoding output plugin that uses Protobuf](https://github.com/debezium/postgres-decoderbufs), enabling the [Debezium PostgreSQL Connector](http://debezium.io/docs/connectors/postgresql/) to capture changes committed to the database and record the data change events in Kafka topics. The image also includes [PostGIS](http://www.postgis.net) spatial database extender used to provide geospatial queries, so that changes to geometric data can also be captured by Debezium.

This provides an example of how the Debezium output plugin can be installed and how to enable PostgreSQL's logical decoding feature.

# What is Debezium?

Debezium is a distributed platform that turns your existing databases into event streams, so applications can quickly react to each row-level change in the databases. Debezium is built on top of Kafka and provides Kafka Connect compatible connectors that monitor specific database management systems. Debezium records the history of data changes in Kafka logs, so your application can be stopped and restarted at any time and can easily consume all of the events it missed while it was not running, ensuring that all events are processed correctly and completely.

Running Debezium involves Zookeeper, Kafka, and services that run Debezium's connectors. For simple evaluation and experimentation, all services can all be run on a single host machine, using the recipe outlined below. Production environments, however, require properly running and networking multiple instances of each service to provide the performance, reliability, replication, and fault tolerance. This can be done with a platform like [OpenShift](https://www.openshift.com) that manages multiple Docker containers running on multiple hosts and machines. But running Kafka in a Docker container has limitations, so for scenarios where very high throughput is required, you should run Kafka on dedicated hardware as explained in the [Kafka documentation](http://kafka.apache.org/documentation.html).


# How to use this image

This image is used in the same manner as the [`postgres:10.0`](https://hub.docker.com/_/postgres/) image, though the `/usr/share/postgresql/postgresql.conf.sample` file configures the logical decoding feature:

```
# LOGGING
log_min_error_statement = fatal

# CONNECTION
listen_addresses = '*'

# MODULES
shared_preload_libraries = 'decoderbufs'

# REPLICATION
wal_level = logical             # minimal, archive, hot_standby, or logical (change requires restart)
max_wal_senders = 1             # max number of walsender processes (change requires restart)
#wal_keep_segments = 4          # in logfile segments, 16MB each; 0 disables
#wal_sender_timeout = 60s       # in milliseconds; 0 disables
max_replication_slots = 1       # max number of replication slots (change requires restart)
```

This file instructs PostgreSQL to load [Debezium's logical decoding output plugin](https://github.com/debezium/postgres-decoderbufs), enable the logical decoding feature, and configure a single replication slot that will be used by the Debezium PostgreSQL Connector.
