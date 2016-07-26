FROM debezium/kafka:0.2

MAINTAINER Debezium Community

EXPOSE 8083
VOLUME ["/kafka/data","/kafka/logs","/kafka/config"]

COPY docker-entrypoint.sh /
COPY log4j.properties $KAFKA_HOME/config/log4j.properties

#
# Set up the plugins directory ...
#
ENV KAFKA_CONNECT_PLUGINS_DIR=$KAFKA_HOME/connect \
    DEBEZIUM_VERSION=0.2.3 \
    MAVEN_CENTRAL="https://repo1.maven.org/maven2"

RUN mkdir $KAFKA_CONNECT_PLUGINS_DIR;

#
# Download MySQL connector, verify the contents, and then install ...
#
RUN curl -fSL -o /tmp/plugin.tar.gz \
                 $MAVEN_CENTRAL/io/debezium/debezium-connector-mysql/$DEBEZIUM_VERSION/debezium-connector-mysql-$DEBEZIUM_VERSION-plugin.tar.gz &&\
    echo "79fb712ecab63dfa36bad2d2250f1598  /tmp/plugin.tar.gz" | md5sum -c - &&\
    tar -xzf /tmp/plugin.tar.gz -C $KAFKA_CONNECT_PLUGINS_DIR &&\
    rm -f /tmp/plugin.tar.gz    

#
# Future: download 

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["start"]