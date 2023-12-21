#!/bin/bash

# Exit immediately if a *pipeline* returns a non-zero status. (Add -x for command tracing)
set -e

get_broker_endpoint() {
    if [[ -z "$KAFKA_BROKER" ]]; then
        # Look for any environment variables set by Docker container linking. For example, if the container
        # running Kafka were named 'broker' in this container, then Docker should have created several envs,
        # such as 'BROKER_PORT_9092_TCP'. If so, then use that to automatically connect to the linked broker.
        export KAFKA_BROKER=$(env | grep .*PORT_9092_TCP= | sed -e 's|.*tcp://||' | uniq | paste -sd ,)
    fi
    if [[ "x$KAFKA_BROKER" = "x" ]]; then
        export KAFKA_BROKER=0.0.0.0:9092
    fi
    echo "Using KAFKA_BROKER=$KAFKA_BROKER"
}

if [[ -z "$NODE_ID" ]]; then
    if [[ -z "$BROKER_ID" ]]; then
        NODE_ID=1
        echo "WARNING: Using default NODE_ID=1, which is valid only for non-clustered installations."
    else
        NODE_ID="$BROKER_ID"
        echo "WARNING: Using NODE_ID=$BROKER_ID, as specified via BROKER_ID variable. Please update your configuration to use the NODE_ID variable instead."
    fi
fi

# ZooKeeper mode
if [[ -z "$CLUSTER_ID" ]]; then
    CONFIG_FILE=config/server.properties
    echo "Starting in ZooKeeper mode using NODE_ID=$NODE_ID."

    if [[ -z "$ZOOKEEPER_CONNECT" ]]; then
        # Look for any environment variables set by Docker container linking. For example, if the container
        # running Zookeeper were named 'zoo' in this container, then Docker should have created several envs,
        # such as 'ZOO_PORT_2181_TCP'. If so, then use that to automatically set the 'zookeeper.connect' property.
        export ZOOKEEPER_CONNECT=$(env | grep .*PORT_2181_TCP= | sed -e 's|.*tcp://||' | uniq | paste -sd ,)
    fi
    if [[ "x$ZOOKEEPER_CONNECT" = "x" ]]; then
        export ZOOKEEPER_CONNECT=0.0.0.0:2181
    fi
    echo "Using ZOOKEEPER_CONNECT=$ZOOKEEPER_CONNECT"

# KRaft mode
else

    if [[ -z "$NODE_ROLE" ]]; then
        NODE_ROLE='combined';
    fi

    case "$NODE_ROLE" in
     'combined' ) CONFIG_FILE=config/kraft/server.properties;;
     'broker' ) CONFIG_FILE=config/kraft/broker.properties;;
     'controller' ) CONFIG_FILE=config/kraft/controller.properties;;
     *) CONFIG_FILE=config/kraft/server.properties;;
    esac

    echo "Starting in KRaft mode (EXPERIMENTAL), using CLUSTER_ID=$CLUSTER_ID, NODE_ID=$NODE_ID and NODE_ROLE=$NODE_ROLE."
fi

echo "Using configuration $CONFIG_FILE."

if [[ -n "$HEAP_OPTS" ]]; then
    sed -r -i "s/^(export KAFKA_HEAP_OPTS)=\"(.*)\"/\1=\"${HEAP_OPTS}\"/g" $KAFKA_HOME/bin/kafka-server-start.sh
    unset HEAP_OPTS
fi

export KAFKA_ZOOKEEPER_CONNECT=$ZOOKEEPER_CONNECT
export KAFKA_NODE_ID=$NODE_ID
export KAFKA_BROKER_ID=$NODE_ID
export KAFKA_LOG_DIRS="${KAFKA_DATA}/$KAFKA_NODE_ID"
mkdir -p $KAFKA_LOG_DIRS
unset NODE_ID
unset ZOOKEEPER_CONNECT

if [[ -z "$ADVERTISED_PORT" ]]; then
    ADVERTISED_PORT=9092
