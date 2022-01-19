FROM debezium/base

LABEL maintainer="Debezium Community"

#
# Set the version, home directory, and MD5 hash.
# MD5 hash taken from http://kafka.apache.org/downloads.html for this version of Kafka
# These argument defaults can be overruled during build time but compatibility cannot be guaranteed when the defaults are not used.
#
ARG KAFKA_VERSION=3.0.0
ARG SCALA_VERSION=2.12
ARG SHA512HASH="CB82E685A76FA6041DCB39A8519B4F3C1A16066E9D5D8EAB11A825B517D91F690ED9AF40492A11471265AE9C486017FD128492F867E3BE63EC7770D44F7E54D2"

ENV KAFKA_VERSION=$KAFKA_VERSION \
    SCALA_VERSION=$SCALA_VERSION \
    KAFKA_HOME=/kafka \
    SHA512HASH=$SHA512HASH \
    KAFKA_URL_PATH=kafka/$KAFKA_VERSION/kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz

ENV KAFKA_DATA=$KAFKA_HOME/data

#
# Create a user and home directory for Kafka
#
USER root
RUN groupadd -r kafka -g 1001 && useradd -u 1001 -r -g kafka -m -d $KAFKA_HOME -s /sbin/nologin -c "Kafka user" kafka && \
    chmod 755 $KAFKA_HOME
RUN mkdir $KAFKA_DATA && \
    mkdir $KAFKA_HOME/logs

#
# Change ownership and switch user
#
RUN chown -R kafka $KAFKA_HOME && \
    chgrp -R kafka $KAFKA_HOME

#
# Download Kafka
#
RUN curl -fSL -o /tmp/kafka.tgz $(curl --stderr /dev/null https://www.apache.org/dyn/closer.cgi\?as_json\=1 | sed -rn 's/.*"preferred":.*"(.*)"/\1/p')$KAFKA_URL_PATH || curl -fSL -o /tmp/kafka.tgz https://archive.apache.org/dist/$KAFKA_URL_PATH

#
# Verify the contents and then install ...
#
RUN echo "$SHA512HASH /tmp/kafka.tgz" | sha512sum -c - &&\
    tar -xzf /tmp/kafka.tgz -C $KAFKA_HOME --strip-components 1 &&\
    rm -f /tmp/kafka.tgz

#
# Remove potentially exploitable classes
# CVE-2021-4104/DBZ-4447 CVE-2019-17571
# DBZ-4568: CVE-2022-23302 CVE-2022-23305 CVE-2020-9493
#
RUN zip -d /kafka/libs/log4j-1.2.17.jar org/apache/log4j/net/JMSAppender.class org/apache/log4j/net/SocketServer.class org/apache/log4j/net/JMSSink.class 'org/apache/log4j/jdbc/*' 'org/apache/log4j/chainsaw/*'

COPY ./log4j.properties $KAFKA_HOME/config/log4j.properties
RUN mkdir $KAFKA_HOME/config.orig &&\
    mv $KAFKA_HOME/config/* $KAFKA_HOME/config.orig &&\
    chown -R kafka:kafka $KAFKA_HOME/config.orig

# Remove unnecessary files
RUN rm -f $KAFKA_HOME/libs/*-{sources,javadoc,scaladoc}.jar* &&\
    rm -r $KAFKA_HOME/site-docs

#
# The kafka-run-class.sh script generates the classpath for launching Kafka-related JVM, with entries
# containing the pattern "/bin/../libs", which fails to be resolved properly in some
# environments; the CLASSPATH is filled from "base_dir" environment variable that contains the relative
# path so it it is modified to contain absolute path using "realpath" command.
#
RUN sed -i 's/base_dir=\$(dirname \$0)\/../base_dir=\$(realpath \$(dirname \$0)\/..)/' $KAFKA_HOME/bin/kafka-run-class.sh

#
# Allow random UID to use Kafka
#
RUN chmod -R g+w,o+w $KAFKA_HOME

USER kafka

# Set the working directory to the Kafka home directory
WORKDIR $KAFKA_HOME

#
# Expose the ports and set up volumes for the data and logs directories
#
EXPOSE 9092
VOLUME ["/kafka/data","/kafka/logs","/kafka/config"]

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["start"]
