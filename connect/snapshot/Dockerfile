FROM debezium/connect-base:1.7

LABEL maintainer="Debezium Community"

ARG DEBEZIUM_VERSION=1.7.0-SNAPSHOT

ENV DEBEZIUM_VERSION=$DEBEZIUM_VERSION \
    MAVEN_OSS_SNAPSHOT="https://oss.sonatype.org/content/repositories/snapshots"

#
# Download the snapshot version of the connectors and then install them into the `$KAFKA_CONNECT_PLUGINS_DIR/debezium` directory...
#
RUN for CONNECTOR in {mysql,mongodb,postgres,sqlserver,oracle,db2,vitess}; do \
    SNAPSHOT_VERSION=$(curl -fSL $MAVEN_OSS_SNAPSHOT/io/debezium/debezium-connector-$CONNECTOR/$DEBEZIUM_VERSION/maven-metadata.xml | awk -F'<[^>]+>' '/<extension>tar.gz<\/extension>/ {getline; print $2}'); \
    curl -fSL -o /tmp/plugin.tar.gz \
                 $MAVEN_OSS_SNAPSHOT/io/debezium/debezium-connector-$CONNECTOR/$DEBEZIUM_VERSION/debezium-connector-$CONNECTOR-$SNAPSHOT_VERSION-plugin.tar.gz &&\
    tar -xzf /tmp/plugin.tar.gz -C $KAFKA_CONNECT_PLUGINS_DIR && \
    rm -f /tmp/plugin.tar.gz; \
    done

RUN for PACKAGE in {scripting}; do \
    SNAPSHOT_VERSION=$(curl -fSL $MAVEN_OSS_SNAPSHOT/io/debezium/debezium-$PACKAGE/$DEBEZIUM_VERSION/maven-metadata.xml | awk -F'<[^>]+>' '/<extension>tar.gz<\/extension>/ {getline; print $2}'); \
    curl -fSL -o /tmp/package.tar.gz \
                 $MAVEN_OSS_SNAPSHOT/io/debezium/debezium-$PACKAGE/$DEBEZIUM_VERSION/debezium-$PACKAGE-$SNAPSHOT_VERSION.tar.gz &&\
    tar -xzf /tmp/package.tar.gz -C $EXTERNAL_LIBS_DIR && \
    rm -f /tmp/package.tar.gz; \
    done
