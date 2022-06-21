FROM debezium/connect-base:2.0

LABEL maintainer="Debezium Community"

ARG DEBEZIUM_VERSION=1.9.0-SNAPSHOT

ENV DEBEZIUM_VERSION=$DEBEZIUM_VERSION \
    MAVEN_OSS_SNAPSHOT="https://oss.sonatype.org/content/repositories/snapshots"

#
# Download the snapshot version of the connectors and then install them into the `$KAFKA_CONNECT_PLUGINS_DIR/debezium` directory...
#
RUN for CONNECTOR in {mysql,mongodb,postgres,sqlserver,oracle,db2,vitess}; do \
    SNAPSHOT_VERSION=$(curl --silent -fSL $MAVEN_OSS_SNAPSHOT/io/debezium/debezium-connector-$CONNECTOR/$DEBEZIUM_VERSION/maven-metadata.xml | awk -F'<[^>]+>' '/<extension>tar.gz<\/extension>/ {getline; print $2; exit}'); \
    echo "Downloading and installing debezium-connector-$CONNECTOR-$SNAPSHOT_VERSION-plugin.tar.gz ..." ; \
    curl --silent -fSL -o /tmp/plugin.tar.gz \
                 $MAVEN_OSS_SNAPSHOT/io/debezium/debezium-connector-$CONNECTOR/$DEBEZIUM_VERSION/debezium-connector-$CONNECTOR-$SNAPSHOT_VERSION-plugin.tar.gz && \
    echo "Extracting debezium-connector-$CONNECTOR-$SNAPSHOT_VERSION-plugin.tar.gz ..." && \
    tar -xzf /tmp/plugin.tar.gz -C $KAFKA_CONNECT_PLUGINS_DIR && \
    echo "Successfully installed debezium-connector-$CONNECTOR-$SNAPSHOT_VERSION!" && \
    rm -f /tmp/plugin.tar.gz; \
done

RUN for PACKAGE in {scripting,}; do \
    SNAPSHOT_VERSION=$(curl --silent -fSL $MAVEN_OSS_SNAPSHOT/io/debezium/debezium-$PACKAGE/$DEBEZIUM_VERSION/maven-metadata.xml | awk -F'<[^>]+>' '/<extension>tar.gz<\/extension>/ {getline; print $2; exit}'); \
    echo "Downloading and installing debezium-$PACKAGE-$SNAPSHOT_VERSION.tar.gz ..." ; \
    curl --silent -fSL -o /tmp/package.tar.gz \
                 $MAVEN_OSS_SNAPSHOT/io/debezium/debezium-$PACKAGE/$DEBEZIUM_VERSION/debezium-$PACKAGE-$SNAPSHOT_VERSION.tar.gz &&\
    echo "Extracting debezium-$PACKAGE-$SNAPSHOT_VERSION.tar.gz ..." && \
    tar -xzf /tmp/package.tar.gz -C $EXTERNAL_LIBS_DIR && \
    echo "Successfully installed debezium-$PACKAGE-$SNAPSHOT_VERSION!" && \
    rm -f /tmp/package.tar.gz; \
done

RUN for PACKAGE in {connect-rest-extension,}; do \
    SNAPSHOT_VERSION=$(curl --silent -fSL $MAVEN_OSS_SNAPSHOT/io/debezium/debezium-$PACKAGE/$DEBEZIUM_VERSION/maven-metadata.xml | awk -F'<[^>]+>' '/<extension>jar<\/extension>/ {getline; print $2; exit}'); \
    echo "Downloading and installing debezium-$PACKAGE-$SNAPSHOT_VERSION.jar ..." ; \
    mkdir -p $KAFKA_CONNECT_PLUGINS_DIR/debezium-$PACKAGE/ ; \
    curl --silent -fSL -o $KAFKA_CONNECT_PLUGINS_DIR/debezium-$PACKAGE/debezium-$PACKAGE.jar \
                 $MAVEN_OSS_SNAPSHOT/io/debezium/debezium-$PACKAGE/$DEBEZIUM_VERSION/debezium-$PACKAGE-$SNAPSHOT_VERSION.jar && \
    echo "Successfully installed debezium-$PACKAGE-$SNAPSHOT_VERSION!" ; \
done
