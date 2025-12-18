# What is Debezium?

Debezium is a distributed platform that turns your existing databases into event streams, so applications can quickly react to each row-level change in the databases.

# What is Debezium Server?

Debezium can be deployed either as connector instances in a [Kafka Connect](https://kafka.apache.org/documentation/#connect) cluster, or as a standalone application - Debezium Server.
Debezium [Server](https://debezium.io/documentation/reference/operations/debezium-server.html) is a [Quarkus-based](https://quarkus.io/) high-performance application that streams data from database to a one of supported sinks or a user developed sink.

Debezium Server supports multiple converters to provide different output message formats.


# How to use this image

The image requires as a dependency source and sink systems to read data from and write output messages to.

The application itself can be configured either via environment variables or via `appliaction.properties` injected into the container via a volume.

Starting an instance of Debezium Server using this container image is simple:

    $ docker run -it --name debezium -p 8080:8080 -v $PWD/config:/debezium/config -v $PWD/data:/debezium/data quay.io/debezium/server


## Example

If you want to try the image yourself then please follow the steps to establish the necessary environment.

Start PostgreSQL source database:

    $ docker run -d --name postgres -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres quay.io/debezium/example-postgres

Start Apache Pulsar sink:

    $ docker run -d --name pulsar -p 6650:6650 -p 7080:8080 apachepulsar/pulsar:2.5.2 bin/pulsar standalone

Wait for Pulsar sink to start:

    $ docker logs -f pulsar

Prepare Debezium Server deployment:

```
    $ mkdir {data,config}; chmod 777 {data,config}
    $ cat <<-EOF > config/application.properties
debezium.sink.type=pulsar
debezium.sink.pulsar.client.serviceUrl=pulsar://pulsar:6650
debezium.source.connector.class=io.debezium.connector.postgresql.PostgresConnector
debezium.source.offset.storage.file.filename=data/offsets.dat
debezium.source.offset.flush.interval.ms=0
debezium.source.database.hostname=postgres
debezium.source.database.port=5432
debezium.source.database.user=postgres
debezium.source.database.password=postgres
debezium.source.database.dbname=postgres
debezium.source.topic.prefix=tutorial
debezium.source.schema.include.list=inventory
debezium.source.plugin.name=pgoutput
EOF
```

Note that the configuration file can be replaced with environment variables where every property translates to uppercase and dots are replaced with underscore, e.g. `debezium.sink.type` becomes `DEBEZIUM_SINK_TYPE`.

Start the Debezium Server:

    $ docker run -it --name debezium -p 8080:8080 -v $PWD/config:/debezium/config -v $PWD/data:/debezium/data --link postgres --link pulsar quay.io/debezium/server


# Environment variables

The Debezium Server image uses several environment variables to configure JVM and source/sink when running this image.


### `JAVA_OPTS`

This environment variable is passed to command line when `java` command is invoked.
It could be used to tune memory settings etc.

### `DEBEZIUM_OPTS`

This environment variable is used in the same way as `JAVA_OPTS` and servers only for logical separation of Debezium Server specific settings.

### `JMX_HOST`

This environment variable is the JMX host set for `java.rmi.server.hostname`.

### `JMX_PORT`

This environment variable is the JMX port set for `com.sun.management.jmxremote.port` and `com.sun.management.jmxremote.rmi.port`.

### Source/sink Configuration options

All configuration options that could be present in `application.properties` can be either added or overridden via environment variables.
This is enabled by using [MicroProfile Config](https://github.com/eclipse/microprofile-config) in Debezium Server.

# Ports

Containers created using this image will expose port `8080`, which is the standard port to access [MicroProfile Health](https://github.com/eclipse/microprofile-health) endpoint.

# Volumes

The container image exposes two volumes:

### `/debezium/config`

In this volume the configuration files (mostly `application.properties`) are located.

### `/debezium/data`

In this volume the data files (mostly file offset storage) are located.

# JMX

To access JMX metrics, the `JMX_HOST` and `JMX_PORT` environment variables must be set.

In addition, the `quay.io/debezium/server` image ships with default access controls for JMX, defined in the following two files:

* `/debezium/jmx/jmxremote.access`
* `/debezium/jmx/jmxremote.password`

It's recommended you modify these files as a part of your build process as needed.