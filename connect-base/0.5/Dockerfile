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
    function confluent_dep { curl -O http://packages.confluent.io/maven/io/confluent/$1/$CONFLUENT_VERSION/$1-$CONFLUENT_VERSION.jar;  echo "$2 $1-$CONFLUENT_VERSION.jar" >> sums.md5; };\
    function central_dep { curl -O http://central.maven.org/maven2/$1/$2/$3/$2-$3.jar; echo "$4 $2-$3.jar" >> sums.md5; };\
    confluent_dep kafka-connect-avro-converter b86e57cb52ccbc0cca061f0b2ed3f000 &&\
    confluent_dep kafka-avro-serializer 1ff69042fc7c4663725ef94dad516f83 &&\
    confluent_dep kafka-schema-registry-client 1fc1930fe6d58bb0e208cd9c4beb7e5c &&\
    confluent_dep common-config e33e5e4b485d409eab245a9cc8938dc3 &&\
    confluent_dep common-utils 09178eeff4d7ea39ab6337769cc41fd8 &&\
    central_dep org/codehaus/jackson jackson-core-asl $AVRO_JACKSON_VERSION 319c49a4304e3fa9fe3cd8dcfc009d37 &&\
    central_dep org/codehaus/jackson jackson-mapper-asl $AVRO_JACKSON_VERSION 1750f9c339352fc4b728d61b57171613 &&\
    central_dep org/apache/avro avro $AVRO_VERSION e910e3a3bad0181b1e2e55856cf3ce83 &&\
    cat sums.md5 &&\
    md5sum --strict -c sums.md5 &&\
    rm sums.md5
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["start"]
