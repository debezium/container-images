#!/bin/bash

# Exit immediately if a *pipeline* returns a non-zero status. (Add -x for command tracing)
set -eEo pipefail

# The names of container links are as follows, where 'n' is 1, 2, 3, etc.:
#
#   "MONGOn" - specifies the Mongo replica set nodes, and n=1 for the primary node
#   "ROUTERn" - specifies the Mongo router servers (optional, order is not important)
#
# The following environment variables are recognized:
#
#   "REPLICASET" - specifies the name of the replica set for storing data/shards
#
# This script will attempt to initiate the replica set in the Mongo servers specified in the one or more `MONGOn`
# links, where the name of the replica set is given in the `REPLICASET` environment variable. (This step does
# nothing if the replica set is already initiated.) Then, if one or more `ROUTERn` links are specified, this
# script will add the replica set named `REPLICASET` as a shard to each of these MongoDB routers.
#

if [[ -z $1 ]]; then
    ARG1="start"
else
    ARG1=$1
fi

MONGO="/usr/bin/mongo"

#
# Process all MongoDB nodes by looking for environment variables that match 'MONGOn_PPORT_*_ADDR':
#
NODE_COUNT=0;
for VAR in `env | sort`
do
  # First look for port 27019 used for the config server replica sets
  env_var=`echo "$VAR" | sed -r "s/(.*)=.*/\1/g"`
  if [[ $env_var =~ ^MONGO([0-9]+)_PORT_27019_TCP_ADDR ]]; then
    NODE_COUNT=$(($NODE_COUNT+1))
    NODE_HOSTS[$NODE_COUNT]="${!env_var}";
    NODE_PORTS[$NODE_COUNT]="27019";
    if [[ $NODE_COUNT -eq 1 ]]; then
        PRIMARY_HOST=${!env_var}
        PRIMARY_PORT=27019
    fi
  fi
done
if [[ -z $PRIMARY_HOST ]]; then
    NODE_COUNT=0;
    # None were found, so use whatever is available ...
    for VAR in `env | sort`
    do
      env_var=`echo "$VAR" | sed -r "s/(.*)=.*/\1/g"`
      if [[ $env_var =~ ^MONGO([0-9]+)_PORT_([0-9]+)_TCP_ADDR ]]; then
        NODE_COUNT=$(($NODE_COUNT+1))
        NODE_HOSTS[$NODE_COUNT]="${!env_var}";
        NODE_PORTS[$NODE_COUNT]="${BASH_REMATCH[2]}";
        if [[ $NODE_COUNT -eq 1 ]]; then
            PRIMARY_HOST=${!env_var}
            PRIMARY_PORT=${BASH_REMATCH[2]}
        fi
      fi
    done
fi

#
# Process all MongoDB *router* nodes by looking for environment variables that match 'ROUTERn_PPORT_*_ADDR':
#
ROUTER_COUNT=0;
for VAR in `env | sort`
do
  env_var=`echo "$VAR" | sed -r "s/(.*)=.*/\1/g"`
  if [[ $env_var =~ ^ROUTER([0-9]+)_PORT_([0-9]+)_TCP_ADDR ]]; then
    ROUTER_COUNT=$(($ROUTER_COUNT+1))
    ROUTER_HOSTS[$ROUTER_COUNT]="${!env_var}";
    ROUTER_PORTS[$ROUTER_COUNT]="${BASH_REMATCH[2]}";
  fi
done

export NODE_HOSTS
export NODE_PORTS
export ROUTER_HOSTS
export ROUTER_PORTS

