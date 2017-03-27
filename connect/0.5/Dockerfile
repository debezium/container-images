FROM debezium/connect-base:0.5

MAINTAINER Debezium Community

ENV DEBEZIUM_VERSION=0.5.0 \
    MAVEN_CENTRAL="https://repo1.maven.org/maven2"

#
# Create a single `$KAFKA_CONNECT_PLUGINS_DIR/debezium` directory into which we'll place all of our JARs and files.
#
# Debezium connectors share some dependencies and JARs, so if we put each connector into a separate directory
# then we'd have JARs appearing in multiple places on Kafka Connect's flat classpath, and we'd get 
# NoSuchMethod exceptions.

RUN mkdir $KAFKA_CONNECT_PLUGINS_DIR/debezium

#
# Download MySQL connector, verify the contents, and then install into the `$KAFKA_CONNECT_PLUGINS_DIR/debezium` directory...
#
RUN curl -fSL -o /tmp/plugin.tar.gz \
                 $MAVEN_CENTRAL/io/debezium/debezium-connector-mysql/$DEBEZIUM_VERSION/debezium-connector-mysql-$DEBEZIUM_VERSION-plugin.tar.gz &&\
    echo "46b09d28d53c9aa997e55ac29e0754eb  /tmp/plugin.tar.gz" | md5sum -c - &&\
    tar -xzf /tmp/plugin.tar.gz -C $KAFKA_CONNECT_PLUGINS_DIR/debezium --strip 1 &&\
    rm -f /tmp/plugin.tar.gz    


#
# Download MongoDB connector, verify the contents, and then install ...
#
RUN curl -fSL -o /tmp/plugin.tar.gz \
                 $MAVEN_CENTRAL/io/debezium/debezium-connector-mongodb/$DEBEZIUM_VERSION/debezium-connector-mongodb-$DEBEZIUM_VERSION-plugin.tar.gz &&\
    echo "0856a420e9161645a134152b872d3feb  /tmp/plugin.tar.gz" | md5sum -c - &&\
    tar -xzf /tmp/plugin.tar.gz -C $KAFKA_CONNECT_PLUGINS_DIR/debezium --strip 1 &&\
    rm -f /tmp/plugin.tar.gz    


#
# Download PostgreSQL connector, verify the contents, and then install ...
#
RUN curl -fSL -o /tmp/plugin.tar.gz \
                 $MAVEN_CENTRAL/io/debezium/debezium-connector-postgres/$DEBEZIUM_VERSION/debezium-connector-postgres-$DEBEZIUM_VERSION-plugin.tar.gz &&\
    echo "3b2e4f68612ce2e34298ff81e7e24c77  /tmp/plugin.tar.gz" | md5sum -c - &&\
    tar -xzf /tmp/plugin.tar.gz -C $KAFKA_CONNECT_PLUGINS_DIR/debezium --strip 1 &&\
    rm -f /tmp/plugin.tar.gz    

