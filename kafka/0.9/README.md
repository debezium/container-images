[Kafka](http://kafka.apache.org/) is a distributed, partitioned, replicated commit log service. In Debezium, connectors that monitor databases write all change events to Kafka topics, and your client applications consume the relevant Kafka topics to receive and process the change events.

# What is Debezium?

Debezium is a distributed platform that turns your existing databases into event streams, so applications can quickly react to each row-level change in the databases. Debezium is built on top of Kafka and provides Kafka Connect compatible connectors that monitor specific database management systems. Debezium records the history of data changes in Kafka logs, so your application can be stopped and restarted at any time and can easily consume all of the events it missed while it was not running, ensuring that all events are processed correctly and completely.

Running Debezium involves Zookeeper, Kafka, and services that run Debezium's connectors. For simple evaluation and experimentation, all services can all be run on a single host machine, using the recipe outlined below. Production environments, however, require properly running and networking multiple instances of each service to provide the performance, reliability, replication, and fault tolerance. This can be done with a platform like [OpenShift](https://www.openshift.com) that manages multiple Docker containers running on multiple hosts and machines. But running Kafka in a Docker container has limitations, so for scenarios where very high throughput is required, you should run Kafka on dedicated hardware as explained in the [Kafka documentation](http://kafka.apache.org/documentation.html).

# How to use this image

This image can be used in several different ways. All require an already-running Zookeeper service, which is either running locally via the container named `zookeeper` or with OpenShift running as a service named `zookeeper`.

## Start a Kafka broker

Starting a Kafka broker using this image is simple:

    $ docker run -it --name kafka -p 9092:9092 --link zookeeper:zookeeper debezium/kafka

This command uses this image and starts a new container named `kafka`, which runs in the foreground and attaches the console so that it display the broker's output and error messages. It exposes the broker on port 9092 and looks for Zookeeper in the container (or host) named `zookeeper`. See the environment variables below for additional information that can be supplied to the broker on startup.

To start the container in _detached_ mode, simply replace the `-it` option with `-d`. No broker output will not be sent to your console, but it can be read at any time using the `docker logs` command. For example, the following command will display the output and keep following the output:

    $ docker logs --follow --name kafka

## Create a topic on a running broker

If you already have one or more running containers with a Kafka broker, you can use this image to start _another_ container that connects to the running broker(s) and uses them to create a topic:

    $ docker run -it --rm --link zookeeper:zookeeper debezium/kafka create-topic [-p numPartitions] [-r numReplicas] [-c cleanupPolicy] topic-name

where `topic-name` is the name of the new topic, `numPartitions` is the number of partitions within the new topic, `numReplicas` is the number of replicas for each partition within the new topic and `cleanupPolicy` is the cleanup policy for the new topic (either `delete` or `compact`). The default for both `numPartitions` and `numReplicas` is '1'. The default `cleanupPolicy` is `delete`.

The container will exit as soon as the request to create the topic completes, and because `--rm` is used the container will be immediately removed.

Simply run this command once for each topic you want to create.

## Watch a topic on a running broker

If you already have one or more running containers with a Kafka broker, you can use this image to start _another_ container that connects to the running broker(s) and watches a topic:

    $ docker run -it --rm --link zookeeper:zookeeper --link kafka:kafka debezium/kafka watch-topic [-a] [-k] [-m minBytes] topic-name

where `topic-name` is the name of the topic, and

* `-a` is an optional flag that specifies that all of the topic messages should be displayed (i.e. from the beginning)
* `-k` is an optional flag that specifies whether the message key should be shown (by default, the key will not be displayed)
* `-m minBytes` is an optional parameter to specify that messages should only be fetched when doing so will consume at least the specified number of bytes (defaults to '1')

## Listing topics on a running broker

If you already have one or more running containers with a Kafka broker, you can use this image to start _another_ container that connects to the running broker(s) and lists the existing topics:

    $ docker run -it --rm --link zookeeper:zookeeper debezium/kafka list-topics

The container will exit (and be removed) immediately after the response is displayed.

# Environment variables

The Debezium Kafka image uses several environment variables when running a Kafka broker using this image.
The `ZOOKEEPER_CONNECT` variable is also applied when using the `create-topic` and `list-topics` modes of this image.

### `BROKER_ID`

This environment variable is recommended. Set this to the unique and persistent number for the broker. This must be set for every broker in a Kafka cluster, and should be set for a single standalone broker. The default is '1', and setting this will update the Kafka configuration.

### `ZOOKEEPER_CONNECT`

This environment variable is recommended, although linking to a `zookeeper` container precludes the need to use it. Otherwise, set this to a string described in the Kafka documentation for the 'zookeeper.connect' property so that the Kafka broker can find the Zookeeper service. Setting this will update the Kafka configuration.

### `HOST_NAME`

This environment variable is a recommended setting. Set this to the hostname that the broker will bind to. Defaults to the hostname of the container.

### `ADVERTISED_HOST_NAME`

This environment variable is an recommended setting. The host name specified with this environment variable will be registered in Zookeeper and given out to other workers to connect with. By default the value of `HOST_NAME` is used, so specify a different value if the `HOST_NAME` value will not be useful to or reachable by clients.

### `HEAP_OPTS`

This environment variable is recommended. Use this to set the JVM options for the Kafka broker. By default a value of '-Xmx1G -Xms1G' is used, meaning that each Kafka broker uses 1GB of memory. Using too little memory may cause performance problems, while using too much may prevent the broker from starting properly given the memory available on the machine. Obviously the container must be able to use the amount of memory defined by this environment variable.

### `CREATE_TOPICS`

This environment variable is optional. Use this to specify the topic(s) that should be created as soon as the broker starts. The value should be a comma-separated list of tuples in the form of `topic:partitions:replicas:(clean-up policy)?`. For example, when this environment variable is set to `topic1:1:2,topic2:3:1:compact`, then the container will create 'topic1' with 1 partition and 2 replicas, and 'topic2' with 3 partitions, 1 replica and `cleanup.policy` set to `compact`.

### `LOG_LEVEL`

This environment variable is optional. Use this to set the level of detail for Kafka's application log written to STDOUT and STDERR. Valid values are `INFO` (default), `WARN`, `ERROR`, `DEBUG`, or `TRACE`."

### Others

Environment variables that start with `KAFKA_` will be used to update the Kafka configuration file. Each environment variable name will be mapped to a configuration property name by:

1. removing the `KAFKA_` prefix;
2. lowercasing all characters; and
3. converting all '_' characters to '.' characters

For example, the environment variable `KAFKA_ADVERTISED_HOST_NAME` is converted to the `advertised.host.name` property, while `KAFKA_AUTO_CREATE_TOPICS_ENABLE` is converted to the `auto.create.topics.enable` property. The container will then update the Kafka configuration file to include the property's name and value.

The value of the environment variable may not contain a '\@' character.


# Ports

Containers created using this image will expose port 9092, which is the standard port used by Kafka.  You can  use standard Docker options to map this to a different port on the host that runs the container.


# Storing data

The Kafka broker run by this image writes data to the local file system, and the only way to keep this data is to use volumes that map specific directories inside the container to the local file system (or to OpenShift persistent volumes).

### Topic data

This image defines a data volume at `/kafka/data`. The broker writes all persisted data as files within this directory, inside a subdirectory named with the value of BROKER_ID (see above). You must mount it appropriately when running your container to persist the data after the container is stopped; failing to do so will result in all data being lost when the container is stopped.

### Log files

Although this image will send Kafka broker log output to standard output so it is visible in the Docker logs, this image also configures Kafka to write out more detailed logs to a data volume at `/kafka/logs`. All logs are rotated daily, and include:

* `server.log` - Contain the same log output sent to standard output and standard error.
* `state-change.log` - Records the timeline of requested and completed state changes between the controller and brokers.
* `kafka-request.log` - Records one entry for each of the request received and handled by the broker.
* `log-cleaner.log` - Records the detail about log compaction, whereby Kafka ensures that a compacted topic retains at least the last value for each distinct message key.
* `controller.log` - Records controller activities, such as the brokers that make up the in-sync replicas for each partition and the brokers that are the leaders of their partitions.

### Configuration

This image defines a data volume at `/kafka/config` where the broker's configuration files are stored. Note that these configuration files are always modified based upon the environment variables and linked containers. The best use of this data volume is to be able to see the configuration files used by Kafka, although with some care it is possible to supply custom configuration files that will be adapted and used upon startup.
