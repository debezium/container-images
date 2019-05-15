FROM debezium/connect-base:0.9

LABEL maintainer="Debezium Community"

ARG DEBEZIUM_VERSION=0.9.5.Final
ENV DEBEZIUM_VERSION=${DEBEZIUM_VERSION}

# -------- testing ---------
COPY debezium-connector-mysql-$DEBEZIUM_VERSION-SNAPSHOT-plugin.tar.gz $KAFKA_CONNECT_PLUGINS_DIR/debezium-mysql-plugin.tar.gz
COPY debezium-connector-mongodb-$DEBEZIUM_VERSION-SNAPSHOT-plugin.tar.gz $KAFKA_CONNECT_PLUGINS_DIR/debezium-mongodb-plugin.tar.gz
COPY debezium-connector-postgres-$DEBEZIUM_VERSION-SNAPSHOT-plugin.tar.gz $KAFKA_CONNECT_PLUGINS_DIR/debezium-postgres-plugin.tar.gz
COPY debezium-connector-oracle-$DEBEZIUM_VERSION-SNAPSHOT-plugin.tar.gz $KAFKA_CONNECT_PLUGINS_DIR/debezium-oracle-plugin.tar.gz
COPY debezium-connector-sqlserver-$DEBEZIUM_VERSION-SNAPSHOT-plugin.tar.gz $KAFKA_CONNECT_PLUGINS_DIR/debezium-sqlserver-plugin.tar.gz

RUN for CONNECTOR in {mysql,mongodb,postgres,oracle,sqlserver}; do \
    tar -xzf $KAFKA_CONNECT_PLUGINS_DIR/debezium-$CONNECTOR-plugin.tar.gz -C $KAFKA_CONNECT_PLUGINS_DIR; \
    done;
