FROM debezium/connect-base:0.7

MAINTAINER Debezium Community

ARG DEBEZIUM_VERSION=0.7.5
ENV DEBEZIUM_VERSION=${DEBEZIUM_VERSION}

# -------- testing ---------
COPY debezium-connector-mysql-$DEBEZIUM_VERSION-SNAPSHOT-plugin.tar.gz $KAFKA_CONNECT_PLUGINS_DIR/debezium-mysql-plugin.tar.gz
COPY debezium-connector-mongodb-$DEBEZIUM_VERSION-SNAPSHOT-plugin.tar.gz $KAFKA_CONNECT_PLUGINS_DIR/debezium-mongodb-plugin.tar.gz
COPY debezium-connector-postgres-$DEBEZIUM_VERSION-SNAPSHOT-plugin.tar.gz $KAFKA_CONNECT_PLUGINS_DIR/debezium-postgres-plugin.tar.gz

RUN for CONNECTOR in {mysql,mongodb,postgres}; do \
    tar -xzf $KAFKA_CONNECT_PLUGINS_DIR/debezium-$CONNECTOR-plugin.tar.gz -C $KAFKA_CONNECT_PLUGINS_DIR; \
    done;