fi
if [[ -z "$HOST_NAME" ]]; then
    HOST_NAME=$(ip addr | grep 'BROADCAST' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')
fi

: ${PORT:=9092}
: ${ADVERTISED_PORT:=9092}
: ${CONTROLLER_PORT:=9093}

: ${ADVERTISED_PORT:=${PORT}}
: ${ADVERTISED_HOST_NAME:=${HOST_NAME}}

: ${KAFKA_ADVERTISED_PORT:=${ADVERTISED_PORT}}
: ${KAFKA_ADVERTISED_HOST_NAME:=${ADVERTISED_HOST_NAME}}

: ${KAFKA_PORT:=${PORT}}
: ${KAFKA_HOST_NAME:=${HOST_NAME}}

if [[ -z "$CLUSTER_ID" ]]; then
    : ${KAFKA_LISTENERS:=PLAINTEXT://$KAFKA_HOST_NAME:$KAFKA_PORT}
else
    case "$NODE_ROLE" in
     'combined' ) : ${KAFKA_LISTENERS:=PLAINTEXT://$KAFKA_HOST_NAME:$KAFKA_PORT,CONTROLLER://$KAFKA_HOST_NAME:$CONTROLLER_PORT};;
     'broker' ) : ${KAFKA_LISTENERS:=PLAINTEXT://$KAFKA_HOST_NAME:$KAFKA_PORT};;
     'controller' ) : ${KAFKA_LISTENERS:=PLAINTEXT://$KAFKA_HOST_NAME:$CONTROLLER_PORT};;
     *) : ${KAFKA_LISTENERS:=PLAINTEXT://$KAFKA_HOST_NAME:$KAFKA_PORT,CONTROLLER://$KAFKA_HOST_NAME:$CONTROLLER_PORT};;
    esac
fi

: ${KAFKA_ADVERTISED_LISTENERS:=PLAINTEXT://$KAFKA_ADVERTISED_HOST_NAME:$KAFKA_ADVERTISED_PORT}

export KAFKA_LISTENERS KAFKA_ADVERTISED_LISTENERS
unset HOST_NAME ADVERTISED_HOST_NAME KAFKA_HOST_NAME KAFKA_ADVERTISED_HOST_NAME PORT ADVERTISED_PORT KAFKA_PORT KAFKA_ADVERTISED_PORT CONTROLLER_PORT NODE_ROLE

echo "Using KAFKA_LISTENERS=$KAFKA_LISTENERS and KAFKA_ADVERTISED_LISTENERS=$KAFKA_ADVERTISED_LISTENERS"

#
# Set up the JMX options
#
: ${JMXAUTH:="false"}
: ${JMXSSL:="false"}
if [[ -n "$JMXPORT" && -n "$JMXHOST" ]]; then
    echo "Enabling JMX on ${JMXHOST}:${JMXPORT}"
    export KAFKA_JMX_OPTS="-Djava.rmi.server.hostname=${JMXHOST} -Dcom.sun.management.jmxremote.rmi.port=${JMXPORT} -Dcom.sun.management.jmxremote.port=${JMXPORT} -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=${JMXAUTH} -Dcom.sun.management.jmxremote.ssl=${JMXSSL} "
fi

# Copy config files if not provided in volume
cp -rn $KAFKA_HOME/config.orig/* $KAFKA_HOME/config

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

        # Add missing EOF at the end of the config file
        echo "" >> $KAFKA_HOME/$CONFIG_FILE

        #
        # Process all environment variables that start with 'KAFKA_' (but not 'KAFKA_HOME' or 'KAFKA_VERSION'):
        #
        for VAR in `env`
        do
          env_var=`echo "$VAR" | sed "s/=.*//"`
          if [[ $env_var =~ ^KAFKA_ && $env_var != "KAFKA_VERSION" && $env_var != "KAFKA_HOME"  && $env_var != "KAFKA_LOG4J_OPTS" && $env_var != "KAFKA_JMX_OPTS" ]]; then
            prop_name=`echo "$VAR" | sed -r "s/^KAFKA_(.*)=.*/\1/g" | tr '[:upper:]' '[:lower:]' | tr _ .`
            if egrep -q "(^|^#)$prop_name=" $KAFKA_HOME/$CONFIG_FILE; then
                #note that no config names or values may contain an '@' char
                sed -r -i "s%(^|^#)($prop_name)=(.*)%\2=${!env_var}%g" $KAFKA_HOME/$CONFIG_FILE
            else
                #echo "Adding property $prop_name=${!env_var}"
                echo "$prop_name=${!env_var}" >> $KAFKA_HOME/$CONFIG_FILE
            fi
          fi
        done

        if [[ -n $CREATE_TOPICS ]]; then
            echo "Creating topics: $CREATE_TOPICS"
            # Start a subshell in the background that waits for the Kafka broker to open socket on port 9092 and
            # then creates the topics when the broker is running and able to receive connections ...
            (
                echo "STARTUP: Waiting for Kafka broker to open socket on port 9092 ..."
                while ss -n | awk '$5 ~ /:9092$/ {exit 1}'; do sleep 1; done
                echo "START: Found running Kafka broker on port 9092, so creating topics ..."
                IFS=','; for topicToCreate in $CREATE_TOPICS; do
                    # remove leading and trailing whitespace ...
                    topicToCreate="$(echo ${topicToCreate} | xargs )"
                    IFS=':' read -a topicConfig <<< "$topicToCreate"
                    config=
                    if [ -n "${topicConfig[3]}" ]; then
                        config="--config=cleanup.policy=${topicConfig[3]}"
                    fi
                    get_broker_endpoint
                    echo "STARTUP: Creating topic ${topicConfig[0]} with ${topicConfig[1]} partitions and ${topicConfig[2]} replicas with cleanup policy ${topicConfig[3]}..."
                    $KAFKA_HOME/bin/kafka-topics.sh --create --bootstrap-server $KAFKA_BROKER --replication-factor ${topicConfig[2]} --partitions ${topicConfig[1]} --topic "${topicConfig[0]}" ${config}
                done
            )&
        fi

        if [[ ! -z "$CLUSTER_ID" && ! -f "$KAFKA_LOG_DIRS/meta.properties" ]]; then
                echo "No meta.properties found in $KAFKA_LOG_DIRS; going to format the directory"

                $KAFKA_HOME/bin/kafka-storage.sh format -t $CLUSTER_ID -c $KAFKA_HOME/$CONFIG_FILE
        fi

        exec $KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/$CONFIG_FILE
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
        get_broker_endpoint
        echo "Contents of topic $TOPICNAME:"
        exec $KAFKA_HOME/bin/kafka-console-consumer.sh --bootstrap-server $KAFKA_BROKER --property print.key=$PRINT_KEY --property fetch.min.bytes=$FETCH_MIN_BYTES --topic "$TOPICNAME" $FROM_BEGINNING $@
        ;;
    create-topic)
        shift
        PARTITION=1
        REPLICAS=1
        CLEANUP_POLICY=delete
        while getopts :p:r:c: option; do
            case ${option} in
                p)
                    PARTITION=$OPTARG
                    ;;
                r)
                    REPLICAS=$OPTARG
                    ;;
                c)
                    CLEANUP_POLICY=$OPTARG
                    ;;
                h|\?)
                    echo "Usage:   create-topic [-p numPartitions] [-r numReplicas] [-c cleanupPolicy] topicname"
                    echo ""
                    echo "where"
                    echo ""
                    echo "    -p numPartitions   Create the topic with the specified number of partitions."
                    echo "                       By default, the topic is created with only one partition."
                    echo "    -r numReplicas     Create the topic with the specified number of replicas."
                    echo "                       By default, the topic is created with only one replica."
                    echo "                       The number of replicas may not be larger than the number"
                    echo "                       of brokers."
                    echo "    -c cleanupPolicy   Create the topic with the specified cleanup policy."
                    echo "                       By default, the topic is created with delete cleanup policy."
                    echo "    topicname          The required name of the new topic."
                    exit 1;
                    ;;
            esac
        done
        get_broker_endpoint
        shift $((OPTIND -1))
        if [[ -z $1 ]]; then
            echo "ERROR: A topic name must be specified"
            exit 1;
        fi
        TOPICNAME=$1
        echo "Creating new topic $TOPICNAME with $PARTITION partition(s), $REPLICAS replica(s) and cleanup policy set to $CLEANUP_POLICY..."
        exec $KAFKA_HOME/bin/kafka-topics.sh --create --bootstrap-server $KAFKA_BROKER --replication-factor $REPLICAS --partitions $PARTITION --topic "$TOPICNAME" --config=cleanup.policy=$CLEANUP_POLICY
        ;;
    list-topics)
        echo "Listing topics..."
        get_broker_endpoint
        exec $KAFKA_HOME/bin/kafka-topics.sh --list --bootstrap-server $KAFKA_BROKER
        ;;

esac

# Otherwise just run the specified command
exec "$@"
