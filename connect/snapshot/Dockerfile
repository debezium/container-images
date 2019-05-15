FROM debezium/connect-base:0.10

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION=0.10.0-SNAPSHOT \
    MAVEN_OSS_SNAPSHOT="https://oss.sonatype.org/content/repositories/snapshots"

#
# Download the snapshot version of the connectors and then install them into the `$KAFKA_CONNECT_PLUGINS_DIR/debezium` directory...
#
RUN for CONNECTOR in {mysql,mongodb,postgres,oracle,sqlserver}; do \
    SNAPSHOT_VERSION=$(curl -fSL $MAVEN_OSS_SNAPSHOT/io/debezium/debezium-connector-$CONNECTOR/$DEBEZIUM_VERSION/maven-metadata.xml | awk -F'<[^>]+>' '/<extension>tar.gz<\/extension>/ {getline; print $2}'); \
    curl -fSL -o /tmp/plugin.tar.gz \
                 $MAVEN_OSS_SNAPSHOT/io/debezium/debezium-connector-$CONNECTOR/$DEBEZIUM_VERSION/debezium-connector-$CONNECTOR-$SNAPSHOT_VERSION-plugin.tar.gz &&\
    tar -xzf /tmp/plugin.tar.gz -C $KAFKA_CONNECT_PLUGINS_DIR && \
    rm -f /tmp/plugin.tar.gz; \
    done
