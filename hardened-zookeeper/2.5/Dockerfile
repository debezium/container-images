ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM hardened-debezium-base

LABEL maintainer="R2 Innovations"

#
# Set the version, home directory, and SHA hash.
# SHA 512 hash from https://www.apache.org/dist/zookeeper/zookeeper-$ZK_VERSION/zookeeper-$ZK_VERSION.tar.gz.sha512
#
ENV ZK_VERSION=3.8.2 \
    ZK_HOME=/zookeeper \
    SHA256HASH=30d42364d158850700623e2b0f226335ce52a9707660c16c64ea9c163fe657c429b5f846d664bf7f381bc86abafb01cdc28d23d9f8e49b99a751e6598342a7af
ENV ZK_URL_PATH=zookeeper/zookeeper-$ZK_VERSION/apache-zookeeper-$ZK_VERSION-bin.tar.gz

#
# Create a user and home directory for Zookeeper
# Combined commands to reduce build layers and as result, reduce final image size
#
USER root
# Install dependencies not present in hardened-debezium-base
RUN apk update && \
    apk upgrade && \
    apk add --no-cache openjdk11-jdk tar gzip curl bash wget && \
    mkdir "${ZK_HOME}" && \
    addgroup -g 1001 zookeeper && \
    adduser -u 1001 -G zookeeper -h "${ZK_HOME}" -D zookeeper && \
    chown -R zookeeper "${ZK_HOME}" && \
    chgrp -R zookeeper "${ZK_HOME}" && \
    chmod 755 $ZK_HOME && \
    mkdir $ZK_HOME/data && \
    mkdir $ZK_HOME/txns && \
    mkdir $ZK_HOME/logs

# Download and install Zookeeper
RUN curl -fSL -o /tmp/zookeeper.tar.gz https://archive.apache.org/dist/$ZK_URL_PATH
# Verify the contents and then install ...
# RUN echo "$SHA256HASH /tmp/zookeeper.tar.gz" | sha512sum -c - && \
RUN tar -xzf /tmp/zookeeper.tar.gz -C $ZK_HOME --strip-components 1 && \
 rm -f /tmp/zookeeper.tar.gz
# Remove unnecessary files
RUN rm -r $ZK_HOME/docs

# Remove vulnerable files and update with latest patches


# Remove and update old jackson library files
# jackson-annotations-2.15.2.jar
# jackson-core-2.15.2.jar
# jackson-databind-2.15.2.jar
ENV JACKSON_VERSION=2.15.3
RUN rm $ZK_HOME/lib/jackson-*.jar && \
    wget https://repo1.maven.org/maven2/com/fasterxml/jackson/core/jackson-annotations/$JACKSON_VERSION/jackson-annotations-$JACKSON_VERSION.jar -P $ZK_HOME/lib && \
    wget https://repo1.maven.org/maven2/com/fasterxml/jackson/core/jackson-core/$JACKSON_VERSION/jackson-core-$JACKSON_VERSION.jar -P $ZK_HOME/lib && \
    wget https://repo1.maven.org/maven2/com/fasterxml/jackson/core/jackson-databind/$JACKSON_VERSION/jackson-databind-$JACKSON_VERSION.jar -P $ZK_HOME/lib

# Remove and update old jetty library files
# jetty-http-9.4.51.v20230217.jar
# jetty-io-9.4.51.v20230217.jar
# jetty-security-9.4.51.v20230217.jar
# jetty-server-9.4.51.v20230217.jar
# jetty-servlet-9.4.51.v20230217.jar
# jetty-util-9.4.51.v20230217.jar
# jetty-util-ajax-9.4.51.v20230217.jar
ENV JETTY_VERSION=9.4.53.v20231009
RUN rm $ZK_HOME/lib/jetty-*.jar && \
    wget https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-http/$JETTY_VERSION/jetty-http-$JETTY_VERSION.jar -P $ZK_HOME/lib && \
    wget https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-io/$JETTY_VERSION/jetty-io-$JETTY_VERSION.jar -P $ZK_HOME/lib && \
    wget https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-security/$JETTY_VERSION/jetty-security-$JETTY_VERSION.jar -P $ZK_HOME/lib && \
    wget https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-server/$JETTY_VERSION/jetty-server-$JETTY_VERSION.jar -P $ZK_HOME/lib && \
    wget https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-servlet/$JETTY_VERSION/jetty-servlet-$JETTY_VERSION.jar -P $ZK_HOME/lib && \
    wget https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-util/$JETTY_VERSION/jetty-util-$JETTY_VERSION.jar -P $ZK_HOME/lib && \
    wget https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-util-ajax/$JETTY_VERSION/jetty-util-ajax-$JETTY_VERSION.jar -P $ZK_HOME/lib

