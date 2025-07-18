# Stage 1: Build stage
FROM registry.access.redhat.com/ubi8/openjdk-21 AS builder

LABEL maintainer="Debezium Community"

#
# Set the version, home directory, and MD5 hash.
#
ENV DEBEZIUM_VERSION=3.2.0.Final \
    SERVER_HOME=/debezium \
    MAVEN_REPO_CENTRAL="https://repo1.maven.org/maven2"
ENV SERVER_URL_PATH=io/debezium/debezium-server-dist/$DEBEZIUM_VERSION/debezium-server-dist-$DEBEZIUM_VERSION.tar.gz \
    SERVER_MD5=ea6ae2946ea220a443a098fb777aafeb

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
# Allow random UID to use Debezium Server
#
RUN chmod -R g+w,o+w $SERVER_HOME

# Stage 2: Final image
FROM registry.access.redhat.com/ubi8/openjdk-21

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION=3.2.0.Final \
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
