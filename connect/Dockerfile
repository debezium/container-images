FROM debezium/kafka

MAINTAINER Debezium Community

EXPOSE 8083
VOLUME ["/kafka/data","/kafka/logs","/kafka/config"]

COPY docker-entrypoint.sh /
COPY log4j.properties $KAFKA_HOME/config/log4j.properties

#
# Set up the plugins directory ...
#
ENV KAFKA_CONNECT_PLUGINS_DIR=$KAFKA_HOME/connect \
    DEBEZIUM_VERSION=0.1.0 \
    DEBEZIUM_MAVEN_CENTRAL="https://repo1.maven.org/maven2/io/debezium"
RUN mkdir $KAFKA_CONNECT_PLUGINS_DIR;

#
# Download MySQL connector, verify the contents, and then install ...
#
RUN curl -fSL -o /tmp/plugin.tar.gz \
                 $DEBEZIUM_MAVEN_CENTRAL/debezium-connector-mysql/$DEBEZIUM_VERSION/debezium-connector-mysql-$DEBEZIUM_VERSION-plugin.tar.gz &&\
    echo "ab7c64402bd5531e0b87c5c4c02650b0  /tmp/plugin.tar.gz" | md5sum -c - &&\
    tar -xzf /tmp/plugin.tar.gz -C $KAFKA_CONNECT_PLUGINS_DIR &&\
    rm -f /tmp/plugin.tar.gz    

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["start"]