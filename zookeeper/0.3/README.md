[Zookeeper](http://zookeeper.apache.org/) is a distributed coordination and consensus service. In Debezium, it is used by [Kafka](http://kafka.apache.org/) to coordinate the availability and responsiblities of each Kafka broker. Reliability is provided by clustering multiple Zookeeper processes, and since Zookeeper uses quorums you need an odd number (typically 3 or 5 in a production environment).

# What is Debezium?

Debezium is a distributed platform that turns your existing databases into event streams, so applications can quickly react to each row-level change in the databases. Debezium is built on top of Kafka and provides Kafka Connect compatible connectors that monitor specific database management systems. Debezium records the history of data changes in Kafka logs, so your application can be stopped and restarted at any time and can easily consume all of the events it missed while it was not running, ensuring that all events are processed correctly and completely.

Running Debezium involves Zookeeper, Kafka, and services that run Debezium's connectors. For simple evaluation and experimentation, all services can all be run on a single host machine, using the recipe outlined below. Production environments, however, require properly running and networking multiple instances of each service to provide the performance, reliability, replication, and fault tolerance. This can be done with a platform like [OpenShift](https://www.openshift.com) that manages multiple Docker containers running on multiple hosts and machines. But running Kafka in a Docker container has limitations, so for scenarios where very high throughput is required, you should run Kafka on dedicated hardware as explained in the [Kafka documentation](http://kafka.apache.org/documentation.html).

# How to use this image

This image can be used to run one or more instances of Zookeeper required by Kafka brokers running in other containers. If running a single instance, the defaults are often good enough, especially for simple evaluations and demonstrations. However, when running multiple instances you will need to use the environment variables.

Production environments require running multiple instances of each service to provide the performance, reliability, replication, and fault tolerance. This can be done with a platform like [OpenShift](https://www.openshift.com) that manages multiple Docker containers running on multiple hosts and machines. 

## Start Zookeeper

Starting a Zookeeper instance using this image is simple:

    $ docker run -it --name zookeeper -p 2181:2181 -p 2888:2888 -p 3888:3888 debezium/zookeeper

This command uses this image and starts a new container named `zookeeper`, which runs in the foreground and attaches the console so that it display Zookeeper's output and error messages. It exposes and maps port 2181to the same port on the Docker host so that code running outside of the container (e.g., like Kafka) can talk with Zookeepr; Zookeeper's other ports (2888 and 3888) are also exposed and mapped to the Docker host. See the environment variables below for additional information that can be supplied to the server on startup.

To start the container in _detached_ mode, simply replace the `-it` option with `-d`. No broker output will not be sent to your console, but it can be read at any time using the `docker logs` command. For example, the following command will display the output and keep following the output:

    $ docker logs --follow --name zookeeper

## Display Zookeeper status

If you already have one or more containers running Zookeeper, you can use this image to start _another_ container that connects to the running instance(s) and displays the status:

    $ docker run -it --rm debezium/zookeeper status

The container will exit as soon as the status is displayed, and because `--rm` is used the container will be immediately removed. You can run this command as many times as necessary.

## Use the Zookeeper CLI

If you already have one or more containers running Zookeeper, you can use this image to start _another_ container that connects to the running instance(s) and starts the Zookeeper CLI:

    $ docker run -it --rm debezium/zookeeper cli

The container will exit as soon as you exit the CLI, and because `--rm` is used the container will be immediately removed.
You can run this command as many times as necessary.


# Environment variables

The Debezium Zookeeper image uses several environment variables.

### `SERVER_ID`

This environment variable defines the numeric identifier for this Zookeeper server. The default is '1' and is only applicable for a single standalone Zookeeper server that is not replicated or fault tolerant. In all other cases, you should set the server number to a unique value within your Zookeeper cluster.

### `SERVER_COUNT`

This environment variable defines the total number of Zookeeper servers in the cluster. The default is '1' and is only applicable for a single standalone Zookeeper server. In all other cases, you must use this variable to set the total number of servers in the cluster.

### `LOG_LEVEL`

This environment variable is optional. Use this to set the level of detail for Zookeeper's application log written to STDOUT and STDERR. Valid values are `INFO` (default), `WARN`, `ERROR`, `DEBUG`, or `TRACE`."


# Ports

Containers created using this image will expose ports 2181, 2888, and 3888. These are the standard ports used by Zookeeper. You can  use standard Docker options to map these to different ports on the host that runs the container.

# Storing data

The Kafka broker run by this image writes data to the local file system, and the only way to keep this data is to volumes that map specific directories inside the container to the local file system (or to OpenShift persistent volumes).

### Zookeeper data

This image defines a data volume at `/zookeeper/data`, and it is in this directory that the Zookeeper server will persist all of its data. You must mount it appropriately when running your container to persist the data after the container is stopped; failing to do so will result in all data being lost when the container is stopped.

### Log files

Although this image will send Zookeeper's log output to standard output so it is visible as Docker logs, this image also configures Zookeeper to write out more detailed lots to a data volume at `/zookeeper/logs`. You must mount it appropriately when running your container to persist the logs after the container is stopped; failing to do so will result in all logs being lost when the container is stopped.

### Configuration

This image defines a data volume at `/zookeeper/conf` where the Zookeeper server's configuration files are stored. Note that these configuration files are always modified based upon the environment variables and linked containers. The best use of this data volume is to be able to see the configuration files used by Zookeper, although with some care it is possible to supply custom configuration files that will be adapted and used upon container startup.

