FROM debezium/connect-base:0.5

MAINTAINER Debezium Community

ENV DEBEZIUM_VERSION=0.5.2-SNAPSHOT \
    MAVEN_OSS_SNAPSHOT="https://oss.sonatype.org/content/repositories/snapshots"

#
# Create a single `$KAFKA_CONNECT_PLUGINS_DIR/debezium` directory into which we'll place all of our JARs and files.
#
# Debezium connectors share some dependencies and JARs, so if we put each connector into a separate directory
# then we'd have JARs appearing in multiple places on Kafka Connect's flat classpath, and we'd get
# NoSuchMethod exceptions.

RUN mkdir $KAFKA_CONNECT_PLUGINS_DIR/debezium

#
# Download the snapshot version of the connectors and then install them into the `$KAFKA_CONNECT_PLUGINS_DIR/debezium` directory...
#
RUN for CONNECTOR in {mysql,mongodb,postgres}; do \
    SNAPSHOT_VERSION=$(curl -fSL $MAVEN_OSS_SNAPSHOT/io/debezium/debezium-connector-$CONNECTOR/$DEBEZIUM_VERSION/maven-metadata.xml | awk -F'<[^>]+>' '/<extension>tar.gz<\/extension>/ {getline; print $2}'); \
    curl -fSL -o /tmp/plugin.tar.gz \
                 $MAVEN_OSS_SNAPSHOT/io/debezium/debezium-connector-$CONNECTOR/$DEBEZIUM_VERSION/debezium-connector-$CONNECTOR-$SNAPSHOT_VERSION-plugin.tar.gz &&\
    tar -xzf /tmp/plugin.tar.gz -C $KAFKA_CONNECT_PLUGINS_DIR/debezium --strip 1 && \
    rm -f /tmp/plugin.tar.gz; \
    done
