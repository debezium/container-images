FROM debezium/kafka:1.3

LABEL maintainer="Debezium Community"

EXPOSE 8083
VOLUME ["/kafka/data","/kafka/logs","/kafka/config"]

COPY docker-entrypoint.sh /
COPY log4j.properties $KAFKA_HOME/config/log4j.properties
COPY docker-maven-download.sh /usr/local/bin/docker-maven-download

#
# Set up the plugins directory ...
#
ENV KAFKA_CONNECT_PLUGINS_DIR=$KAFKA_HOME/connect \
    EXTERNAL_LIBS_DIR=$KAFKA_HOME/external_libs \
    CONNECT_PLUGIN_PATH=$KAFKA_CONNECT_PLUGINS_DIR \
    MAVEN_DEP_DESTINATION=$KAFKA_HOME/libs \
    CONFLUENT_VERSION=5.5.1 \
    AVRO_VERSION=1.9.2 \
    AVRO_JACKSON_VERSION=1.9.13 \
    APICURIO_VERSION=1.2.2.Final

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
RUN docker-maven-download confluent kafka-connect-avro-converter "$CONFLUENT_VERSION" 9c1846872e6706166b7f2d7ae3922d3e && \
    docker-maven-download confluent kafka-connect-avro-data "$CONFLUENT_VERSION" 08579b13feb7421de5a7774fd16223db && \
    docker-maven-download confluent kafka-avro-serializer "$CONFLUENT_VERSION" 6f3673e5d6028136bf7e206f42aecb59 && \
    docker-maven-download confluent kafka-schema-serializer "$CONFLUENT_VERSION" 0f8db6e28b0f21aa999ec72ca50c0192 && \
    docker-maven-download confluent kafka-schema-registry-client "$CONFLUENT_VERSION" fdf60e3774342726dafddeb33962dfde && \
    docker-maven-download confluent common-config "$CONFLUENT_VERSION" 73d3339e57b1cd0c433daf98f9cb2c88 && \
    docker-maven-download confluent common-utils "$CONFLUENT_VERSION" b837b31f144799698c53c93e3ac82bba && \
    docker-maven-download central org/codehaus/jackson jackson-core-asl "$AVRO_JACKSON_VERSION" 319c49a4304e3fa9fe3cd8dcfc009d37 && \
    docker-maven-download central org/codehaus/jackson jackson-mapper-asl "$AVRO_JACKSON_VERSION" 1750f9c339352fc4b728d61b57171613 && \
    docker-maven-download central org/apache/avro avro "$AVRO_VERSION" cb70195f70f52b27070f9359b77690bb && \
    docker-maven-download apicurio "$APICURIO_VERSION" 2a872aa67d1e2264d4bb87d1cfaba7f2

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["start"]
