#!/bin/bash

# Exit immediately if a *pipeline* returns a non-zero status. (Add -x for command tracing)
set -e

if [[ -z "$BOOTSTRAP_SERVERS" ]]; then
    # Look for any environment variables set by Docker container linking. For example, if the container
    # running Kafka were aliased to 'kafka' in this container, then Docker should have created several envs,
    # such as 'KAFKA_PORT_9092_TCP'. If so, then use that to automatically set the 'bootstrap.servers' property.
    BOOTSTRAP_SERVERS=$(env | grep .*PORT_9092_TCP= | sed -e 's|.*tcp://||' | uniq | paste -sd ,)
fi
if [[ -z "$HOST_NAME" ]]; then
    HOST_NAME=$(ip addr | grep 'BROADCAST' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')
fi

: ${REST_PORT:=8083}
: ${ADVERTISED_PORT:=9092}
: ${ADVERTISED_HOST_NAME:=$HOST_NAME}
: ${GROUP_ID:=1}
: ${OFFSET_FLUSH_INTERVAL_MS:=60000}
: ${OFFSET_FLUSH_TIMEOUT_MS:=5000}
: ${SHUTDOWN_TIMEOUT:=10000}
: ${KEY_CONVERTER:=org.apache.kafka.connect.json.JsonConverter}
: ${VALUE_CONVERTER:=org.apache.kafka.connect.json.JsonConverter}
: ${INTERNAL_KEY_CONVERTER:=org.apache.kafka.connect.json.JsonConverter}
: ${INTERNAL_VALUE_CONVERTER:=org.apache.kafka.connect.json.JsonConverter}
export CONNECT_REST_ADVERTISED_PORT=$ADVERTISED_PORT
export CONNECT_REST_ADVERTISED_HOST_NAME=$ADVERTISED_HOST_NAME
export CONNECT_REST_PORT=$REST_PORT
export CONNECT_REST_HOST_NAME=$HOST_NAME
export CONNECT_BOOTSTRAP_SERVERS=$BOOTSTRAP_SERVERS
export CONNECT_GROUP_ID=$GROUP_ID
export CONNECT_CONFIG_STORAGE_TOPIC=$CONFIG_STORAGE_TOPIC
export CONNECT_OFFSET_STORAGE_TOPIC=$OFFSET_STORAGE_TOPIC
export CONNECT_KEY_CONVERTER=$KEY_CONVERTER
export CONNECT_VALUE_CONVERTER=$VALUE_CONVERTER
export CONNECT_INTERNAL_KEY_CONVERTER=$INTERNAL_KEY_CONVERTER
export CONNECT_INTERNAL_VALUE_CONVERTER=$INTERNAL_VALUE_CONVERTER
export CONNECT_TASK_SHUTDOWN_GRACEFUL_TIMEOUT_MS=$SHUTDOWN_TIMEOUT
export CONNECT_OFFSET_FLUSH_INTERVAL_MS=$OFFSET_FLUSH_INTERVAL_MS
export CONNECT_OFFSET_FLUSH_TIMEOUT_MS=$OFFSET_FLUSH_TIMEOUT_MS
if [[ -n "$HEAP_OPTS" ]]; then
    export KAFKA_HEAP_OPTS=$HEAP_OPTS
fi
unset HOST_NAME
unset REST_PORT
unset REST_HOST_NAME
unset ADVERTISED_HOST_PORT
unset ADVERTISED_HOST_NAME
unset GROUP_ID
unset OFFSET_FLUSH_INTERVAL_MS
unset OFFSET_FLUSH_TIMEOUT_MS
unset SHUTDOWN_TIMEOUT
unset KEY_CONVERTER
unset VALUE_CONVERTER
unset INTERNAL_KEY_CONVERTER
unset INTERNAL_VALUE_CONVERTER
unset HEAP_OPTS
unset MD5HASH
unset SCALA_VERSION

#
# Set up the classpath with all the plugins ...
#
for pluginDir in $KAFKA_CONNECT_PLUGINS_DIR/*/ ; do
    echo "Using plugin at $pluginDir"
    CLASSPATH=$CLASSPATH:$pluginDir*
done
export CLASSPATH
echo "Complete classpath: $CLASSPATH"

#
# Set up the JMX options
#
: ${JMXAUTH:="false"}
: ${JMXSSL:="false"}
if [[ -n "$JMXPORT" && -n "$JMXHOST" ]]; then
    echo "Enabling JMX on ${JMXHOST}:${JMXPORT}"
    export KAFKA_JMX_OPTS="-Djava.rmi.server.hostname=${JMXHOST} -Dcom.sun.management.jmxremote.rmi.port=${JMXPORT} -Dcom.sun.management.jmxremote.port=${JMXPORT} -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=${JMXAUTH} -Dcom.sun.management.jmxremote.ssl=${JMXSSL} "
fi

#
# Make sure the directory for logs exists ...
#
mkdir -p $KAFKA_HOME/data/$KAFKA_BROKER_ID

# Process the argument to this container ...
case $1 in
    start)
        if [[ "x$CONNECT_BOOTSTRAP_SERVERS" = "x" ]]; then
            echo "The BOOTSTRAP_SERVERS variable must be set, or the container must be linked to one that runs Kafka."
            exit 1
        fi

        if [[ "x$CONNECT_GROUP_ID" = "x" ]]; then
            echo "The GROUP_ID must be set to an ID that uniquely identifies the Kafka Connect cluster these workers belong to."
            echo "Ensure this is unique for all groups that work with a Kafka cluster."
            exit 1
        fi

        if [[ "x$CONNECT_CONFIG_STORAGE_TOPIC" = "x" ]]; then
            echo "The CONFIG_STORAGE_TOPIC variable must be set to the name of the topic where connector configurations will be stored."
            echo "This topic must have a single partition and be highly replicated (e.g., 3x or more)."
            exit 1
        fi

        if [[ "x$CONNECT_OFFSET_STORAGE_TOPIC" = "x" ]]; then
            echo "The OFFSET_STORAGE_TOPIC variable must be set to the name of the topic where connector offsets will be stored."
            echo "This topic should have many partitions (e.g., 25 or 50) and be highly replicated (e.g., 3x or more)."
            exit 1
        fi

        echo "Using the following environment variables:"
        echo "      GROUP_ID=$CONNECT_GROUP_ID"
        echo "      CONFIG_STORAGE_TOPIC=$CONNECT_CONFIG_STORAGE_TOPIC"
        echo "      OFFSET_STORAGE_TOPIC=$CONNECT_OFFSET_STORAGE_TOPIC"
        echo "      BOOTSTRAP_SERVERS=$CONNECT_BOOTSTRAP_SERVERS"
        echo "      REST_HOST_NAME=$CONNECT_REST_HOST_NAME"
        echo "      REST_PORT=$CONNECT_REST_PORT"
        echo "      ADVERTISED_HOST_NAME=$CONNECT_REST_ADVERTISED_HOST_NAME"
        echo "      ADVERTISED_PORT=$CONNECT_REST_ADVERTISED_PORT"
        echo "      KEY_CONVERTER=$CONNECT_KEY_CONVERTER"
        echo "      VALUE_CONVERTER=$CONNECT_VALUE_CONVERTER"
        echo "      INTERNAL_KEY_CONVERTER=$CONNECT_INTERNAL_KEY_CONVERTER"
        echo "      INTERNAL_VALUE_CONVERTER=$CONNECT_INTERNAL_VALUE_CONVERTER"
        echo "      OFFSET_FLUSH_INTERVAL_MS=$CONNECT_OFFSET_FLUSH_INTERVAL_MS"
        echo "      OFFSET_FLUSH_TIMEOUT_MS=$KCONNECT_OFFSET_FLUSH_TIMEOUT_MS"
        echo "      SHUTDOWN_TIMEOUT=$CONNECT_TASK_SHUTDOWN_GRACEFUL_TIMEOUT_MS"

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
          if [[ $env_var =~ ^CONNECT ]]; then
            prop_name=`echo "$VAR" | sed -r "s/^CONNECT_(.*)=.*/\1/g" | tr '[:upper:]' '[:lower:]' | tr _ .`
            if egrep -q "(^|^#)$prop_name=" $KAFKA_HOME/config/connect-distributed.properties; then
                #note that no config names or values may contain an '@' char
                sed -r -i "s@(^|^#)($prop_name)=(.*)@\2=${!env_var}@g" $KAFKA_HOME/config/connect-distributed.properties
            else
                #echo "Adding property $prop_name=${!env_var}"
                echo "$prop_name=${!env_var}" >> $KAFKA_HOME/config/connect-distributed.properties
            fi
            echo "--- Setting property from $env_var: $prop_name=${!env_var}"
          fi
        done

        #
        # Execute the Kafka Connect distributed service, replacing this shell process with the specified program ...
        #        
        exec $KAFKA_HOME/bin/connect-distributed.sh $KAFKA_HOME/config/connect-distributed.properties
        ;;
esac

# Otherwise just run the specified command
exec "$@"
