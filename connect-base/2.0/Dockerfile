FROM debezium/kafka:2.0

LABEL maintainer="Debezium Community"

USER root
RUN microdnf -y install libaio && microdnf clean all

USER kafka

EXPOSE 8083
VOLUME ["/kafka/data","/kafka/logs","/kafka/config"]

COPY docker-entrypoint.sh /
COPY --chown=kafka:kafka log4j.properties $KAFKA_HOME/config/log4j.properties
COPY docker-maven-download.sh /usr/local/bin/docker-maven-download

#
# Set up the plugins directory ...
#
ENV KAFKA_CONNECT_PLUGINS_DIR=$KAFKA_HOME/connect \
    EXTERNAL_LIBS_DIR=$KAFKA_HOME/external_libs \
    CONNECT_PLUGIN_PATH=$KAFKA_CONNECT_PLUGINS_DIR \
    MAVEN_DEP_DESTINATION=$KAFKA_HOME/libs \
    AVRO_VERSION=1.10.1 \
    APICURIO_VERSION=2.1.5.Final \
    GUAVA_VERSION=31.0.1-jre

RUN mkdir "$KAFKA_CONNECT_PLUGINS_DIR" "$EXTERNAL_LIBS_DIR"

#
# The `docker-entrypoint.sh` script will automatically discover the child directories
# within the $KAFKA_CONNECT_PLUGINS_DIR directory (e.g., `/kafka/connect`), and place
# all of the files in those child directories onto the Java classpath.
#
# The general recommendation is to create a separate child directory for each connector
# (e.g., "debezium-connector-mysql"), and to place that connector's JAR files
# and other resource files in that child directory.
#
# However, use a single directory for connectors when those connectors share dependencies.
# This will prevent the classes in the shared dependencies from appearing in multiple JARs
# on the classpath, which results in arcane NoSuchMethodError exceptions.
#
RUN docker-maven-download central org/apache/avro avro "$AVRO_VERSION" 35469fee6d74ecbadce4773bfe3a204c && \
    docker-maven-download apicurio "$APICURIO_VERSION" bd7adf3f599968db4529fe4592d07bc8 && \
    docker-maven-download central com/google/guava guava "$GUAVA_VERSION" bb811ca86cba6506cca5d415cd5559a7

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["start"]
