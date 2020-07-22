FROM registry.access.redhat.com/ubi8/openjdk-11

LABEL maintainer="Debezium Community"

#
# Set the version, home directory, and MD5 hash.
#
ENV DEBEZIUM_VERSION="1.2.1.Final" \
    SERVER_HOME=/debezium \
    SERVER_MD5=3f39de479ba7fc90316d127aa9b5f7d5
ENV SERVER_URL_PATH=io/debezium/debezium-server-dist/$DEBEZIUM_VERSION/debezium-server-dist-$DEBEZIUM_VERSION.tar.gz

#
# Create a user and home directory for Debezium Server
#
USER root
RUN groupadd -r debezium -g 1001 && \
    useradd -u 1001 -r -g debezium -m -d $SERVER_HOME -s /sbin/nologin -c "Debezium Server user" debezium && \
    chmod 755 $SERVER_HOME

#
# Change ownership and switch user
#
RUN chown -R debezium $SERVER_HOME && \
    chgrp -R debezium $SERVER_HOME
USER debezium

RUN mkdir $SERVER_HOME/conf && \
    mkdir $SERVER_HOME/data

#
# Download and install Debezium Server
#
RUN curl -fSL -o /tmp/debezium.tar.gz https://repo1.maven.org/maven2/$SERVER_URL_PATH

#
# Verify the contents and then install ...
#
RUN echo "$SERVER_MD5 /tmp/debezium.tar.gz" | md5sum -c - &&\
    tar -xzf /tmp/debezium.tar.gz -C $SERVER_HOME --strip-components 1 &&\
    rm -f /tmp/debezium.tar.gz

#
# Allow random UID to use Debezium Server
#
RUN chmod -R g+w,o+w $SERVER_HOME

# Set the working directory to the Debezium Server home directory
WORKDIR $SERVER_HOME

#
# Expose the ports and set up volumes for the data, transaction log, and configuration
#
EXPOSE 8080
VOLUME ["/debezium/conf","/debezium/data"]

CMD ["/debezium/run.sh"]
