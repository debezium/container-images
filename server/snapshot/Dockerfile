# Stage 1: Build stage
FROM registry.access.redhat.com/ubi8/openjdk-21 AS builder

LABEL maintainer="Debezium Community"

#
# Set the version, home directory
#
ARG DEBEZIUM_VERSION=3.2.6-SNAPSHOT

ENV DEBEZIUM_VERSION=$DEBEZIUM_VERSION \
    SERVER_HOME=/debezium \
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
# Download the snapshot version of debezium-server and then install it to the `$SERVER_HOME` directory...
#
RUN SNAPSHOT_VERSION=$(curl --silent -fSL $MAVEN_OSS_SNAPSHOT/io/debezium/debezium-server-dist/$DEBEZIUM_VERSION/maven-metadata.xml | awk -F'<[^>]+>' '/<extension>tar.gz<\/extension>/ {getline; print $2; exit}'); \
    echo "Downloading and installing debezium-server-dist-$SNAPSHOT_VERSION.tar.gz ..." ; \
    curl --silent -fSL -o /tmp/debezium.tar.gz  $MAVEN_OSS_SNAPSHOT/io/debezium/debezium-server-dist/$DEBEZIUM_VERSION/debezium-server-dist-$SNAPSHOT_VERSION.tar.gz && \
    echo "Extracting debezium-server-dist-$SNAPSHOT_VERSION.tar.gz ..." && \
    tar xzf /tmp/debezium.tar.gz -C $SERVER_HOME --strip-components 1 && \
    echo "Successfully installed debezium-server-dist-$SNAPSHOT_VERSION.tar.gz !" && \
    rm -f /tmp/debezium.tar.gz; 

#
# Allow random UID to use Debezium Server
#
RUN chmod -R g+w,o+w $SERVER_HOME

# Stage 2: Final image
FROM registry.access.redhat.com/ubi8/openjdk-21

LABEL maintainer="Debezium Community"
ENV DEBEZIUM_VERSION=$DEBEZIUM_VERSION \
    SERVER_HOME=/debezium \
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





    

