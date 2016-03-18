# Introduction

This tutorial walks you through running the Debezium platform for change data capture (CDC). You will use Docker (1.9 or later) to start the Debezium platform, run a MySQL database server with a simple example database, use Debezium to monitor the database, and see the resulting event streams respond as the data in the database changes.

# What is Debezium?

Debezium is a distributed platform that turns your existing databases into event streams, so applications can see and respond immediately to each row-level change in the databases. Debezium is built on top of Kafka and provides Kafka Connect compatible connectors that monitor specific database management systems. Debezium records the history of data changes in Kafka logs, so your application can be stopped and restarted at any time and can easily consume all of the events it missed while it was not running, ensuring that all events are processed correctly and completely.

Debezium 0.1 includes support for monitoring MySQL database servers. Support for other DBMSes will be added in future releases.

# Running Debezium with Docker

Running Debezium involves Zookeeper, Kafka, and Debezium's connector service. Production environments require running multiple instances of each service to provide the performance, reliability, replication, and fault tolerance. This can be done with a platform like [OpenShift](https://www.openshift.com) that manages multiple Docker containers running on multiple hosts and machines.

## Starting Docker

Before we do anything, make sure that Docker is running. If you're running Linux, you can either run the Docker daemon or configure it to run automatically on startup. In this case, the _Docker host_ is your local machine.

