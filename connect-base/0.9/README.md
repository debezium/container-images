[Kafka Connect](http://kafka.apache.org/documentation.html#connect) is a system for moving data into and out of Kafka. All Debezium connectors adhere to the Kafka Connector API for _source connectors_, and each monitors a specific kind of database management system for changing data, and then forwards those changes directly into Kafka topics organized by server, database, and table. This image defines a runnable Kafka Connect service preconfigured with all Debezium connectors. The service has a RESTful API for managing connector instances -- simply start up a container, configure a connector for each data source you want to monitor, and let Debezium monitor those sources for changes and forward them to the appropriate Kafka topics.

# What is Debezium?

Debezium is a distributed platform that turns your existing databases into event streams, so applications can quickly react to each row-level change in the databases. Debezium is built on top of Kafka and provides Kafka Connect compatible connectors that monitor specific database management systems. Debezium records the history of data changes in Kafka logs, so your application can be stopped and restarted at any time and can easily consume all of the events it missed while it was not running, ensuring that all events are processed correctly and completely.

Running Debezium involves Zookeeper, Kafka, and services that run Debezium's connectors. For simple evaluation and experimentation, all services can all be run on a single host machine, using the recipe outlined below. Production environments, however, require properly running and networking multiple instances of each service to provide the performance, reliability, replication, and fault tolerance. This can be done with a platform like [OpenShift](https://www.openshift.com) that manages multiple Docker containers running on multiple hosts and machines. But running Kafka in a Docker container has limitations, so for scenarios where very high throughput is required, you should run Kafka on dedicated hardware as explained in the [Kafka documentation](http://kafka.apache.org/documentation.html).


# How to use this image

This image serves as a base image for other images that wish to use custom Kafka Connect connectors. This image provides a complete
installation of Kafka and its Kafka Connect libraries, plus a `docker-entrypoint.sh` script that will run Kafka Connect distributed service and dynamically set the Java classpath to include connector JARs found in child directories under `$KAFKA_CONNECT_PLUGINS_DIR`, which equates to `/kafka/connect`.

To add your connectors, your image should be based upon this image (e.g., using `FROM debezium/connect-base`) and should add the JAR files for one or more connectors to one or more child directories under `$KAFKA_CONNECT_PLUGINS_DIR`.

The general recommendation is to create a separate child directory for each connector (e.g., "debezium-connector-mysql"), and to place that connector's JAR files and other resource files in that child directory.

However, use a single directory for connectors when those connectors share dependencies. This will prevent the classes in the shared dependencies from appearing in multiple JARs on the classpath, which results in arcane NoSuchMethodError exceptions.

## Start a Kafka Connect service instance

*NOTE:* Please see the Apache Kafka [documentation](https://kafka.apache.org/documentation/#connect_running) for general information on running Kafka Connect and more details on the various options and environment variables.

Kafka Connect requires an already-running Zookeeper service, which is either running locally via the container named `zookeeper` or with OpenShift running as a service named `zookeeper`. Also required are already-running Kafka brokers, which are either running locally via the container named `kafka` or with OpenShift running as a service named `kafka`.

When running a cluster of one or more Kafka Connect service instances, several important parameters must be defined using environment variables. Please see the section below for the list of these required environment variables and acceptable values.

Starting an instance of Kafka Connect using this image is simple:

    $ docker run -it --name connect -p 8083:8083 -e GROUP_ID=1 -e CONFIG_STORAGE_TOPIC=my-connect-configs -e OFFSET_STORAGE_TOPIC=my-connect-offsets -e STATUS_STORAGE_TOPIC=my-connect-statuses -e ADVERTISED_HOST_NAME=$(echo $DOCKER_HOST | cut -f3  -d'/' | cut -f1 -d':') --link zookeeper:zookeeper --link kafka:kafka debezium/connect

This command uses this image and starts a new container named `connect`, which runs in the foreground and attaches the console so that it display the service's output and error messages. It exposes its REST API on port 8083, which is mapped to the same port number on the local host. It uses Zookeeper in the container (or service) named `zookeeper` and Kafka brokers in the container (or service) named `kafka`. This command sets the three required environment variables, though you should replace their values with more meaningful values for your environment.

To start the container in _detached_ mode, simply replace the `-it` option with `-d`. No service output will not be sent to your console, but it can be read at any time using the `docker logs` command. For example, the following command will display the output and keep following the output:

    $ docker logs --follow --name connect

## Start a shell in a running container

If you are already running a container with a Kafka Connect service, you can use this image to connect to that container and obtain a command line shell:

    $ docker exec -it connect bash

where `connect` is the name of your existing container. The shell will be set up with all environment variables exactly like when starting the service in the container. Therefore, links to other containers and additional environment variables may be specified and will be reflected in the shell's exported variables.


# Environment variables

The Debezium Kafka image uses several environment variables when running a Kafka broker using this image.

### `GROUP_ID`

This environment variable is required when running the Kafka Connect service. Set this to an ID that uniquely identifies the Kafka Connect cluster the service and its workers belong to.

### `CONFIG_STORAGE_TOPIC`

This environment variable is required when running the Kafka Connect service. Set this to the name of the Kafka topic where the Kafka Connect services in the group store connector configurations. The topic must have a single partition, should be highly replicated (e.g., 3x or more) and should be configured for compaction.

### `OFFSET_STORAGE_TOPIC`

This environment variable is required when running the Kafka Connect service. Set this to the name of the Kafka topic where the Kafka Connect services in the group store connector offsets. The topic should have many partitions, be highly replicated (e.g., 3x or more) and should be configured for compaction.

### `STATUS_STORAGE_TOPIC`

This environment variable should be provided when running the Kafka Connect service. Set this to the name of the Kafka topic where the Kafka Connect services in the group store connector status. The topic can have multiple partitions, should be highly replicated (e.g., 3x or more) and should be configured for compaction.

### `BOOTSTRAP_SERVERS`

This environment variable is an advanced setting, used only when Kafka is not running in a linkable container or service. Set this to a list of host/port pairs to use for establishing the *initial* connection to the Kafka cluster. Once a connection is established to one of these brokers, the service will then discover and make use of all Kafka brokers in the cluster, regardless of which servers are specified here for bootstrapping. The list should be in the form `host1:port1,host2:port2,...`. We recommend that you include more than one broker in this list, in case one of those is down.

### `REST_HOST_NAME`

This environment variable is an advanced setting. Set this to the hostname that the REST API will bind to.
Defaults to the hostname of the container.
Specify a value of `0.0.0.0` to bind the REST API to all available interfaces.

### `ADVERTISED_HOST_NAME`

This environment variable is an advanced setting. Set this to the hostname that will be given out to other workers to connect with. Defaults to the hostname of the container.

### `KEY_CONVERTER`

This environment variable is an advanced setting. Set this to the fully-qualified name of the Java class that implements Kafka Connect's `Converter` class, used to convert the connector's keys to the form stored in Kafka. Defaults to `org.apache.kafka.connect.json.JsonConverter`.

### `VALUE_CONVERTER`

This environment variable is an advanced setting. Set this to the fully-qualified name of the Java class that implements Kafka Connect's `Converter` class, used to convert the connector's values to the form stored in Kafka. Defaults to `org.apache.kafka.connect.json.JsonConverter`.

### `INTERNAL_KEY_CONVERTER`

This environment variable is an advanced setting. Set this to the fully-qualified name of the Java class that implements Kafka Connect's `Converter` class, used to convert the connector offset and configuration keys to the form stored in Kafka. Defaults to `org.apache.kafka.connect.json.JsonConverter`.

### `INTERNAL_VALUE_CONVERTER`

This environment variable is an advanced setting. Set this to the fully-qualified name of the Java class that implements Kafka Connect's `Converter` class, used to convert the connector offset and configuration values to the form stored in Kafka. Defaults to `org.apache.kafka.connect.json.JsonConverter`.

### `OFFSET_FLUSH_INTERVAL_MS`

This environment variable is an advanced setting. Set this to the number of milliseconds defining the interval at which the service will periodically try committing offsets for tasks. The default is `60000`, or 60 seconds.

### `OFFSET_FLUSH_TIMEOUT_MS`

This environment variable is an advanced setting. Set this to the maximum time in milliseconds to wait for records to flush and partition offset data to be committed to offset storage before cancelling the process and restoring the offset data to be committed in a future attempt. The default is `5000`, or 5 seconds.

### `SHUTDOWN_TIMEOUT`

This environment variable is an advanced setting. Set this to the number of milliseconds to wait for tasks to shutdown gracefully while the connectors complete all processing, record any final data, and clean up resources. This is the total amount of time, not per task. All task have shutdown triggered, then they are waited on sequentially. The default is `10000`, or 10 seconds.

### `HEAP_OPTS`

This environment variable is recommended. Use this to set the JVM options for the Kafka broker. By default a value of '-Xmx1G -Xms1G' is used, meaning that each Kafka broker uses 1GB of memory. Using too little memory may cause performance problems, while using too much may prevent the broker from starting properly given the memory available on the machine. Obviously the container must be able to use the amount of memory defined by this environment variable.

### `LOG_LEVEL`

This environment variable is optional. Use this to set the level of detail for Kafka's application log written to STDOUT and STDERR. Valid values are `INFO` (default), `WARN`, `ERROR`, `DEBUG`, or `TRACE`."

### Others

Environment variables that start with `CONNECT_` will be used to update the Kafka Connect worker configuration file. Each environment variable name will be mapped to a configuration property name by:

1. removing the `CONNECT_` prefix;
2. lowercasing all characters; and
3. converting all '\_' characters to '.' characters

For example, the environment variable `CONNECT_HEARTBEAT_INTERVAL_MS` is converted to the `heartbeat.interval.ms` property. The container will then update the Kafka Connect worker configuration file to include the property's name and value.

The value of the environment variable may not contain a '\@' character.


# Ports

Containers created using this image will expose port 8083, which is the standard port bound to by the Kafka Connect service.  You can use standard Docker options to map this to a different port on the host that runs the container.


# Storing data

The Kafka Connect service run by this image stores no data in the container, but it does produce logs. The only way to keep these files is to use volumes that map specific directories inside the container to the local file system (or to OpenShift persistent volumes).

### Log files

Although this image will send Kafka Connect service log output to standard output so it is visible as Docker logs, this image also configures the Kafka Connect service to write out more logs to a data volume at `/kafka/logs`. All logs are rotated daily.

### Configuration

This image defines a data volume at `/kafka/config` where the broker's configuration files are stored. Note that these configuration files are always modified based upon the environment variables and linked containers. The best use of this data volume is to be able to see the configuration files used by Kafka, although with some care it is possible to supply custom configuration files that will be adapted and used upon startup.
