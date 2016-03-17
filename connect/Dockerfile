FROM debezium/kafka

MAINTAINER Debezium Community

EXPOSE 8083
VOLUME ["/kafka/data","/kafka/logs","/kafka/config"]

COPY docker-entrypoint.sh /
COPY log4j.properties $KAFKA_HOME/config/log4j.properties

#
# Add each of the plugins ...
#
ENV KAFKA_CONNECT_PLUGINS_DIR=$KAFKA_HOME/connect
RUN mkdir $KAFKA_CONNECT_PLUGINS_DIR;

ADD debezium-connector-mysql-0.1-SNAPSHOT-plugin.tar.gz $KAFKA_CONNECT_PLUGINS_DIR
    

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["start"]