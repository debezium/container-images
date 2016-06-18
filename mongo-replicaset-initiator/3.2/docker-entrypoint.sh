#!/bin/bash

# Exit immediately if a *pipeline* returns a non-zero status. (Add -x for command tracing)
set -e

# The monto primary node should be accessible on the "MONGO" container link. The mongo secondary nodes,
# if there are any, should be accessible on the "MONGOn" container links, where "n" is 1, 2, 3, etc.
#
# The $REPLICASET environment variable defines the name of the replica set this container should initialize.
#

if [[ -z $1 ]]; then
    ARG1="start"
else
    ARG1=$1
fi
if [[ -z "$MONGO_PORT_27017_TCP_ADDR" ]]; then
    echo "The Mongo primary node must be defined on the 'MONGO' container link"
    exit 1;
fi
if [[ -z "$REPLICASET" ]]; then
    echo "The name of the replica set must be defined with the 'REPLICASET' environment variable"
    exit 1;
fi

MONGO="/usr/bin/mongo"

#
# Process all secondary nodes by looking for environment variables that match 'MONGOn_PPORT_*_ADDR':
#
PRIMARY_HOST=$MONGO_PORT_27017_TCP_ADDR
PRIMARY_PORT=$MONGO_PORT_27017_TCP_PORT
SECONDARY_COUNT=0;
for VAR in `env | sort`
do
  env_var=`echo "$VAR" | sed -r "s/(.*)=.*/\1/g"`
  if [[ $env_var =~ ^MONGO([0-9]+)_PORT_([0-9]+)_TCP_ADDR ]]; then
    SECONDARY_COUNT=$SECONDARY_COUNT+1
    SECONDARY_HOSTS[$SECONDARY_COUNT]="${!env_var}:${BASH_REMATCH[2]}";
  fi
done

export SECONDARY_HOSTS

checkStatus(){
    NODE_HOST=$1
    if [[ $NODE_HOST =~ ^(.*)[:]([0-9]+) ]]; then
	    NODE_IP=${BASH_REMATCH[1]}
	    NODE_PORT=${BASH_REMATCH[2]}
        $MONGO --host $NODE_IP --port $NODE_PORT --eval db >/dev/null
        while [ "$?" -ne 0 ]
        do
            echo " ... no response, so waiting 3 seconds and retrying ..."
            sleep 3
            $MONGO --host $NODE_IP --port $NODE_PORT --eval db >/dev/null
        done
    else
        echo "Unexpected host format: $NODE_HOST"
        exit 2
    fi
}

# Process some known arguments ...
case $ARG1 in
    start)
        # Define the command that will connect the mongo shell to the primary node ...
        PRIMARY_MONGO="$MONGO --host $PRIMARY_HOST --port $PRIMARY_PORT"

        # Wait for the nodes to become available ...
        echo ""
        echo "Checking status of MongoDB primary node at ${PRIMARY_HOST}:${PRIMARY_PORT} ..."
        checkStatus "$PRIMARY_HOST:$PRIMARY_PORT"

        # See if the replica set is not set up ...
        rsStatus=$($MONGO --host $PRIMARY_HOST --port $PRIMARY_PORT --eval "rs.status()")
        if [[ $rsStatus =~ "no replset config has been received" ]]; then

            # Set up the configuration document ...
            echo "- Using primary:    ${PRIMARY_HOST}:${PRIMARY_PORT}"
            CONFIGVAR="config= {_id: \"${REPLICASET}\", members:[ {_id: 0, host: \"${PRIMARY_HOST}:${PRIMARY_PORT}\", priority: 100 }"
            hostNum=1
            for secondaryHost in "${SECONDARY_HOSTS[@]}"
            do
                # Add the host for each accessible host ...
                CONFIGVAR="${CONFIGVAR}, {_id: ${hostNum}, host: \"${secondaryHost}\" }"
                echo "- Adding secondary: ${secondaryHost}"
                hostNum=$hostNum+1
            done
            CONFIGVAR="${CONFIGVAR} ] }"

            # Initiate the replica set with our document ...
            echo ""
            echo "Initiating the MongoDB replica set and setting the primary node ..."
            $PRIMARY_MONGO --eval "${CONFIGVAR};rs.initiate(config);"

            # get the latest status of the replica set ...
            rsStatus=$($MONGO --host $PRIMARY_HOST --port $PRIMARY_PORT --eval "rs.status()")
            echo ""
            echo "MongoDB replica set '${REPLICASET}' has been initiated. Current replica status:"
        else
            echo ""
            echo "MongoDB replica set '${REPLICASET}' is already initiated. Current replica status:"
        fi
        echo ""
        echo "${rsStatus}"
        echo ""
        echo "MongoDB replica set is ready"
		exit 0
		;;
esac

# Otherwise just run the specified command
exec "$@"