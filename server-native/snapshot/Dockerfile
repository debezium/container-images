FROM registry.access.redhat.com/ubi9/ubi-minimal:9.6 AS builder

LABEL maintainer="Debezium Community"

ARG DEBEZIUM_VERSION=""

ENV SERVER_HOME=/debezium \
    MAVEN_OSS_SNAPSHOT=https://central.sonatype.com/repository/maven-snapshots

USER root

RUN microdnf -y install \
        curl \
        gzip \
        tar \
        grep \
        gawk \
    && microdnf clean all

RUN mkdir -p ${SERVER_HOME}/conf ${SERVER_HOME}/data

#
# Auto-detect version from GitHub if not provided
#
RUN if [ -z "$DEBEZIUM_VERSION" ]; then \
        echo "DEBEZIUM_VERSION not provided, auto-detecting from GitHub..." && \
        DEBEZIUM_VERSION=$(curl -fsSL https://raw.githubusercontent.com/debezium/debezium/main/pom.xml | \
            grep -oP '<version>\K[^<]*-SNAPSHOT(?=</version>)' | \
            head -1) && \
        test -n "$DEBEZIUM_VERSION"; \
    fi && \
    echo "Using version: $DEBEZIUM_VERSION" && \
    echo "$DEBEZIUM_VERSION" > /tmp/debezium_version.txt

#
# Download and install Debezium Server
#
RUN DEBEZIUM_VERSION=$(cat /tmp/debezium_version.txt) && \
    SNAPSHOT_VERSION=$(curl -fsSL \
        ${MAVEN_OSS_SNAPSHOT}/io/debezium/debezium-server-native-dist/${DEBEZIUM_VERSION}/maven-metadata.xml | \
        awk -F'[<>]' '/extension>tar.gz/ {getline; print $3; exit}') && \
    echo "Downloading debezium-server-native-dist-${SNAPSHOT_VERSION}.tar.gz" && \
    curl -fsSL \
        -o /tmp/debezium.tar.gz \
        ${MAVEN_OSS_SNAPSHOT}/io/debezium/debezium-server-native-dist/${DEBEZIUM_VERSION}/debezium-server-native-dist-${SNAPSHOT_VERSION}.tar.gz && \
    tar xzf /tmp/debezium.tar.gz \
        -C ${SERVER_HOME} \
        --strip-components=1 && \
    rm -f /tmp/debezium.tar.gz

#
# OpenShift-compatible permissions
#
RUN chgrp -R 0 ${SERVER_HOME} && \
    chmod -R g=u ${SERVER_HOME}

# ------------------------------------------------------------------------------
# Stage 2: Runtime stage
# ------------------------------------------------------------------------------

FROM registry.access.redhat.com/ubi9/ubi-minimal:9.6

LABEL maintainer="Debezium Community"

ENV SERVER_HOME=/debezium

USER root

RUN microdnf clean all && \
    mkdir -p ${SERVER_HOME}

COPY --from=builder --chown=1001:0 ${SERVER_HOME} ${SERVER_HOME}

RUN chgrp -R 0 ${SERVER_HOME} && \
    chmod -R g=u ${SERVER_HOME}

WORKDIR ${SERVER_HOME}

EXPOSE 8080

VOLUME ["/debezium/conf", "/debezium/data"]

USER 1001

CMD ["/debezium/run.sh"]