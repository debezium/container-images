#!/bin/bash

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
unset BROKER_ID
unset ZOOKEEPER_CONNECT

if [[ -z "$ADVERTISED_PORT" ]]; then
    ADVERTISED_PORT=9092
fi
if [[ -z "$HOST_NAME" ]]; then
    HOST_NAME=$(ip addr | grep 'BROADCAST' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')
fi

: ${PORT:=9092}
: ${ADVERTISED_PORT:=9092}
: ${ADVERTISED_HOST_NAME:=$HOST_NAME}
export KAFKA_ADVERTISED_PORT=$ADVERTISED_PORT
export KAFKA_ADVERTISED_HOST_NAME=$ADVERTISED_HOST_NAME
export KAFKA_PORT=$PORT
export KAFKA_HOST_NAME=$HOST_NAME
unset PORT
unset HOST_NAME
unset ADVERTISED_HOST_PORT
unset ADVERTISED_HOST_NAME
echo "Using KAFKA_ADVERTISED_PORT=$KAFKA_ADVERTISED_PORT"
echo "Using KAFKA_ADVERTISED_HOST_NAME=$KAFKA_ADVERTISED_HOST_NAME"

#
# Set up the JMX options
#
: ${JMXAUTH:="false"}
: ${JMXSSL:="false"}
if [[ -n "$JMXPORT" && -n "$JMXHOST" ]]; then
    echo "Enabling JMX on ${JMXHOST}:${JMXPORT}"
    export KAFKA_JMX_OPTS="-Djava.rmi.server.hostname=${JMXHOST} -Dcom.sun.management.jmxremote.rmi.port=${JMXPORT} -Dcom.sun.management.jmxremote.port=${JMXPORT} -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=${JMXAUTH} -Dcom.sun.management.jmxremote.ssl=${JMXSSL} "
fi

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
        unset LOG_LEVEL
        
        #
        # Process all environment variables that start with 'KAFKA_' (but not 'KAFKA_HOME' or 'KAFKA_VERSION'):
        #
        for VAR in `env`
        do
          env_var=`echo "$VAR" | sed -r "s/(.*)=.*/\1/g"`
          if [[ $env_var =~ ^KAFKA_ && $env_var != "KAFKA_VERSION" && $env_var != "KAFKA_HOME"  && $env_var != "KAFKA_LOG4J_OPTS" && $env_var != "KAFKA_JMX_OPTS" ]]; then
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
        FETCH_MIN_BYTES=1
        PRINT_KEY="false"
        while getopts :akm: option; do
            case ${option} in
                a)
                    FROM_BEGINNING="--from-beginning"
                    ;;
                k)
                    PRINT_KEY="true"
                    ;;
                m)
                    FETCH_MIN_BYTES=$OPTARG
                    ;;
                h|\?)
                    echo "Usage:   watch-topic [-a] [-k] [-m minBytes] topicname"
                    echo ""
                    echo "where"
                    echo ""
                    echo "    -a              Consume all messages from the beginning of the topic."
                    echo "                    By default, this starts consuming messages starting at the"
                    echo "                    time this utility connects."
                    echo "    -k              Display the key with the value. By default, the key will"
                    echo "                    not be displayed."
                    echo "    -m minBytes     Fetch messages only when doing so will consume at least"
                    echo "                    the specified number of bytes. Defaults to '1'."
                    echo "    topicname       The required name of the topic to watch."
                    exit 1;
                    ;;
            esac
        done
        shift $((OPTIND -1))
        if [[ -z $1 ]]; then
            echo "ERROR: A topic name must be specified"
            exit 1;
        fi    
        TOPICNAME=$1
        shift
        echo "Contents of topic $TOPICNAME:"
        exec $KAFKA_HOME/bin/kafka-console-consumer.sh --zookeeper $KAFKA_ZOOKEEPER_CONNECT --property print.key=$PRINT_KEY --property fetch.min.bytes=$FETCH_MIN_BYTES --topic "$TOPICNAME" $FROM_BEGINNING $@
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
                    echo "Usage:   create-topic [-p numPartitions] [-r numReplicas] topicname"
                    echo ""
                    echo "where"
                    echo ""
                    echo "    -p numPartitions   Create the topic with the specified number of partitions."
                    echo "                       By default, the topic is created with only one partition."
                    echo "    -r numReplicas     Create the topic with the specified number of replicas."
                    echo "                       By default, the topic is created with only one replica."
                    echo "                       The number of replicas may not be larger than the number"
                    echo "                       of brokers."
                    echo "    topicname          The required name of the new topic."
                    exit 1;
                    ;;
            esac
        done
        shift $((OPTIND -1))
        if [[ -z $1 ]]; then
            echo "ERROR: A topic name must be specified"
            exit 1;
        fi    
        TOPICNAME=$1
        echo "Creating new topic $TOPICNAME with $PARTITION partition(s) and $REPLICAS replica(s)..."
        exec $KAFKA_HOME/bin/kafka-topics.sh --create --zookeeper $KAFKA_ZOOKEEPER_CONNECT --replication-factor $REPLICAS --partition $PARTITION --topic "$TOPICNAME"
        ;;
    list-topics)
        echo "Listing topics..."
        exec $KAFKA_HOME/bin/kafka-topics.sh --list --zookeeper $KAFKA_ZOOKEEPER_CONNECT
        ;;

esac

# Otherwise just run the specified command
exec "$@"
