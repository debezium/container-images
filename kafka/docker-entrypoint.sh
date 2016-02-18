#!/bin/bash

usage() {
    echo "When a container is started, it can be run with several commands. The following command"
    echo "will start a Kafka broker:"
    echo ""
    echo "    start"
    echo ""
    echo "while the following command can be used when attaching to a running container to create a new topic:"
    echo ""
    echo "    create-topic [-p numPartitions] [-r numReplicas] topic"
    echo ""
    echo "where 'topic' is the name of the new topic, 'numPartitions' is the number of partitions within"
    echo "the new topic, and 'numReplicas' is the number of replicas for each partition within the"
    echo "new topic. The default for both 'numPartitions' and 'numReplicas' is '1'."
    echo ""
    echo "The following command can be used when attaching to a running container to watch an existing topic:"
    echo ""
    echo "    watch-topic [-a] topicName"
    echo ""
    echo "This help message is displayed with the following command:"
    echo ""
    echo "    help"
    echo ""
    echo "Finally, the container can run arbitrary commands. For example, to start a new container"
    echo "or attach to a running container and obtain a bash shell:"
    echo ""
    echo "    bash"
    echo ""
    echo "If none of these are used, then the container will start the Kafka broker."
    echo ""
    echo ""
    echo "Environment variables"
    echo "---------------------"
    echo ""
    echo "You can pass multiple environment variables to alter the Kafka configuration:"
    echo ""
    echo "   BROKER_ID                 Recommended. Set this to the unique and persistent number for the broker."
    echo "                             This must be set for every broker in a Kafka cluster, and should be"
    echo "                             set for a single standalone broker. The default is '1', and setting this"
    echo "                             will update the Kafka configuration."
    echo "   ZOOKEEPER_CONNECT         Recommended. Set this to a string described in the Kafka documentation"
    echo "                             for the 'zookeeper.connect' property so that the Kafka broker can find the"
    echo "                             Zookeeper service. If this container is started with a link to another"
    echo "                             container running Zookeeper on port 2181, then this environment"
    echo "                             variable need not be set since it can be determined automatically."
    echo "                             Otherwise, it should be set with an explicit value. Setting this"
    echo "                             will update the Kafka configuration."
    echo "   HEAP_OPTS                 Recommended. Use this to set the JVM options for the Kafka broker."
    echo "                             By default a value of '-Xmx1G -Xms1G' is used, meaning that each"
    echo "                             Kafka broker uses 1GB of memory. Using too little memory may cause"
    echo "                             performance problems, while using too much may prevent the broker"
    echo "                             from starting properly given the memory available on the machine."
    echo "   CREATE_TOPICS             Optional. Use this to specify the topics that should be created"
    echo "                             as soon as the broker starts. The value should either be a comma-separated"
    echo "                             list of topics, partitions, and replicas. For example, a single value"
    echo "                             'topic1:1:2,topic2:3:1' or the array will create 'topic1' with 1 partition and"
    echo "                             2 replicas, and 'topic2' with 3 partitions and 1 replica."
    echo "   LOG_LEVEL                 Optional. Set the level of detail for Zookeeper's application log"
    echo "                             written to STDOUT and STDERR. Valid values are 'INFO' (default), 'WARN',"
    echo "                             'ERROR', 'DEBUG', or 'TRACE'."
    echo ""
    echo "Environment variables that start with 'KAFKA_' will be used to update the Kafka configuration file."
    echo "Each environment variable name will be mapped to a configuration property name by:"
    echo ""
    echo "  1. removing the 'KAFKA_' prefix;"
    echo "  2. lowercasing all characters; and"
    echo "  3. converting all '_' characters to '.' characters"
    echo ""                  
    echo "For example, the environment variable 'KAFKA_ADVERTISED_HOST_NAME' is converted to the"
    echo "'advertised.host.name' property, while 'KAFKA_AUTO_CREATE_TOPICS_ENABLE' is converted to"
    echo "the 'auto.create.topics.enable' property. The container will then update the Kafka configuration"
    echo "file to include the property's name and value."
    echo ""
    echo "The value of the environment variable may not contain a '\@' character."
    echo ""
    echo ""
    echo "Volumes"
    echo "-------"
    echo ""
    echo "The container exposes two volumes:"
    echo ""
    echo "  /kafka/data     The broker writes all persisted data as files within this directory"
    echo "                  inside a subdirectory named with the value of BROKER_ID (see above)."
    echo "                  Mount it appropriately when running your container to persist the data"
    echo "                  after the container is stopped."
    echo ""
    echo "  /kafka/logs     The broker places its application log files within this directory."
    echo ""
    echo "  /kafka/config   The directory for the broker's configuration files."
    echo ""
}

