# Stage 1: Build stage
FROM registry.access.redhat.com/ubi8/openjdk-21 AS builder

LABEL maintainer="Debezium Community"

ARG OTEL_ENABLED=false

#
# Set the version, home directory, and MD5 hash.
#
ENV DEBEZIUM_VERSION=3.5.0.Final \
    SERVER_HOME=/debezium \
    MAVEN_REPO_CENTRAL="https://repo1.maven.org/maven2" \
    OPENTELEMETRY_AGENT_VERSION=2.25.0 \
    OPENTELEMETRY_MD5=a7f1cbab5448e61d93e71ffdff9175b6
ENV SERVER_URL_PATH=io/debezium/debezium-server-dist/$DEBEZIUM_VERSION/debezium-server-dist-$DEBEZIUM_VERSION.tar.gz \
    SERVER_MD5=c1860c1765a49c3ed9a74a574ca3dbc7

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

RUN mkdir $SERVER_HOME/config && \
    mkdir $SERVER_HOME/data

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
# Download the OpenTelemetry Java agent and wire it into run.sh via JAVA_OPTS
#
RUN if [ "$OTEL_ENABLED" = "true" ]; then \
       mkdir $SERVER_HOME/otel \
       && curl -fSL -o $SERVER_HOME/otel/opentelemetry-javaagent.jar \
           https://repo1.maven.org/maven2/io/opentelemetry/javaagent/opentelemetry-javaagent/$OPENTELEMETRY_AGENT_VERSION/opentelemetry-javaagent-$OPENTELEMETRY_AGENT_VERSION.jar \
       && echo "$OPENTELEMETRY_MD5 $SERVER_HOME/otel/opentelemetry-javaagent.jar" | md5sum -c - \
       && sed -i "/^exec/i JAVA_OPTS=\"\$JAVA_OPTS -javaagent:$SERVER_HOME/otel/opentelemetry-javaagent.jar\"" $SERVER_HOME/run.sh; \
    fi

#
# Allow random UID to use Debezium Server
#
RUN chmod -R g+w,o+w $SERVER_HOME

# Stage 2: Final image
FROM registry.access.redhat.com/ubi8/openjdk-21

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION=3.5.0.Final \
    SERVER_HOME=/debezium \
    MAVEN_REPO_CENTRAL="https://repo1.maven.org/maven2"

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
VOLUME ["/debezium/config","/debezium/data"]

CMD ["/debezium/run.sh"]