If you're using Windows or OS X, you have to run the Docker daeomon in a virtual machine. [Docker Machine|https://docs.docker.com/machine/get-started/] is the typical way to do this, so the rest of this section covers the bare minimum about how to use Docker Machine that's been [properly installed and configured])(https://www.docker.com/products/docker-toolbox) with a machine named "default" that runs the Docker daemon. First, check the status of the "default" machine:

    $ docker-machine status default

This will return "Running" if it is running, "Stopped" if the "default" machine is not running, or "Host does not exist" if you specify the name of a machine that is not known. If the machine is not running, then start it using:

    $ docker-machine start default

This also configures your terminal with several environment variables so any Docker commands you run on your host computer will know how to communicate with the Docker daemon running in the virtual machine. 

However, _whenever you create a new terminal, you will need to run the following command_ to configure it with the environment variables:

    $ eval $(docker-machine env)


### The Docker host

An important concept when working with Docker is the _Docker host_. In order to communicate with software running in a Docker container, one or more of the container's exposed ports must be mapped to ports on the Docker host. Other software can then communicate with the container by using one of those Docker host ports.

If you're running Docker on Linux, then the Docker daemon is running on your machine and your machine is the Docker host, and all mapped ports are on your machine. So for example, if you were to run a web server in a Docker container and map port 80 in the container to port 80 on the Docker host (e.g., your machine), then you can point your browser to `localhost:80`, and the Docker daemon will forward the request to the container and return the response.

Unfortunately, things are as straightforward when running Docker on Windows or OS X. When you use Docker Machine, the Docker daemon runs in the virtual machine, which means the _virtual machine_ is the Docker host. So, if you were to run a web server in a Docker container and map port 80 in the container to port 80 on the Docker host (e.g., the virtual machine), then you must point your browser to the _virtual machine's address_ in order to hit the web server -- pointing your browser to `localhost:80' will not work.

The following command will display information about the virtual machine named "default":

    $ docker-machine env default

and will output something like this:

    export DOCKER_TLS_VERIFY="1"
    export DOCKER_HOST="tcp://192.168.99.100:2376"
    export DOCKER_CERT_PATH="/Users/jsmith/.docker/machine/machines/default"
    export DOCKER_MACHINE_NAME="default"
    # Run this command to configure your shell: 
    # eval $(docker-machine env)

The `DOCKER_HOST` environment variable includes the IP address of the virtual machine, which is `192.168.99.100` in our example output. This means that you can point a browser to `http://192.168.99.100:80` to hit the web server running in a container that maps the web server's port to port 80 on the virtual machine. Using `localhost:80` will not work.

Be aware that this address may change whenver you start up the named virtual machine using Docker Machine.


### Troubleshooting Docker

If you're using Docker Machine, you may sometimes get the following error when running one of the Docker commands:

    Cannot connect to the Docker daemon. Is the docker daemon running on this host?

This means that the commands running in your terminal can't communicate with the Docker virtual machine (i.e., the Docker daemon), either because it is not running or because the required environment variables in the terminal are not set properly. So first, verify that your Docker machine is indeed running:

    $ docker-machine status default

Start the machine if needed, but it if is already running then the error almost certainly means that terminal was not configured to use the machine. Use the following command to do configure the terminal:

    $ eval $(docker-machine env default)

This should resolve the error so that you can run the Docker command.

## Starting simple

For simple evaluation and experimentation, a single instance of each service can all be run on a single host machine. Zookeeper and Kafka both store data locally inside the container, and normal usage requires mounting directories on the host machines as volumes so that when the containers stop the persisted data will remain. We'll show how to do this later, but right now we'll start out by not mounting any volumes. This means that when a container is removed, all persisted data will be lost. That's actually ideal for our experiment, since nothing will be left on your computer when we're finished, and you can run this experiment many times without having to clean anything up in between.

We are going to use several terminals to run our experiment. We use a separate terminal to run each container in the foreground, meaning that all output of the container will be displayed in the terminal used to run it. However, once we start a container this way, we won't be able to the terminal to do anything other than stop the container.

Note: this is not the only way to run Docker containers. Rather than running a container in the foreground (with `--it`), Docker lets you run a container in _detached_ mode (with `-d`), where the container is started and the Docker command returns immediately. Detached mode containers don't display their output in the terminal, though you can always see the output by using `docker logs --follow --name <container-name>`. See the Docker documentation for more detail.

### Start Zookeeper

Of all the different services/processes that make up Debezium, the first one to start is Zookeeper. Start a new terminal and set up the Docker environment (as described above), and then start a container with Zookeeper by running:

    $ docker run -it --name zookeeper -p 2181:2181 -p 2888:2888 -p 3888:3888 debezium/zookeeper

This runs a new container using the `debezium/zookeeper` image, and assigns the name `zookeeper` to this container. The `-it` flag makes the container interactive, meaning it attaches the terminal's standard input and output to the container so that you can see what is going on in the container. The command maps three of the container's ports (e.g., 2181, 2888, and 3888) to the same ports on the Docker host so that software outside of the container can talk with Zookeeper.

You should see in your terminal the typical output of Zookeeper:

	Starting up in standalone mode
	JMX enabled by default
	Using config: /zookeeper/conf/zoo.cfg
	2016-03-09 18:42:16,428 - INFO  [main:QuorumPeerConfig@103] - Reading configuration from: /zookeeper/conf/zoo.cfg
	2016-03-09 18:42:16,435 - INFO  [main:DatadirCleanupManager@78] - autopurge.snapRetainCount set to 3
	2016-03-09 18:42:16,436 - INFO  [main:DatadirCleanupManager@79] - autopurge.purgeInterval set to 1
	2016-03-09 18:42:16,437 - WARN  [main:QuorumPeerMain@113] - Either no config or no quorum defined in config, running  in standalone mode
	2016-03-09 18:42:16,440 - INFO  [PurgeTask:DatadirCleanupManager$PurgeTask@138] - Purge task started.
	2016-03-09 18:42:16,457 - INFO  [main:QuorumPeerConfig@103] - Reading configuration from: /zookeeper/conf/zoo.cfg
	2016-03-09 18:42:16,461 - INFO  [main:ZooKeeperServerMain@95] - Starting server
	2016-03-09 18:42:16,465 - INFO  [PurgeTask:DatadirCleanupManager$PurgeTask@144] - Purge task completed.
	2016-03-09 18:42:16,478 - INFO  [main:Environment@100] - Server environment:zookeeper.version=3.4.6-1569965, built on 02/20/2014 09:09 GMT
	2016-03-09 18:42:16,479 - INFO  [main:Environment@100] - Server environment:host.name=a780c032179e
	2016-03-09 18:42:16,479 - INFO  [main:Environment@100] - Server environment:java.version=1.8.0_72-internal
	2016-03-09 18:42:16,479 - INFO  [main:Environment@100] - Server environment:java.vendor=Oracle Corporation
	2016-03-09 18:42:16,479 - INFO  [main:Environment@100] - Server environment:java.home=/usr/lib/jvm/java-8-openjdk-amd64/jre
	2016-03-09 18:42:16,479 - INFO  [main:Environment@100] - Server environment:java.class.path=/zookeeper/bin/../build/classes:/zookeeper/bin/../build/lib/*.jar:/zookeeper/bin/../lib/slf4j-log4j12-1.6.1.jar:/zookeeper/bin/../lib/slf4j-api-1.6.1.jar:/zookeeper/bin/../lib/netty-3.7.0.Final.jar:/zookeeper/bin/../lib/log4j-1.2.16.jar:/zookeeper/bin/../lib/jline-0.9.94.jar:/zookeeper/bin/../zookeeper-3.4.6.jar:/zookeeper/bin/../src/java/lib/*.jar:/zookeeper/conf:
	2016-03-09 18:42:16,479 - INFO  [main:Environment@100] - Server environment:java.library.path=/usr/java/packages/lib/amd64:/usr/lib/x86_64-linux-gnu/jni:/lib/x86_64-linux-gnu:/usr/lib/x86_64-linux-gnu:/usr/lib/jni:/lib:/usr/lib
	2016-03-09 18:42:16,480 - INFO  [main:Environment@100] - Server environment:java.io.tmpdir=/tmp
	2016-03-09 18:42:16,483 - INFO  [main:Environment@100] - Server environment:java.compiler=<NA>
	2016-03-09 18:42:16,484 - INFO  [main:Environment@100] - Server environment:os.name=Linux
	2016-03-09 18:42:16,484 - INFO  [main:Environment@100] - Server environment:os.arch=amd64
	2016-03-09 18:42:16,484 - INFO  [main:Environment@100] - Server environment:os.version=4.1.17-boot2docker
	2016-03-09 18:42:16,484 - INFO  [main:Environment@100] - Server environment:user.name=zookeeper
	2016-03-09 18:42:16,484 - INFO  [main:Environment@100] - Server environment:user.home=/zookeeper
	2016-03-09 18:42:16,486 - INFO  [main:Environment@100] - Server environment:user.dir=/zookeeper
	2016-03-09 18:42:16,492 - INFO  [main:ZooKeeperServer@755] - tickTime set to 2000
	2016-03-09 18:42:16,492 - INFO  [main:ZooKeeperServer@764] - minSessionTimeout set to -1
	2016-03-09 18:42:16,492 - INFO  [main:ZooKeeperServer@773] - maxSessionTimeout set to -1
	2016-03-09 18:42:16,507 - INFO  [main:NIOServerCnxnFactory@94] - binding to port 0.0.0.0/0.0.0.0:2181

The terminal will continue to show additional output as Zookeeper generates it.

### Start Kafka

Open a new terminal and if needed configure it with the Docker environment. Then, start Kafka in a new container by running:

    $ docker run -it --name kafka -p 9092:9092 -e ADVERTISED_HOST_NAME=$(echo $DOCKER_HOST | cut -f3  -d'/' | cut -f1 -d':') --link zookeeper:zookeeper debezium/kafka

This runs a new container using the `debezium/kafka` image, and assigns the name `kafka` to this container. The `-it` flag makes the container interactive, meaning it attaches the terminal's standard input and output to the container so that you can see what is going on in the container. The command maps port 9092 in the container to the same port on the Docker host so that software outside of the container can talk with Kafka. Finally, the command uses the `--link zookeeper:zookeeper` argument to tell the container that it can find Zookeeper in the container named `zookeeper` running on the same Docker host.

You should see in your terminal the typical output of Kafka, ending with:

    ...
	2016-03-09 18:59:08,771 - INFO  [main-EventThread:ZkClient@711] - zookeeper state changed (SyncConnected)
	2016-03-09 18:59:08,877 - INFO  [main:Logging$class@68] - Loading logs.
	2016-03-09 18:59:08,885 - INFO  [main:Logging$class@68] - Logs loading complete.
	2016-03-09 18:59:08,920 - INFO  [main:Logging$class@68] - Starting log cleanup with a period of 300000 ms.
	2016-03-09 18:59:08,929 - INFO  [main:Logging$class@68] - Starting log flusher with a default period of 9223372036854775807 ms.
	2016-03-09 18:59:08,932 - WARN  [main:Logging$class@83] - No meta.properties file under dir /kafka/data/1/meta.properties
	2016-03-09 18:59:08,990 - INFO  [main:Logging$class@68] - Awaiting socket connections on 0.0.0.0:9092.
	2016-03-09 18:59:08,993 - INFO  [main:Logging$class@68] - [Socket Server on Broker 1], Started 1 acceptor threads
	2016-03-09 18:59:09,014 - INFO  [ExpirationReaper-1:Logging$class@68] - [ExpirationReaper-1], Starting 
	2016-03-09 18:59:09,015 - INFO  [ExpirationReaper-1:Logging$class@68] - [ExpirationReaper-1], Starting 
	2016-03-09 18:59:09,066 - INFO  [main:Logging$class@68] - Creating /controller (is it secure? false)
	2016-03-09 18:59:09,074 - INFO  [main:Logging$class@68] - Result of znode creation is: OK
	2016-03-09 18:59:09,075 - INFO  [main:Logging$class@68] - 1 successfully elected as leader
	2016-03-09 18:59:09,186 - INFO  [main:Logging$class@68] - [GroupCoordinator 1]: Starting up.
	2016-03-09 18:59:09,218 - INFO  [group-metadata-manager-0:Logging$class@68] - [Group Metadata Manager on Broker 1]: Removed 0 expired offsets in 21 milliseconds.
	2016-03-09 18:59:09,222 - INFO  [ExpirationReaper-1:Logging$class@68] - [ExpirationReaper-1], Starting 
	2016-03-09 18:59:09,222 - INFO  [main:Logging$class@68] - [GroupCoordinator 1]: Startup complete.
	2016-03-09 18:59:09,264 - INFO  [ExpirationReaper-1:Logging$class@68] - [ExpirationReaper-1], Starting 
	2016-03-09 18:59:09,275 - INFO  [ThrottledRequestReaper-Produce:Logging$class@68] - [ThrottledRequestReaper-Produce], Starting 
	2016-03-09 18:59:09,278 - INFO  [ThrottledRequestReaper-Fetch:Logging$class@68] - [ThrottledRequestReaper-Fetch], Starting 
	2016-03-09 18:59:09,311 - INFO  [main:Logging$class@68] - Will not load MX4J, mx4j-tools.jar is not in the classpath
	2016-03-09 18:59:09,328 - INFO  [main:Logging$class@68] - Creating /brokers/ids/1 (is it secure? false)
	2016-03-09 18:59:09,335 - INFO  [main:Logging$class@68] - Result of znode creation is: OK
	2016-03-09 18:59:09,337 - INFO  [ZkClient-EventThread-14-172.17.0.2:2181:Logging$class@68] - New leader is 1
	2016-03-09 18:59:09,338 - INFO  [main:Logging$class@68] - Registered broker 1 at path /brokers/ids/1 with addresses: PLAINTEXT -> EndPoint(172.17.0.3,9092,PLAINTEXT)
	2016-03-09 18:59:09,353 - INFO  [main:AppInfoParser$AppInfo@82] - Kafka version : 0.9.0.1
	2016-03-09 18:59:09,353 - INFO  [main:AppInfoParser$AppInfo@83] - Kafka commitId : 23c69d62a0cabf06
	2016-03-09 18:59:09,354 - INFO  [main:Logging$class@68] - [Kafka Server 1], started

The terminal will continue to show additional output as Zookeeper generates it.


### Start Kafka Connect

Open a new terminal and if needed configure it with the Docker environment. Then, start Kafka Connect in a new container by running:

    $ docker run -it --name connect -p 8083:8083 -e GROUP_ID=1 -e CONFIG_STORAGE_TOPIC=my-connect-configs -e OFFSET_STORAGE_TOPIC=my-connect-offsets -e ADVERTISED_HOST_NAME=$(echo $DOCKER_HOST | cut -f3  -d'/' | cut -f1 -d':') --link zookeeper:zookeeper --link kafka:kafka debezium/connect

This runs a new container using the `debezium/connect` image, and assigns the name `connect` to this container. The `-it` flag makes the container interactive, meaning it attaches the terminal's standard input and output to the container so that you can see what is going on in the container. The command maps port 8083 in the container to the same port on the Docker host so that software outside of the container can use Kafka Connect's REST API to set up and manage new connector instances. The command uses the `--link zookeeper:zookeeper` and `--link kafka:kafka` argument to tell the container that it can find Zookeeper and Kafka in the container named `zookeeper` and `kafka`, respectively, running on the same Docker host. And finally, it also uses the `-e` option four times to set the `GROUP_ID`, `CONFIG_STORAGE_TOPIC`, `OFFSET_STORAGE_TOPIC`, and `ADVERTISED_HOST_NAME` environment variables; the first three are required by this container (you can use different values as desired), while the last variable is optional but instructs the Kafka Connect server process to advertise the host at which the service is running (which in our case is the Docker host obtained via one of your computer's environment variables).

You should see in your terminal the typical output of Kafka, ending with:

    ...
    2016-03-14 18:19:45,222 - INFO  [DistributedHerder:AppInfoParser$AppInfo@82] - Kafka version : 0.9.0.1
    2016-03-14 18:19:45,222 - INFO  [DistributedHerder:AppInfoParser$AppInfo@83] - Kafka commitId : 23c69d62a0cabf06
    2016-03-14 18:19:45,463 - INFO  [main:Server@327] - jetty-9.2.12.v20150709
    2016-03-14 18:19:46,024 - INFO  [DistributedHerder:KafkaBasedLog@143] - Finished reading KafakBasedLog for topic my-connect-configs
    2016-03-14 18:19:46,024 - INFO  [DistributedHerder:KafkaBasedLog@145] - Started KafakBasedLog for topic my-connect-configs
    2016-03-14 18:19:46,024 - INFO  [DistributedHerder:KafkaConfigStorage@242] - Started KafkaConfigStorage
    2016-03-14 18:19:46,024 - INFO  [DistributedHerder:DistributedHerder@156] - Herder started
    2016-03-14 18:19:46,362 - INFO  [DistributedHerder:DistributedHerder$14@868] - Joined group and got assignment: Assignment{error=0, leader='connect-1-79c73a23-e6a6-4ef1-aedc-a9298da8e022', leaderUrl='http://192.168.99.100:8083/', offset=-1, connectorIds=[], taskIds=[]}
    2016-03-14 18:19:46,363 - INFO  [DistributedHerder:DistributedHerder@639] - Starting connectors and tasks using config offset -1
    2016-03-14 18:19:46,364 - INFO  [DistributedHerder:DistributedHerder@659] - Finished starting connectors and tasks
    ...
    2016-03-14 18:19:46,497 - INFO  [main:ContextHandler@744] - Started o.e.j.s.ServletContextHandler@1f2f9244{/,null,AVAILABLE}
    2016-03-14 18:19:46,518 - INFO  [main:AbstractConnector@266] - Started ServerConnector@3d99a0aa{HTTP/1.1}{172.17.0.4:8083}
    2016-03-14 18:19:46,524 - INFO  [main:Server@379] - Started @5039ms
    2016-03-14 18:19:46,526 - INFO  [main:RestServer@132] - REST server listening at http://172.17.0.4:8083/, advertising URL http://192.168.99.100:8083/
    2016-03-14 18:19:46,526 - INFO  [main:Connect@60] - Kafka Connect started

The terminal will continue to show additional output as the Kafka Connect service generates it.

The Kafka Connect service exposes a RESTful API to manage the set of connectors, so let's use that API using the `curl` command line tool. So first, open up a new terminal and then run the following command:

    $ echo $DOCKER_HOST | cut -f3  -d'/' | cut -f1 -d':'

This checks the IP address of the Docker host, which for the rest of this example we'll assume is `192.168.99.100`.

Then, issue the following command to check the status of the Kafka Connect service running in the `connect` container, via the Docker host IP address which forwards port 8083 to the same port on the `connect` container:

    $ curl -H "Accept:application/json" 192.168.99.100:8083/

which should return something like the following:

    {"version":"0.9.0.1","commit":"23c69d62a0cabf06"}

This shows that we're running Kafka Connect version 0.9.0.1. Next, check the list of connectors:

    $ curl -H "Accept:application/json" 192.168.99.100:8083/connectors/

which should return the following:

    []

This confirms that the Kafka Connect service is running but currently has no connectors.


### Start a MySQL database

At this point, we've started Zookeeper, Kafka, and Kafka Connect, but we've not yet configured Kafka Connect to run any connectors. In other words, the basic Debezium services are running but they're not watching any databases. Before we can set up connectors, we have to first set up a relational database that we'll monitor.

Open a new terminal and if needed configure it with the Docker environment. Then, start a new container that runs a MySQL database server preconfigured with an `inventory` database:

    $ docker run -it --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=debezium -e MYSQL_USER=mysqluser -e MYSQL_PASSWORD=mysqlpw debezium/example-mysql

You should see in your terminal something like the following:

    ...
    2016-03-14T22:30:15.657044Z 0 [Note] mysqld: Shutdown complete
    
    
    MySQL init process done. Ready for start up.

    2016-03-14T22:30:15.861721Z 0 [Note] mysqld (mysqld 5.7.11-log) starting as process 1 ...
    2016-03-14T22:30:15.866636Z 0 [Note] InnoDB: PUNCH HOLE support available
    2016-03-14T22:30:15.866710Z 0 [Note] InnoDB: Mutexes and rw_locks use GCC atomic builtins
    2016-03-14T22:30:15.866727Z 0 [Note] InnoDB: Uses event mutexes
    2016-03-14T22:30:15.866741Z 0 [Note] InnoDB: GCC builtin __atomic_thread_fence() is used for memory barrier
    2016-03-14T22:30:15.866771Z 0 [Note] InnoDB: Compressed tables use zlib 1.2.8
    2016-03-14T22:30:15.866788Z 0 [Note] InnoDB: Using Linux native AIO
    2016-03-14T22:30:15.866989Z 0 [Note] InnoDB: Number of pools: 1
    2016-03-14T22:30:15.867150Z 0 [Note] InnoDB: Using CPU crc32 instructions
    2016-03-14T22:30:15.873427Z 0 [Note] InnoDB: Initializing buffer pool, total size = 128M, instances = 1, chunk size = 128M
    2016-03-14T22:30:15.879085Z 0 [Note] InnoDB: Completed initialization of buffer pool
    2016-03-14T22:30:15.880199Z 0 [Note] InnoDB: If the mysqld execution user is authorized, page cleaner thread priority can be changed. See the man page of setpriority().
    2016-03-14T22:30:15.891387Z 0 [Note] InnoDB: Highest supported file format is Barracuda.
    2016-03-14T22:30:15.897290Z 0 [Note] InnoDB: Creating shared tablespace for temporary tables
    2016-03-14T22:30:15.897383Z 0 [Note] InnoDB: Setting file './ibtmp1' size to 12 MB. Physically writing the file full; Please wait ...
    2016-03-14T22:30:15.917036Z 0 [Note] InnoDB: File './ibtmp1' size is now 12 MB.
    2016-03-14T22:30:15.917555Z 0 [Note] InnoDB: 96 redo rollback segment(s) found. 96 redo rollback segment(s) are active.
    2016-03-14T22:30:15.917580Z 0 [Note] InnoDB: 32 non-redo rollback segment(s) are active.
    2016-03-14T22:30:15.918970Z 0 [Note] InnoDB: Waiting for purge to start
    2016-03-14T22:30:15.969933Z 0 [Note] InnoDB: 5.7.11 started; log sequence number 12028636
    2016-03-14T22:30:15.970156Z 0 [Note] Plugin 'FEDERATED' is disabled.
    2016-03-14T22:30:15.970905Z 0 [Note] InnoDB: Loading buffer pool(s) from /var/lib/mysql/ib_buffer_pool
    2016-03-14T22:30:15.974684Z 0 [Note] InnoDB: Buffer pool(s) load completed at 160314 22:30:15
    2016-03-14T22:30:15.991369Z 0 [Warning] Failed to set up SSL because of the following SSL library error: SSL context is not usable without certificate and private key
    2016-03-14T22:30:15.991427Z 0 [Note] Server hostname (bind-address): '*'; port: 3306
    2016-03-14T22:30:15.991465Z 0 [Note] IPv6 is available.
    2016-03-14T22:30:15.991482Z 0 [Note]   - '::' resolves to '::';
    2016-03-14T22:30:15.991496Z 0 [Note] Server socket created on IP: '::'.
    2016-03-14T22:30:15.993289Z 0 [Warning] 'db' entry 'sys mysql.sys@localhost' ignored in --skip-name-resolve mode.
    2016-03-14T22:30:15.993351Z 0 [Warning] 'proxies_priv' entry '@ root@localhost' ignored in --skip-name-resolve mode.
    2016-03-14T22:30:15.995123Z 0 [Warning] 'tables_priv' entry 'sys_config mysql.sys@localhost' ignored in --skip-name-resolve mode.
    2016-03-14T22:30:16.000548Z 0 [Note] Event Scheduler: Loaded 0 events
    2016-03-14T22:30:16.000711Z 0 [Note] mysqld: ready for connections.

Notice that the MySQL server starts and stops multiple times as the configuration is modified. At this point, the MySQL server is running in a container named `mysql` and has a database called `inventory` with several tables each populated with some sample data.

Open another new terminal, and type the following to start a new container that runs the MySQL command line client that connects to the MySQL server running in the `mysql` container:

    $ docker run -it --link mysql --rm mysql:5.7 sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'

and you should see:

    mysql: [Warning] Using a password on the command line interface can be insecure.
    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 2
    
    Copyright (c) 2000, 2016, Oracle and/or its affiliates. All rights reserved.
    
    Oracle is a registered trademark of Oracle Corporation and/or its
    affiliates. Other names may be trademarks of their respective
    owners.
    
    Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
    
    mysql> 

At the prompt, enter the following commands:
    
    mysql> use inventory;

and then:

    mysql> show tables;

The MySQL command line client should then display:

    +---------------------+
    | Tables_in_inventory |
    +---------------------+
    | customers           |
    | orders              |
    | products            |
    | products_on_hand    |
    +---------------------+
    4 rows in set (0.00 sec)

You can continue to use the MySQL command line client to view the data. For example:

    mysql> SELECT * FROM customers;

We'll leave to the reader any additional exploration of the `inventory` database.


### Monitor the MySQL database

At this point we are running the Debezium services plus a MySQL database server with a sample `inventory` database. The next step is to register a connector that will begin monitoring the MySQL database server's binlog and generating change events for each row that has been (or will be) changed. It will start from the beginning of the MySQL binlog, which records all of the transactions, including individual row changes and changes to the schemas. 

It is essential to keeping track of the schema changes, because each row change is described in terms of the structure of its table _at the time the row was changed_, so our connector is going to record these in a separate Kafka topic so that, if needed upon restart at some point in the binlog, it can regenerate the structure of the database that existed at that point in time in the binlog.

First, let's create that Kafka topic where the connector can write out the database's schema changes. We'll use the `debezium/kafka` image to start a container that runs the Kafka utility to create the topic that we'll name `schema-changes.inventory`. Go back to your terminal where you ran the `curl` commands against the Kafka Connect service, and run the following to create the topic:

    $ docker run -it --rm --link zookeeper:zookeeper debezium/kafka create-topic -r 1 schema-changes.inventory

Here, we link to the Zookeeper container so that it can find the Kafka broker(s). The topic will have one partition, which is what the connector requires since we need to maintain the total order of all DDL statements. We use the `-r 1` argument to specify the topic should have 1 replica; normally we'd want enough replicas (typically 3 or more) to not lose data should brokers fail, but in our example we're only running a single broker.

You'll see output similar to the following:

    Creating new topic schema-changes.inventory with 1 partition(s) and 1 replica(s)...
    Created topic "schema-changes.inventory".

The container will exit as soon as the request to create the topic completes, and because `--rm` is used the container will be immediately removed.

Now we're ready to start our connector:

    $ curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" 192.168.99.100:8083/connectors/ -d '{ "name": "inventory-connector", "config": { "connector.class": "io.debezium.connector.mysql.MySqlConnector", "tasks.max": "1", "database.hostname": "192.168.99.100", "database.port": "3306", "database.user": "replicator", "database.password": "replpass", "database.server.id": "184054", "database.server.name": "mysql-server-1", "database.binlog": "mysql-bin.000001", "database.whitelist": "inventory", "database.history.kafka.bootstrap.servers": "kafka:9092", "database.history.kafka.topic": "schema-changes.inventory" } }'

This command execute a `POST` request against the Kafka Connect service's RESTful API to request a new connector named `inventory-connector` with the following more readable connector configuration:

    {
    	"name": "inventory-connector", 
    	"config": {
            "connector.class": "io.debezium.connector.mysql.MySqlConnector",
            "tasks.max": "1",
            "database.hostname": "192.168.99.100",
            "database.port": "3306",
            "database.user": "replicator",
            "database.password": "replpass",
            "database.server.id": "184054",
            "database.server.name": "mysql-server-1",
            "database.binlog": "mysql-bin.000001",
            "database.whitelist": "inventory",
            "database.history.kafka.bootstrap.servers": "kafka:9092",
            "database.history.kafka.topic": "schema-changes.inventory",
        }
    }

This specifies that we want to use Debezium's MySQL connector (which is already install in Debezium's Connect image), and:

* Exactly one task should operate at any one time. Since the MySQL connect reads the MySQL server's binlog, and using a single connector task is the only way to ensure the proper order and that all events are handled properly.
* The database host and port are specified.
* The MySQL database we're running has a `replicator` user set up expressly for our purposes, so we specify that username and password here.
* A unique server ID and name are given. The server name is the logical identifier for the MySQL server or cluster of servers, and will be used as the prefix for all Kafka topics.
* The name of the initial binlog file is given. We start at the first file, but you can alternatively specify others.
* We only want to detect changes in the `inventory` database, so we use a whitelist.
* The connector should store the history of the database schemas in Kafka using the named broker (the same broker to which we're sending events) and topic name. Upon restart, the connector will recover the schemas of the database(s) that existed at the point in time in the binlog when the connector should begin reading.

This command should produce a response similar to the following:

    HTTP/1.1 201 Created
    Date: Wed, 16 Mar 2016 15:20:55 GMT
    Location: http://192.168.99.100:8083/connectors/inventory-connector
    Content-Type: application/json
    Content-Length: 534
    Server: Jetty(9.2.12.v20150709)
    
    {
    	"name":"inventory-connector",
    	"config":{
    		"connector.class":"io.debezium.connector.mysql.MySqlConnector",
    		"tasks.max":"1",
    		"database.hostname":"192.168.99.100",
    		"database.port":"3306",
    		"database.user":"replicator",
    		"database.password":"replpass",
    		"database.server.id":"184054",
    		"database.server.name":"mysql-server-1",
    		"database.binlog":"mysql-bin.000001",
    		"database.whitelist":"inventory",
    		"database.history.kafka.bootstrap.servers":"kafka:9092",
    		"database.history.kafka.topic":"schema-changes.inventory",
    		"name":"inventory-connector"
    	},
    	"tasks":[]
    }

We can even use the RESTful API to check that our connector is registered:

    $ curl -H "Accept:application/json" 192.168.99.100:8083/connectors/

which should return the following:

    ["inventory-connector"]

Recall that the Kafka Connect service uses connectors to start one or more tasks that do the work, and that it will automatically distribute the running tasks across the cluster of Kafka Connect services. Should any of the services stop or crash, those tasks will be redistributed to running services. We can see the tasks when we get the state of the connector:

    $ curl -i -X GET -H "Accept:application/json" 192.168.99.100:8083/connectors/inventory-connector

which returns:

    HTTP/1.1 200 OK
    Date: Wed, 16 Mar 2016 15:26:12 GMT
    Content-Type: application/json
    Content-Length: 578
    Server: Jetty(9.2.12.v20150709)
    
    {
    	"name":"inventory-connector",
    	"config":{
    		"connector.class":"io.debezium.connector.mysql.MySqlConnector",
    		"tasks.max":"1",
    		"database.hostname":"192.168.99.100",
    		"database.port":"3306",
    		"database.user":"replicator",
    		"database.password":"replpass",
    		"database.server.id":"184054",
    		"database.server.name":"mysql-server-1",
    		"database.binlog":"mysql-bin.000001",
    		"database.whitelist":"inventory",
    		"database.history.kafka.bootstrap.servers":"kafka:9092",
    		"database.history.kafka.topic":"schema-changes.inventory",
    		"name":"inventory-connector"
    	},
    	"tasks":[
    		{
    			"connector":"inventory-connector",
    			"task":0
    		}
    	]
    }

Here, we can see that the connector is running a single task (e.g., task 0) to do its work. (The MySQL connector only supports a single task, since we can't really have multiple readers of a single binlog.)

If we look at the output of our `connect` container, we should see these lines:

    ....
    2016-03-16 15:20:58,685 - INFO  [WorkerSourceTask-inventory-connector-0:MySqlConnectorTask@215] - Starting MySQL connector from beginning of binlog file null, position 4
    Mar 16, 2016 3:20:58 PM com.github.shyiko.mysql.binlog.BinaryLogClient connect
    INFO: Connected to 192.168.99.100:3306 at mysql-bin.000001/4 (sid:184054, cid:7)
    2016-03-16 15:20:58,793 - INFO  [blc-192.168.99.100:3306:MySqlConnectorTask$1@355] - MySQL Connector connected
    2016-03-16 15:20:58,794 - INFO  [WorkerSourceTask-inventory-connector-0:WorkerSourceTask$WorkerSourceTaskThread@342] - Source task Thread[WorkerSourceTask-inventory-connector-0,5,main] finished initialization and start
    2016-03-16 15:21:02,472 - WARN  [kafka-producer-network-thread | producer-1:NetworkClient$DefaultMetadataUpdater@582] - Error while fetching metadata with correlation id 5 : {mysql-server-1.inventory.products=LEADER_NOT_AVAILABLE}
    2016-03-16 15:21:02,685 - WARN  [kafka-producer-network-thread | producer-1:NetworkClient$DefaultMetadataUpdater@582] - Error while fetching metadata with correlation id 9 : {mysql-server-1.inventory.products_on_hand=LEADER_NOT_AVAILABLE}
    2016-03-16 15:21:02,896 - WARN  [kafka-producer-network-thread | producer-1:NetworkClient$DefaultMetadataUpdater@582] - Error while fetching metadata with correlation id 12 : {mysql-server-1.inventory.customers=LEADER_NOT_AVAILABLE}
    2016-03-16 15:21:03,108 - WARN  [kafka-producer-network-thread | producer-1:NetworkClient$DefaultMetadataUpdater@582] - Error while fetching metadata with correlation id 16 : {mysql-server-1.inventory.orders=LEADER_NOT_AVAILABLE}
    ....

The first line confirms that our MySQL connector started from the beginning of the binlog at position 4 (after the first 4 bytes of the binlog's header), that the connector was able to successfully connect, and that the task created by the connector was initialized and started successfully. The last four lines sound ominous, but are basically telling us that new topics were created and Kafka had to assign a new leader. Note the names of the topics:

* `mysql-server-1.inventory.products`
* `mysql-server-1.inventory.products_on_hand`
* `mysql-server-1.inventory.customers`
* `mysql-server-1.inventory.orders`

Each topic names start with `mysql-server-1`, which is the logical name we gave our connector. Each topic name also includes `inventory`, which is the name of the database. Finally, each topic name concludes with the name of one of the tables in the `inventory` database. In other words, all of the data change events describing rows in the each table appear in separate topics.

Let's look at all of the data change events in the `mysql-server-1.inventory.customers` topic. Again, we'll use the `debezium/kafka` Docker image to start a new container that connects to Kafka to watch the topic from the beginning of the topic:

    $ docker run -it --rm --link zookeeper:zookeeper debezium/kafka watch-topic -a -k mysql-server-1.inventory.customers

Again, we use the `--rm` flag since we want the container to be removed when it stops, and we use the `-a` flag on `watch-topic` to signal that we want to see _all_ events since the beginning of the topic. (If we were to remove the `-a` flag, we'd see only the events that are recorded in the topic _after_ we start watching.) The `-k` flag specifies that the output should include the event's key, which in our case contains the row's primary key. Here's the output:

    Contents of topic mysql-server-1.inventory.customers:
    {"schema":{"type":"struct","fields":[{"type":"int32","optional":false,"field":"id"}],"optional":false,"name":"inventory.customers/pk"},"payload":{"id":1001}}	{"schema":{"type":"struct","fields":[{"type":"int32","optional":false,"field":"id"},{"type":"string","optional":false,"field":"first_name"},{"type":"string","optional":false,"field":"last_name"},{"type":"string","optional":false,"field":"email"}],"optional":false,"name":"inventory.customers"},"payload":{"id":1001,"first_name":"Sally","last_name":"Thomas","email":"sally.thomas@acme.com"}}
    {"schema":{"type":"struct","fields":[{"type":"int32","optional":false,"field":"id"}],"optional":false,"name":"inventory.customers/pk"},"payload":{"id":1002}}	{"schema":{"type":"struct","fields":[{"type":"int32","optional":false,"field":"id"},{"type":"string","optional":false,"field":"first_name"},{"type":"string","optional":false,"field":"last_name"},{"type":"string","optional":false,"field":"email"}],"optional":false,"name":"inventory.customers"},"payload":{"id":1002,"first_name":"George","last_name":"Bailey","email":"gbailey@foobar.com"}}
    {"schema":{"type":"struct","fields":[{"type":"int32","optional":false,"field":"id"}],"optional":false,"name":"inventory.customers/pk"},"payload":{"id":1003}}	{"schema":{"type":"struct","fields":[{"type":"int32","optional":false,"field":"id"},{"type":"string","optional":false,"field":"first_name"},{"type":"string","optional":false,"field":"last_name"},{"type":"string","optional":false,"field":"email"}],"optional":false,"name":"inventory.customers"},"payload":{"id":1003,"first_name":"Edward","last_name":"Walker","email":"ed@walker.com"}}
    {"schema":{"type":"struct","fields":[{"type":"int32","optional":false,"field":"id"}],"optional":false,"name":"inventory.customers/pk"},"payload":{"id":1004}}	{"schema":{"type":"struct","fields":[{"type":"int32","optional":false,"field":"id"},{"type":"string","optional":false,"field":"first_name"},{"type":"string","optional":false,"field":"last_name"},{"type":"string","optional":false,"field":"email"}],"optional":false,"name":"inventory.customers"},"payload":{"id":1004,"first_name":"Anne","last_name":"Kretchmar","email":"annek@noanswer.org"}}


First, note that the utility keeps watching, so any new events would automatically appear as long as the utility keeps running. These events happen to be encoded in JSON, since that's how we configured our connector. Each event includes one JSON document for the key, and one for the value. 

Also, this `watch-topic` utility is very simple and is limited in functionality and usefulness. We use it here simply to get an understanding of the kind of events that our connector generates. Our applications would instead use Kafka consumers to consume all of the events, and those consumer libraries offer far more flexibility and power. In fact, properly configured clients enable our applications to never miss any events, even when those applications crash or shutdown gracefullly.

Back to the output events. Let's look at the fourth event's _key_ document formatted so it is easier to read:

    {
    	"schema" : {
    		"type" : "struct",
    		"fields" : [
    			{
    				"type" : "int32",
    				"optional" : false,
    				"field" : "id"
    			}],
    		"optional" : false,
    		"name" : "inventory.customers/pk"
    	},
    	"payload" : {
    		"id" : 1004
    	}
    }

The "schema" section describes the structure of the primary key, which in our case has a single field named `id` whose mandatory value is an `int32` value. The key is also mandatory and named `inventory.customers/pk`. The primary key for the row described by the event is in the "payload" section, where we see that this event is for the row identified by an `id` of `1001`.

Now let's look at the first event's _value_ document formatted so it is easier to read:

    {
    	"schema" : {
    		"type" : "struct",
    		"fields" : [
    			{
    				"type" : "int32",
    				"optional" : false,
    				"field" : "id"
    			}, {
    				"type" : "string",
    				"optional" : false,
    				"field" : "first_name"
    			}, {
    				"type" : "string",
    				"optional" : false,
    				"field" : "last_name"
    			}, {
    				"type" : "string",
    				"optional" : false,
    				"field" : "email"
    			}],
    		"optional" : false,
    		"name" : "inventory.customers"
    	},
    	"payload" : {
    		"id" : 1004,
    		"first_name" : "Anne",
    		"last_name" : "Kretchmar",
    		"email" : "annek@noanswer.org"
    	}
    }

Once again the "schema" section describes the structure of our row, and in our case contains 4 mandatory fields: `id` is of type `int32` while `first_name`, `last_name`, and `email` are of type `string`. The row itself is in the "payload" section, and here we see the actual values for the ID, first name, last name, and email.

We can compare these to the state of the database. Go back to the terminal that is running the MySQL command line client, and run the following statement:

    mysql> SELECT * FROM customers;

which produces the following output:

    +------+------------+-----------+-----------------------+
    | id   | first_name | last_name | email                 |
    +------+------------+-----------+-----------------------+
    | 1001 | Sally      | Thomas    | sally.thomas@acme.com |
    | 1002 | George     | Bailey    | gbailey@foobar.com    |
    | 1003 | Edward     | Walker    | ed@walker.com         |
    | 1004 | Anne       | Kretchmar | annek@noanswer.org    |
    +------+------------+-----------+-----------------------+
    4 rows in set (0.00 sec)

As we can see, all of our event records match the database. 

Now that we're monitoring changes, what happens when we *change* one of the records in the database? Run the following statement in the MySQL command line client:

    mysql> UPDATE customers SET first_name='Anne Marie' WHERE id=1004;

which produces the following output:

    Query OK, 1 row affected (0.05 sec)
    Rows matched: 1  Changed: 1  Warnings: 0

Rerun the `select ...` statement to see the updated table:

    mysql> select * from customers;
    +------+------------+-----------+-----------------------+
    | id   | first_name | last_name | email                 |
    +------+------------+-----------+-----------------------+
    | 1001 | Sally      | Thomas    | sally.thomas@acme.com |
    | 1002 | George     | Bailey    | gbailey@foobar.com    |
    | 1003 | Edward     | Walker    | ed@walker.com         |
    | 1004 | Anne Marie | Kretchmar | annek@noanswer.org    |
    +------+------------+-----------+-----------------------+
    4 rows in set (0.00 sec)

Now, go back to the terminal running `watch-topic` and we should see a new fifth event:

    {"schema":{"type":"struct","fields":[{"type":"int32","optional":false,"field":"id"}],"optional":false,"name":"inventory.customers/pk"},"payload":{"id":1004}}	{"schema":{"type":"struct","fields":[{"type":"int32","optional":false,"field":"id"},{"type":"string","optional":false,"field":"first_name"},{"type":"string","optional":false,"field":"last_name"},{"type":"string","optional":false,"field":"email"}],"optional":false,"name":"inventory.customers"},"payload":{"id":1004,"first_name":"Anne Marie","last_name":"Kretchmar","email":"annek@noanswer.org"}}

Let's reformat the key to be easier to read:

    {
    	"schema" : {
    		"type" : "struct",
    		"fields" : [
    			{
    				"type" : "int32",
    				"optional" : false,
    				"field" : "id"
    			}],
    		"optional" : false,
    		"name" : "inventory.customers/pk"
    	},
    	"payload" : {
    		"id" : 1004
    	}
    }

This key is exactly the same key as what we saw in the fourth record. Here's the value formatted to be easier to read:

    {
    	"schema" : {
    		"type" : "struct",
    		"fields" : [
    			{
    				"type" : "int32",
    				"optional" : false,
    				"field" : "id"
    			}, {
    				"type" : "string",
    				"optional" : false,
    				"field" : "first_name"
    			}, {
    				"type" : "string",
    				"optional" : false,
    				"field" : "last_name"
    			}, {
    				"type" : "string",
    				"optional" : false,
    				"field" : "email"
    			}],
    		"optional" : false,
    		"name" : "inventory.customers"
    	},
    	"payload" : {
    		"id" : 1004,
    		"first_name" : "Anne Marie",
    		"last_name" : "Kretchmar",
    		"email" : "annek@noanswer.org"
    	}
    }

When we compare this to the value in the fourth event, we see that the `first_name` value is now `Anne Marie`, which is the new value.

Insert and update statements look very similar, and the only way to tell them apart is to know whether the record previously existed prior to an event. Clients that need to make this distinction will likely already have this knowledge in the form of a cache or local storage.

When a row is deleted, the event contains a key that matches the row's primary (or unique) key, but the value is null. Since Anne Marie has not placed any orders, we can remove her record from our database using the MySQL command line client:

    mysql> DELETE FROM customers WHERE id=1004;

In our terminal running `watch-topic`, we see a new event:

    {"schema":{"type":"struct","fields":[{"type":"int32","optional":false,"field":"id"}],"optional":false,"name":"inventory.customers/pk"},"payload":{"id":1004}}	{"schema":null,"payload":null}

Once again, let's reformat the key to be easier to read:

    {
    	"schema" : {
    		"type" : "struct",
    		"fields" : [
    			{
    				"type" : "int32",
    				"optional" : false,
    				"field" : "id"
    			}],
    		"optional" : false,
    		"name" : "inventory.customers/pk"
    	},
    	"payload" : {
    		"id" : 1004
    	}
    }

Again, this key is exactly the same key as what we saw in the previous record. Here's the value formatted to be easier to read:

    {
    	"schema" :  null,
    	"payload" : null
    }

The value has no schema and no payload, which means the record no longer exists.


### Restart the Kafka Connect service

One feature of the Kafka Connect service is that it automatically manages tasks for the registered connectors. And, because it stores its data in Kafka, if a running service stops or goes away completely, upon restart (perhaps on another host) the server will start any non-running tasks. To demostrate this, let's stop our Kafka Connect service, change some data in the database, and restart our service. 

In a new terminal, use the following Docker commands to stop and remove the `connect` container that is running our Kafka Connect service:

    $ docker stop connect
    $ docker rm connect

Stopping the container like this stops the process running inside of it, but the Kafka Connect service handles this by gracefully shutting down. Removing the container ensures that we won't simply restart the container.

While the service is down, let's go back to the MySQL command line client and add a few records:

    mysql> INSERT INTO customers VALUES (default, "Ken", "Thompson", "kitt@acme.com");
    mysql> INSERT INTO customers VALUES (default, "Kenneth", "Anderson", "kander@acme.com");

Notice that in the terminal where we're running `watch-topic`, there's been no update. Also, we're still able to watch the topic because Kafka is still running. (In a production system, you would have enough brokers to handle the producers and consumers, and to maintain a minimum number of in sync replicas for each topic. So if enough brokers fail such that there are not the minimum number of ISRs, Kafka should become unavailable. Producers, like the Debezium connectors, and consumers will simply wait patiently for the Kafka cluster or network to recover. Yes, that means that your consumers might temporarily see no change events as data is changed in the databases, but that's because none are being produced. As soon as the Kafka cluster is restarted or the network recovers, Debezium will continue producing change events while your consumers will continue consuming events where they left off.)

Now, in a new terminal, start a new container using the _same_ command we used before:

    $ docker run -it --name connect -p 8083:8083 -e GROUP_ID=1 -e CONFIG_STORAGE_TOPIC=my-connect-configs -e OFFSET_STORAGE_TOPIC=my-connect-offsets -e ADVERTISED_HOST_NAME=$(echo $DOCKER_HOST | cut -f3  -d'/' | cut -f1 -d':') --link zookeeper:zookeeper --link kafka:kafka debezium/connect

This creates a whole new container, and since we've intialized it with the same topic information the new service can connect to Kafka, read the previous service's configuration and start the registered connectors, which will continue where they last left off.

Jump back to the terminal running `watch-topic`, and you should now see two new records we added to the MySQL database:

    {"schema":{"type":"struct","fields":[{"type":"int32","optional":false,"field":"id"}],"optional":false,"name":"inventory.customers/pk"},"payload":{"id":1005}}	{"schema":{"type":"struct","fields":[{"type":"int32","optional":false,"field":"id"},{"type":"string","optional":false,"field":"first_name"},{"type":"string","optional":false,"field":"last_name"},{"type":"string","optional":false,"field":"email"}],"optional":false,"name":"inventory.customers"},"payload":{"id":1005,"first_name":"Ken","last_name":"Thompson","email":"kitt@acme.com"}}
    {"schema":{"type":"struct","fields":[{"type":"int32","optional":false,"field":"id"}],"optional":false,"name":"inventory.customers/pk"},"payload":{"id":1006}}	{"schema":{"type":"struct","fields":[{"type":"int32","optional":false,"field":"id"},{"type":"string","optional":false,"field":"first_name"},{"type":"string","optional":false,"field":"last_name"},{"type":"string","optional":false,"field":"email"}],"optional":false,"name":"inventory.customers"},"payload":{"id":1006,"first_name":"Kenneth","last_name":"Anderson","email":"kander@acme.com"}}


### Exploration

Go ahead and use the MySQL command line client to add, modify, and remove rows to the database tables, and see the effect on the topics. You may need to start multiple `watch-topic` commands for each topic. And remember that you can't remove a row that is referenced by a foreign key. Have fun!

### Clean up

You can use Docker to stop and remove all of the running containers:

    $ docker stop connect mysql kafka zookeeper
    $ docker rm connect mysql kafka zookeeper

Then, verify that all of the other processes are stopped:

    $ docker ps -a

You can stop any of them using `docker stop <name>` or `docker stop <containerId>`.