# Remove and update old netty library files
# netty-buffer-4.1.94.Final.jar
# netty-codec-4.1.94.Final.jar
# netty-common-4.1.94.Final.jar
# netty-handler-4.1.94.Final.jar
# netty-resolver-4.1.94.Final.jar
# netty-transport-4.1.94.Final.jar
# netty-transport-classes-epoll-4.1.94.Final.jar
# netty-transport-native-epoll-4.1.94.Final.jar
# netty-transport-native-unix-common-4.1.94.Final.jar
ENV NETTY_VERSION=4.1.101.Final
RUN rm $ZK_HOME/lib/netty-*.jar && \
    wget https://repo1.maven.org/maven2/io/netty/netty-buffer/$NETTY_VERSION/netty-buffer-$NETTY_VERSION.jar -P $ZK_HOME/lib && \
    wget https://repo1.maven.org/maven2/io/netty/netty-codec/$NETTY_VERSION/netty-codec-$NETTY_VERSION.jar -P $ZK_HOME/lib && \
    wget https://repo1.maven.org/maven2/io/netty/netty-common/$NETTY_VERSION/netty-common-$NETTY_VERSION.jar -P $ZK_HOME/lib && \
    wget https://repo1.maven.org/maven2/io/netty/netty-handler/$NETTY_VERSION/netty-handler-$NETTY_VERSION.jar -P $ZK_HOME/lib && \
    wget https://repo1.maven.org/maven2/io/netty/netty-resolver/$NETTY_VERSION/netty-resolver-$NETTY_VERSION.jar -P $ZK_HOME/lib && \
    wget https://repo1.maven.org/maven2/io/netty/netty-transport/$NETTY_VERSION/netty-transport-$NETTY_VERSION.jar -P $ZK_HOME/lib && \
    wget https://repo1.maven.org/maven2/io/netty/netty-transport-classes-epoll/$NETTY_VERSION/netty-transport-classes-epoll-$NETTY_VERSION.jar -P $ZK_HOME/lib && \
    wget https://repo1.maven.org/maven2/io/netty/netty-transport-native-epoll/$NETTY_VERSION/netty-transport-native-epoll-$NETTY_VERSION.jar -P $ZK_HOME/lib && \
    wget https://repo1.maven.org/maven2/io/netty/netty-transport-native-unix-common/$NETTY_VERSION/netty-transport-native-unix-common-$NETTY_VERSION.jar -P $ZK_HOME/lib

# Allow random user to use Zookeeper
RUN chmod -R 777 $ZK_HOME

# Switch user
USER zookeeper


# Set the working directory to the Zookeeper home directory
WORKDIR $ZK_HOME

#
# Customize the Zookeeper and Log4J configuration files
#
COPY ./zoo.cfg $ZK_HOME/conf/zoo.cfg
RUN sed -i -r -e "s|name=\"zookeeper.log.dir\" value=\".\"|name=\"zookeeper.log.dir\" value=\"$ZK_HOME/logs\"|g" \
              -e "s|(\[myid\:\%X\{myid\}\]\s?)||g" \
              $ZK_HOME/conf/logback.xml && \
    mkdir $ZK_HOME/conf.orig && mv $ZK_HOME/conf/* $ZK_HOME/conf.orig

#
# The zkEnv.sh script generates the classpath for launching ZooKeeper, with entries
# containing the pattern "/bin/../lib", which fails to be resolved properly in some
# environments; hence replacing this with "/lib" in the assembled classpath
#
RUN echo 'CLASSPATH="${CLASSPATH//bin\/\.\.\/lib\//lib/}"' >> $ZK_HOME/bin/zkEnv.sh

#
# Expose the ports and set up volumes for the data, transaction log, and configuration
#
EXPOSE 2181 2888 3888
VOLUME ["/zookeeper/data","/zookeeper/txns","/zookeeper/conf"]

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["start"]