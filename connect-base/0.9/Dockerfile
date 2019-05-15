FROM debezium/kafka:0.9

LABEL maintainer="Debezium Community"

EXPOSE 8083
VOLUME ["/kafka/data","/kafka/logs","/kafka/config"]

COPY docker-entrypoint.sh /
COPY log4j.properties $KAFKA_HOME/config/log4j.properties

#
# Set up the plugins directory ...
#
ENV KAFKA_CONNECT_PLUGINS_DIR=$KAFKA_HOME/connect \
    CONNECT_PLUGIN_PATH=$KAFKA_CONNECT_PLUGINS_DIR
RUN mkdir $KAFKA_CONNECT_PLUGINS_DIR;

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
# hadolint ignore=DL3003
RUN cd "$KAFKA_HOME/libs" &&\
    confluent_dep() { curl -O "http://packages.confluent.io/maven/io/confluent/$1/$CONFLUENT_VERSION/$1-$CONFLUENT_VERSION.jar";  echo "$2 $1-$CONFLUENT_VERSION.jar" >> sums.md5; } &&\
    central_dep() { curl -O "http://central.maven.org/maven2/$1/$2/$3/$2-$3.jar"; echo "$4 $2-$3.jar" >> sums.md5; } &&\
    confluent_dep kafka-connect-avro-converter b6b8507bdc518d8c3d7d4a62b6140977 &&\
    confluent_dep kafka-avro-serializer 464857f51204412996e2bb81d67a94e8 &&\
    confluent_dep kafka-schema-registry-client e3078fa805dd793e9d97d2bf395d037a &&\
    confluent_dep common-config 4ee0fb996cea8691196c4187876b388b &&\
    confluent_dep common-utils 7aef21c3824f218252b8f2383c71840f &&\
    central_dep org/codehaus/jackson jackson-core-asl "$AVRO_JACKSON_VERSION" 319c49a4304e3fa9fe3cd8dcfc009d37 &&\
    central_dep org/codehaus/jackson jackson-mapper-asl "$AVRO_JACKSON_VERSION" 1750f9c339352fc4b728d61b57171613 &&\
    central_dep org/apache/avro avro "$AVRO_VERSION" 10395e5a571e1a1f6113411f276d2fea &&\
    cat sums.md5 &&\
    md5sum --strict -c sums.md5 &&\
    rm sums.md5

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["start"]
