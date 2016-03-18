#!/bin/bash

# Exit immediately if a *pipeline* returns a non-zero status. (Add -x for command tracing)
set -e

usage() {
    echo "The following command is used to start the Zookeeper server in a new Docker container:"
    echo ""
    echo "   start"
    echo ""
    echo "This is the default command that is used when you don't provide a command. However, once the"
    echo "container is started and Zookeeper server is running within it, you can give one of the following"
    echo "commands to Docker while attaching to the already-running container:"
    echo ""
    echo "   status              Display the status of the Zookeeper server running in the container."
    echo ""
    echo "   cli                 Runs the Zookeeper command line interface (CLI) against the Zookeeper server"
    echo "                       already running in this container."
    echo ""
    echo "The container can also run arbitrary commands. For example, to obtain a bash shell in a new"
    echo "container or in an already-running container:"
    echo ""
    echo "    bash"
    echo ""
    echo ""
    echo "Environment variables"
    echo "---------------------"
    echo ""
    echo "The Zookeeper instances can be clustered, and each Zookeeper instance needs to be configured with"
    echo "with a unique but specific numeric identifier. Identifiers should be monotonically increasing integers,"
    echo "starting with '1'. The following environment variables defines the server's identifier and the largest"
    echo "identifier used in the cluster:"
    echo ""
    echo "   SERVER_ID                 The numeric identifier for this Zookeeper server. This should always"
    echo "                             be set, though the default value of '1' is acceptable only for a single"
    echo "                             standalone server that is not replicated nor fault-tolerant."
    echo "   SERVER_COUNT              The total number of Zookeeper servers in the cluster. This should always"
    echo "                             be set, though the default value of '1' is acceptable only for a single"
    echo "                             standalone server that is not replicated nor fault-tolerant."
    echo ""
    echo "You can also control the level of detail that Zookeeper writes to the container's STDOUT and STDERR"
    echo "by setting the following environment variable:"
    echo ""
    echo "   LOG_LEVEL                 Set the level of detail for Zookeeper's application log."
    echo "                             Valid values are 'INFO' (default), 'WARN', 'ERROR', 'DEBUG', or 'TRACE'."
    echo ""
    echo ""
    echo "Volumes"
    echo "-------"
    echo ""
    echo "The container exposes three volumes that can be mounted when starting a container:"
    echo ""
    echo "  /zookeeper/data     All Zookeeper data is written within this directory. Mount it"
    echo "                      appropriately when running your container to persist the data"
    echo "                      after the container is stopped."
    echo ""
    echo "  /zookeeper/txns     Zookeeper writes its transaction log files within this directory."
    echo ""
    echo "  /zookeeper/conf     Zookeeper's configuration directory."
    echo ""
    echo ""
}

if [[ -z $1 ]]; then
    ARG1="start"
else
    ARG1=$1
fi

# Process some known arguments to run Zookeeper ...
case $ARG1 in
    start)
        #
        # Process the logging-related environment variables. Zookeeper's log configuration allows *some* variables to be
        # set via environment variables, and more via system properties (e.g., "-Dzookeeper.console.threshold=INFO").
        # However, in the interest of keeping things straightforward and in the spirit of the immutable image, 
        # we don't use these and instead directly modify the Log4J configuration file (replacing the variables).
        #
        if [[ -z "$LOG_LEVEL" ]]; then
            LOG_LEVEL="INFO"
        fi
        sed -i -r -e "s|\\$\\{zookeeper.root.logger\\}|$LOG_LEVEL, CONSOLE|g" $ZK_HOME/conf/log4j.properties
        sed -i -r -e "s|\\$\\{zookeeper.console.threshold\\}|$LOG_LEVEL|g" $ZK_HOME/conf/log4j.properties

        #
        # Configure cluster settings
        #
        if [[ -z "$SERVER_ID" ]]; then
            SERVER_ID="1"
        fi
        if [[ -z "$SERVER_COUNT" ]]; then
            SERVER_COUNT=1
        fi
        if [[ $SERVER_ID = "1" ]] && [[ $SERVER_COUNT = "1" ]]; then
            echo "Starting up in standalone mode"
        else
            echo "Starting up in clustered mode"
            #
            # Persists the ID of the current instance of Zookeeper
            #
            echo ${SERVER_ID} > $ZK_HOME/data/myid
            #
            # Append the server addresses to the configuration file ...
            #
            echo "" >> $ZK_HOME/conf/zoo.cfg
            echo "#Server List" >> $ZK_HOME/conf/zoo.cfg
            for i in $( eval echo {1..$SERVER_COUNT});do
                echo "server.$i=zookeeper-$i:2888:3888" >> $ZK_HOME/conf/zoo.cfg
            done
        fi

        # Now start the Zookeeper server
        export ZOOCFGDIR="$ZK_HOME/conf"
        export ZOOCFG="zoo.cfg"
        exec $ZK_HOME/bin/zkServer.sh start-foreground
        ;;
    status)
        exec $ZK_HOME/bin/zkServer.sh status
        ;;
    cli)
        exec "$ZK_HOME/bin/zkCli.sh -server 127.0.0.1:2181"
        ;;
    -h|--h|--help|help)
        usage; exit 1
        ;;
esac

# Otherwise just run the specified command
exec "$@"
