FROM registry.access.redhat.com/ubi9/ubi-minimal:9.6 AS builder

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION=3.7.0.Beta1 \
    SERVER_HOME=/debezium \
    MAVEN_REPO_CENTRAL="https://repo1.maven.org/maven2"
ENV SERVER_URL_PATH=io/debezium/debezium-server-dist/$DEBEZIUM_VERSION/debezium-server-native-dist-$DEBEZIUM_VERSION.tar.gz \
SERVER_MD5=TBD

USER root

RUN microdnf -y install \
        gzip \
        tar \
    && microdnf clean all

RUN mkdir -p ${SERVER_HOME}/conf ${SERVER_HOME}/data

#
# Download and install Debezium Server
#
RUN curl -fSL -o /tmp/debezium.tar.gz "$MAVEN_REPO_CENTRAL/$SERVER_URL_PATH"

#
# Verify the contents and then install ...
#
RUN echo "$SERVER_MD5 /tmp/debezium.tar.gz" | md5sum -c - &&\
    tar xzf /tmp/debezium.tar.gz -C $SERVER_HOME --strip-components 1 &&\
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