# Exit immediately if a *pipeline* returns a non-zero status. (Add -x for command tracing)
set -e

if [[ -z "$BROKER_ID" ]]; then
    BROKER_ID=1
    echo "WARNING: Using default BROKER_ID=1, which is valid only for non-clustered installations."
fi
if [[ -z "$ZOOKEEPER_CONNECT" ]]; then
    # Look for any environment variables set by Docker container linking. For example, if the container
    # running Zookeeper were named 'zoo' in this container, then Docker should have created several envs,
    # such as 'ZOO_PORT_2181_TCP'. If so, then use that to automatically set the 'zookeeper.connect' property.
    export ZOOKEEPER_CONNECT=$(env | grep .*PORT_2181_TCP= | sed -e 's|.*tcp://||' | uniq | paste -sd ,)
fi
if [[ "x$ZOOKEEPER_CONNECT" = "x" ]]; then
    echo "The ZOOKEEPER_CONNECT variable must be set, or the container must be linked to one that runs Zookeeper."
    exit 1
else
    echo "Using ZOOKEEPER_CONNECT=$ZOOKEEPER_CONNECT"
fi
if [[ -n "$HEAP_OPTS" ]]; then
    sed -r -i "s/^(export KAFKA_HEAP_OPTS)=\"(.*)\"/\1=\"${KAFKA_HEAP_OPTS}\"/g" $KAFKA_HOME/bin/kafka-server-start.sh
    unset HEAP_OPTS
fi

export KAFKA_ZOOKEEPER_CONNECT=$ZOOKEEPER_CONNECT
export KAFKA_BROKER_ID=$BROKER_ID
export KAFKA_LOG_DIRS="$KAFKA_HOME/data/$KAFKA_BROKER_ID"
mkdir -p $KAFKA_LOG_DIRS

if [[ -z "$KAFKA_ADVERTISED_PORT" ]]; then
    export KAFKA_ADVERTISED_PORT=9092
