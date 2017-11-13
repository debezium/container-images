FROM debezium/kafka:0.6

MAINTAINER Debezium Community

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

RUN cd $KAFKA_HOME/libs &&\
    function confluent_dep { curl -O http://packages.confluent.io/maven/io/confluent/$1/$CONFLUENT_VERSION/$1-$CONFLUENT_VERSION.jar;  echo "$2 $1-$CONFLUENT_VERSION.jar" >> sums.md5; };\
    function central_dep { curl -O http://central.maven.org/maven2/$1/$2/$3/$2-$3.jar; echo "$4 $2-$3.jar" >> sums.md5; };\
    confluent_dep kafka-connect-avro-converter e0e9a4d0019d98ee8019f57b4e19fd55 &&\
    confluent_dep kafka-avro-serializer 1101acaf823989c9380d25341e3e6699 &&\
    confluent_dep kafka-schema-registry-client fd8fd29149af57a12df2893ed37ce6ce &&\
    confluent_dep common-config 8fe545b0c591f4cfc94d42599d8d3339 &&\
    confluent_dep common-utils 9f560d2954805f3204bec71350a390b4 &&\
    central_dep org/codehaus/jackson jackson-core-asl $AVRO_JACKSON_VERSION 319c49a4304e3fa9fe3cd8dcfc009d37 &&\
    central_dep org/codehaus/jackson jackson-mapper-asl $AVRO_JACKSON_VERSION 1750f9c339352fc4b728d61b57171613 &&\
    central_dep org/apache/avro avro $AVRO_VERSION 10395e5a571e1a1f6113411f276d2fea &&\
    cat sums.md5 &&\
    md5sum --strict -c sums.md5 &&\
    rm sums.md5
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["start"]
