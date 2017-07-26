FROM debezium/kafka:0.5

MAINTAINER Debezium Community

EXPOSE 8083
VOLUME ["/kafka/data","/kafka/logs","/kafka/config"]

COPY docker-entrypoint.sh /
COPY log4j.properties $KAFKA_HOME/config/log4j.properties

#
# Set up the plugins directory ...
#
ENV KAFKA_CONNECT_PLUGINS_DIR=$KAFKA_HOME/connect
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

RUN cd $KAFKA_HOME/libs &&\
    curl -O http://packages.confluent.io/maven/io/confluent/kafka-connect-avro-converter/$CONFLUENT_VERSION/kafka-connect-avro-converter-$CONFLUENT_VERSION.jar &&\
    curl -O http://packages.confluent.io/maven/io/confluent/kafka-avro-serializer/$CONFLUENT_VERSION/kafka-avro-serializer-$CONFLUENT_VERSION.jar &&\
    curl -O http://packages.confluent.io/maven/io/confluent/kafka-schema-registry-client/$CONFLUENT_VERSION/kafka-schema-registry-client-$CONFLUENT_VERSION.jar &&\
    curl -O http://packages.confluent.io/maven/io/confluent/kafka-avro-serializer/$CONFLUENT_VERSION/kafka-avro-serializer-$CONFLUENT_VERSION.jar &&\
    curl -O http://packages.confluent.io/maven/io/confluent/common-config/$CONFLUENT_VERSION/common-config-$CONFLUENT_VERSION.jar &&\
    curl -O http://packages.confluent.io/maven/io/confluent/common-utils/$CONFLUENT_VERSION/common-utils-$CONFLUENT_VERSION.jar &&\
    curl -O http://central.maven.org/maven2/org/codehaus/jackson/jackson-core-asl/1.9.13/jackson-core-asl-1.9.13.jar &&\
    curl -O http://central.maven.org/maven2/org/codehaus/jackson/jackson-mapper-asl/1.9.13/jackson-mapper-asl-1.9.13.jar &&\
    curl -O http://central.maven.org/maven2/org/apache/avro/avro/$AVRO_VERSION/avro-$AVRO_VERSION.jar
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["start"]