fi
if [[ -z "$KAFKA_ADVERTISED_HOST_NAME" ]]; then
    export KAFKA_ADVERTISED_HOST_NAME=$(ip addr | grep 'BROADCAST' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')
fi
echo "Using KAFKA_ADVERTISED_PORT=$KAFKA_ADVERTISED_PORT"
echo "Using KAFKA_ADVERTISED_HOST_NAME=$KAFKA_ADVERTISED_HOST_NAME"

# Process the argument to this container ...
case $1 in
    start)
        #
        # Configure the log files ...
        #
        if [[ -z "$LOG_LEVEL" ]]; then
            LOG_LEVEL="INFO"
        fi
        sed -i -r -e "s|=INFO, stdout|=$LOG_LEVEL, stdout|g" $KAFKA_HOME/config/log4j.properties
        sed -i -r -e "s|^(log4j.appender.stdout.threshold)=.*|\1=${LOG_LEVEL}|g" $KAFKA_HOME/config/log4j.properties
        export KAFKA_LOG4J_OPTS="-Dlog4j.configuration=file:$KAFKA_HOME/config/log4j.properties"
        
        #
        # Process all environment variables that start with 'KAFKA_' (but not 'KAFKA_HOME' or 'KAFKA_VERSION'):
        #
        for VAR in `env`
        do
          env_var=`echo "$VAR" | sed -r "s/(.*)=.*/\1/g"`
          if [[ $env_var =~ ^KAFKA_ && $env_var != "KAFKA_VERSION" && $env_var != "KAFKA_HOME" ]]; then
            prop_name=`echo "$VAR" | sed -r "s/^KAFKA_(.*)=.*/\1/g" | tr '[:upper:]' '[:lower:]' | tr _ .`
            if egrep -q "(^|^#)$prop_name=" $KAFKA_HOME/config/server.properties; then
                #note that no config names or values may contain an '@' char
                sed -r -i "s@(^|^#)($prop_name)=(.*)@\2=${!env_var}@g" $KAFKA_HOME/config/server.properties
            else
                #echo "Adding property $prop_name=${!env_var}"
                echo "$prop_name=${!env_var}" >> $KAFKA_HOME/config/server.properties
            fi
          fi
        done
        
        if [[ -n $CREATE_TOPICS ]]; then
            echo "Creating topics: $CREATE_TOPICS"
            # Start a subshell in the background that waits for the Kafka broker to open socket on port 9092 and 
            # then creates the topics when the broker is running and able to receive connections ...
            (
                echo "STARTUP: Waiting for Kafka broker to open socket on port 9092 ..."
                while ss | awk '$5 ~ /:9092$/ {exit 1}'; do sleep 1; done
                echo "START: Found running Kafka broker on port 9092, so creating topics ..."
                IFS=','; for topicToCreate in $CREATE_TOPICS; do
                    # remove leading and trailing whitespace ...
                    topicToCreate="$(echo ${topicToCreate} | xargs )"
                    IFS=':' read -a topicConfig <<< "$topicToCreate"
                    echo "STARTUP: Creating topic ${topicConfig[0]} with ${topicConfig[1]} partitions and ${topicConfig[2]} replicas ..."
                    $KAFKA_HOME/bin/kafka-topics.sh --create --zookeeper $KAFKA_ZOOKEEPER_CONNECT --replication-factor ${topicConfig[2]} --partition ${topicConfig[1]} --topic "${topicConfig[0]}"
                done
            )&
        fi
        exec $KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties
        ;;
    watch-topic)
        shift
        FROM_BEGINNING=""
        while getopts :a option; do
            case ${option} in
                a)
                    FROM_BEGINNING="--from-beginning"
                    ;;
                h|\?)
                    usage; exit 1;
                    ;;
            esac
        done
        shift $((OPTIND -1))
        if [[ -z $1 ]]; then
            echo "ERROR: A topic name must be specified"
            usage; exit 1;
        fi    
        TOPICNAME=$1
        shift
        echo "Contents of topic $TOPICNAME:"
        exec $KAFKA_HOME/bin/kafka-console-consumer.sh --zookeeper $KAFKA_ZOOKEEPER_CONNECT --topic "$TOPICNAME" $FROM_BEGINNING $@
        ;;
    create-topic)
        shift
        PARTITION=1
        REPLICAS=1
        while getopts :p:r: option; do
            case ${option} in
                p)
                    PARTITION=$OPTARG
                    ;;
                r)
                    REPLICAS=$OPTARG
                    ;;
                h|\?)
                    usage; exit 1;
                    ;;
            esac
        done
        shift $((OPTIND -1))
        if [[ -z $1 ]]; then
            echo "ERROR: A topic name must be specified"
            usage; exit 1;
        fi    
        TOPICNAME=$1
        echo "Creating new topic $TOPICNAME with $PARTITION partition(s) and $REPLICAS replica(s)..."
        exec $KAFKA_HOME/bin/kafka-topics.sh --create --zookeeper $KAFKA_ZOOKEEPER_CONNECT --replication-factor $REPLICAS --partition $PARTITION --topic "$TOPICNAME"
        ;;
    help)
        usage; exit 1;
        ;;
esac

# Otherwise just run the specified command
exec "$@"
