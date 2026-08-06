# Stage 1: Build stage
FROM registry.access.redhat.com/ubi8/openjdk-21 AS builder

LABEL maintainer="Debezium Community"

#
# Set the version, home directory
#
# DEBEZIUM_VERSION is optional. If not provided, it will be auto-detected
# from the debezium/debezium GitHub repository's main branch pom.xml.
# To use a specific version: docker build --build-arg DEBEZIUM_VERSION=x.y.z-SNAPSHOT
ARG DEBEZIUM_VERSION=""

ENV SERVER_HOME=/debezium \
    MAVEN_OSS_SNAPSHOT="https://central.sonatype.com/repository/maven-snapshots"

#
# Create a directory for Debezium Server
#
USER root
RUN microdnf -y install gzip && \
    microdnf clean all && \
    mkdir $SERVER_HOME && \
    chmod 755 $SERVER_HOME

#
# Change ownership and switch user
#
RUN chown -R jboss $SERVER_HOME && \
    chgrp -R jboss $SERVER_HOME
USER jboss

RUN mkdir $SERVER_HOME/conf && \
    mkdir $SERVER_HOME/data

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
# Download the snapshot version of debezium-server and then install it to the `$SERVER_HOME` directory...
#
RUN DEBEZIUM_VERSION=$(cat /tmp/debezium_version.txt) && \
    SNAPSHOT_VERSION=$(curl --silent -fSL $MAVEN_OSS_SNAPSHOT/io/debezium/debezium-server-dist/$DEBEZIUM_VERSION/maven-metadata.xml | awk -F'<[^>]+>' '/<extension>tar.gz<\/extension>/ {getline; print $2; exit}') && \
    echo "Downloading and installing debezium-server-dist-$SNAPSHOT_VERSION.tar.gz ..." && \
    curl --silent -fSL -o /tmp/debezium.tar.gz  $MAVEN_OSS_SNAPSHOT/io/debezium/debezium-server-dist/$DEBEZIUM_VERSION/debezium-server-dist-$SNAPSHOT_VERSION.tar.gz && \
    echo "Extracting debezium-server-dist-$SNAPSHOT_VERSION.tar.gz ..." && \
    tar xzf /tmp/debezium.tar.gz -C $SERVER_HOME --strip-components 1 && \
    echo "Successfully installed debezium-server-dist-$SNAPSHOT_VERSION.tar.gz !" && \
    rm -f /tmp/debezium.tar.gz

#
# Allow random UID to use Debezium Server
#
RUN chmod -R g+w,o+w $SERVER_HOME

# Stage 2: Final image
FROM registry.access.redhat.com/ubi8/openjdk-21

LABEL maintainer="Debezium Community"

ENV SERVER_HOME=/debezium \
    MAVEN_OSS_SNAPSHOT="https://central.sonatype.com/repository/maven-snapshots"

USER root
RUN microdnf clean all

USER jboss

COPY --from=builder $SERVER_HOME $SERVER_HOME

# Set the working directory to the Debezium Server home directory
WORKDIR $SERVER_HOME

#
# Expose the ports and set up volumes for the data, transaction log, and configuration
#
EXPOSE 8080
VOLUME ["/debezium/conf","/debezium/data"]

CMD ["/debezium/run.sh"]