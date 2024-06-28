ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM localhost:5500/debeziumquay/kafka:3.0

LABEL maintainer="Debezium Community"

USER root
RUN microdnf -y install libaio && microdnf clean all

USER kafka

EXPOSE 8083 8778
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
    APICURIO_VERSION=2.4.1.Final \
    JOLOKIA_VERSION=1.7.2 \
    OPENTELEMETRY_VERSION=1.23.1 \
    OPENTELEMETRY_INSTRUMENTATION_VERSION=1.23.0

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
RUN docker-maven-download apicurio "$APICURIO_VERSION" ead18a95038adca54e91b7f253717eb7
RUN docker-maven-download central org/jolokia jolokia-jvm "$JOLOKIA_VERSION" d489d62d1143e6a2e85a869a4b824a67
RUN docker-maven-download otel io/opentelemetry opentelemetry-api "$OPENTELEMETRY_VERSION" e198a9568ce31a82faaa26f328388e89
RUN docker-maven-download otel io/opentelemetry opentelemetry-context "$OPENTELEMETRY_VERSION" 783594a506dbf035e686776d5bcb4bfc
RUN docker-maven-download otel io/opentelemetry opentelemetry-semconv "$OPENTELEMETRY_VERSION"-alpha dab8c00d4eaa453315d9a3da0d63c49a
RUN docker-maven-download otel io/opentelemetry/instrumentation opentelemetry-instrumentation-api "$OPENTELEMETRY_INSTRUMENTATION_VERSION" e4069a077dd8d6206c540222d08769e2
RUN docker-maven-download otel io/opentelemetry/instrumentation opentelemetry-instrumentation-api-semconv "$OPENTELEMETRY_INSTRUMENTATION_VERSION"-alpha f4b8065fd7b451cea6bfb3c0bf235d26
RUN docker-maven-download otel io/opentelemetry/instrumentation opentelemetry-kafka-clients-2.6 "$OPENTELEMETRY_INSTRUMENTATION_VERSION"-alpha 5d6e5ba9ea90adacf66e3f471596933b
RUN docker-maven-download otel io/opentelemetry/instrumentation opentelemetry-kafka-clients-common "$OPENTELEMETRY_INSTRUMENTATION_VERSION"-alpha f37131795d53faa6423173926629d04d


ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["start"]
