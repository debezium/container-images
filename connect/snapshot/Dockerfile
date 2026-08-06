FROM quay.io/debezium/connect-base:3.7

LABEL maintainer="Debezium Community"

# DEBEZIUM_VERSION is optional. If not provided, it will be auto-detected
# from the debezium/debezium GitHub repository's main branch pom.xml.
# To use a specific version: docker build --build-arg DEBEZIUM_VERSION=x.y.z-SNAPSHOT
ARG DEBEZIUM_VERSION=""

ENV MAVEN_OSS_SNAPSHOT="https://central.sonatype.com/repository/maven-snapshots"

#
# Auto-detect version from GitHub if not provided
#
RUN if [ -z "$DEBEZIUM_VERSION" ]; then \
        echo "DEBEZIUM_VERSION not provided, auto-detecting from GitHub..." && \
        DEBEZIUM_VERSION=$(curl -fsSL https://raw.githubusercontent.com/debezium/debezium/main/pom.xml | \
            grep -oP '<version>\K[^<]*-SNAPSHOT(?=</version>)' | \
            head -1) && \
        echo "Detected version: $DEBEZIUM_VERSION"; \
    else \
        echo "Using provided DEBEZIUM_VERSION: $DEBEZIUM_VERSION"; \
    fi && \
    echo "$DEBEZIUM_VERSION" > /tmp/debezium_version.txt

#
# Download the snapshot version of the connectors and then install them into the `$KAFKA_CONNECT_PLUGINS_DIR/debezium` directory...
#
RUN DEBEZIUM_VERSION=$(cat /tmp/debezium_version.txt) && \
    for CONNECTOR in {mysql,mongodb,postgres,sqlserver,oracle,db2,jdbc,spanner,vitess,informix,ibmi,mariadb,cockroachdb}; do \
        SNAPSHOT_VERSION=$(curl --silent -fSL $MAVEN_OSS_SNAPSHOT/io/debezium/debezium-connector-$CONNECTOR/$DEBEZIUM_VERSION/maven-metadata.xml | awk -F'<[^>]+>' '/<extension>tar.gz<\/extension>/ {getline; print $2; exit}'); \
        echo "Downloading and installing debezium-connector-$CONNECTOR-$SNAPSHOT_VERSION-plugin.tar.gz ..." ; \
        curl --silent -fSL -o /tmp/plugin.tar.gz \
                     $MAVEN_OSS_SNAPSHOT/io/debezium/debezium-connector-$CONNECTOR/$DEBEZIUM_VERSION/debezium-connector-$CONNECTOR-$SNAPSHOT_VERSION-plugin.tar.gz && \
        echo "Extracting debezium-connector-$CONNECTOR-$SNAPSHOT_VERSION-plugin.tar.gz ..." && \
        tar -xzf /tmp/plugin.tar.gz -C $KAFKA_CONNECT_PLUGINS_DIR && \
        echo "Successfully installed debezium-connector-$CONNECTOR-$SNAPSHOT_VERSION!" && \
        rm -f /tmp/plugin.tar.gz; \
    done

RUN DEBEZIUM_VERSION=$(cat /tmp/debezium_version.txt) && \
    for PACKAGE in {scripting,}; do \
        SNAPSHOT_VERSION=$(curl --silent -fSL $MAVEN_OSS_SNAPSHOT/io/debezium/debezium-$PACKAGE/$DEBEZIUM_VERSION/maven-metadata.xml | awk -F'<[^>]+>' '/<extension>tar.gz<\/extension>/ {getline; print $2; exit}'); \
        echo "Downloading and installing debezium-$PACKAGE-$SNAPSHOT_VERSION.tar.gz ..." ; \
        curl --silent -fSL -o /tmp/package.tar.gz \
                     $MAVEN_OSS_SNAPSHOT/io/debezium/debezium-$PACKAGE/$DEBEZIUM_VERSION/debezium-$PACKAGE-$SNAPSHOT_VERSION.tar.gz &&\
        echo "Extracting debezium-$PACKAGE-$SNAPSHOT_VERSION.tar.gz ..." && \
        tar -xzf /tmp/package.tar.gz -C $EXTERNAL_LIBS_DIR && \
        echo "Successfully installed debezium-$PACKAGE-$SNAPSHOT_VERSION!" && \
        rm -f /tmp/package.tar.gz; \
    done

RUN DEBEZIUM_VERSION=$(cat /tmp/debezium_version.txt) && \
    for PACKAGE in {connect-rest-extension,interceptor}; do \
        SNAPSHOT_VERSION=$(curl --silent -fSL $MAVEN_OSS_SNAPSHOT/io/debezium/debezium-$PACKAGE/$DEBEZIUM_VERSION/maven-metadata.xml | awk -F'<[^>]+>' '/<extension>jar<\/extension>/ {getline; print $2; exit}'); \
        echo "Downloading and installing debezium-$PACKAGE-$SNAPSHOT_VERSION.jar ..." ; \
        mkdir -p $KAFKA_CONNECT_PLUGINS_DIR/debezium-$PACKAGE/ ; \
        curl --silent -fSL -o $KAFKA_CONNECT_PLUGINS_DIR/debezium-$PACKAGE/debezium-$PACKAGE.jar \
                     $MAVEN_OSS_SNAPSHOT/io/debezium/debezium-$PACKAGE/$DEBEZIUM_VERSION/debezium-$PACKAGE-$SNAPSHOT_VERSION.jar && \
        echo "Successfully installed debezium-$PACKAGE-$SNAPSHOT_VERSION!" ; \
    done