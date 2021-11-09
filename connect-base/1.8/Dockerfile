FROM debezium/kafka:1.8

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
    CONFLUENT_VERSION=6.0.2 \
    AVRO_VERSION=1.9.2 \
    APICURIO_VERSION=2.0.2.Final

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
RUN docker-maven-download confluent kafka-connect-avro-converter "$CONFLUENT_VERSION" 4671dec77c8af4689e20419538e7b915 && \
    docker-maven-download confluent kafka-connect-avro-data "$CONFLUENT_VERSION" 5dc1111ccc4dc9c57397a2c298e6a221 && \
    docker-maven-download confluent kafka-avro-serializer "$CONFLUENT_VERSION" 5bb0c8078919e5aed55e9b59323a661e && \
    docker-maven-download confluent kafka-schema-serializer "$CONFLUENT_VERSION" 907f384780d9b75e670e6a5f4f522873 && \
    docker-maven-download confluent kafka-schema-registry-client "$CONFLUENT_VERSION" 727ef72bcc04c7a8dbf2439edf74ed38 && \
    docker-maven-download confluent common-config "$CONFLUENT_VERSION" 0cfba1fc7203305ed25bd67b29b6f094 && \
    docker-maven-download confluent common-utils "$CONFLUENT_VERSION" a940fcd0449613f956127f16cdea9935 && \
    docker-maven-download central org/apache/avro avro "$AVRO_VERSION" cb70195f70f52b27070f9359b77690bb && \
    docker-maven-download apicurio "$APICURIO_VERSION" c1a1e18f25c9b3d43c4a7feac728b2af

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["start"]