# Process some known arguments ...
case $ARG1 in
    start)
        if [[ $NODE_COUNT -lt 1 ]]; then
            echo "At least one Mongo node must be defined in container links, starting with \"MONGO1\" for the primary node and continuing with \"MONGO2\", etc. for secondaries."
            exit 1;
        fi
        if [[ -z "$REPLICASET" ]]; then
            echo "The name of the replica set must be defined with the \"REPLICASET\" environment variable"
            exit 1;
        fi

        # Define the command that will connect the mongo shell to the primary node ...
        PRIMARY_MONGO="$MONGO --host $PRIMARY_HOST --port $PRIMARY_PORT"

        # Wait for the nodes to become available ...
        echo "Testing connection to MongoDB primary node at ${PRIMARY_HOST}:${PRIMARY_PORT} ..."
        status=$($PRIMARY_MONGO --eval db)
        if [ "$?" -ne 0 ]; then
            echo "Error: Unable to connect to ${PRIMARY_HOST}:${PRIMARY_PORT}"
            echo ""
            echo "${status}"
            exit 2
        fi

        # See if the replica set is not set up ...
        rsStatus=$($PRIMARY_MONGO --eval "rs.status()")
        if [[ $rsStatus =~ "no replset config has been received" ]]; then
            # Set up the replica set configuration document ...
            echo "Using MongoDB primary node to initiate replica set \"${REPLICASET}\" with:"
            CONFIGVAR="config= {_id: \"${REPLICASET}\", members:[ "
            hostNum=1
            while [[ $hostNum -le $NODE_COUNT ]]; do
                hostAndPort="${NODE_HOSTS[$hostNum]}:${NODE_PORTS[$hostNum]}"
                if [[ $hostNum -eq 1 ]]; then
                    priority=2
                    echo "- primary node:   ${hostAndPort}"
                else
                    priority=1
                    echo "- secondary node: ${hostAndPort}"
                    CONFIGVAR="${CONFIGVAR},"
                fi
                CONFIGVAR="${CONFIGVAR} {_id: ${hostNum}, host: \"${hostAndPort}\", priority: ${priority} }"
                hostNum=$hostNum+1
            done
            CONFIGVAR="${CONFIGVAR} ] }"

            # Initiate the replica set with our document ...
            $PRIMARY_MONGO --eval "${CONFIGVAR};rs.initiate(config);"

            rsStatus=$($PRIMARY_MONGO --eval "rs.status()")
            if [[ $rsStatus =~ "no replset config has been received" ]]; then
                echo "Failed to initialize replica set"
                exit 1
            fi
        else
            echo "Replica set \"${REPLICASET}\" is already initiated."
        fi
        #if [[ -n $VERBOSE ]]; then
        #    echo ""
        #    echo "Current replica status:"
        #    echo "${rsStatus}"
        #fi
        echo ""
        echo "Replica set is ready"
        echo ""

        if [[ $ROUTER_COUNT -gt 0 ]]; then
            # Add the primary of the replica set as a shard to each of the routers ...
            echo ""
            echo "Checking ${ROUTER_COUNT} router for shard using replica set \"${REPLICASET}/${PRIMARY_HOST}:${PRIMARY_PORT}\":"
            hostNum=1
            added=0
            while [[  $hostNum -le $ROUTER_COUNT ]]; do
                hostAndPort="${ROUTER_HOSTS[$hostNum]}:${ROUTER_PORTS[$hostNum]}"
                result=$($MONGO --host ${ROUTER_HOSTS[$hostNum]} --port ${ROUTER_PORTS[$hostNum]} --eval "rs.status();sh.addShard( \"${REPLICASET}/${PRIMARY_HOST}:${PRIMARY_PORT}\" )")
                if [[ $result =~ "E11000 duplicate key error collection: config.shards index: _id_ dup key" ]]; then
                    echo "- ${hostAndPort} (shard exists)"
                else
                    added=$(($added+1))
                    echo "- ${hostAndPort} (adding shard)"
                fi
                hostNum=$hostNum+1
            done
            echo "Added replica set \"${REPLICASET}/${PRIMARY_HOST}:${PRIMARY_PORT}\" as shard to ${added} routers."
            echo ""
            echo "Routers are ready."
        fi
        exit 0
        ;;
esac

# Otherwise just run the specified command
exec "$@"
