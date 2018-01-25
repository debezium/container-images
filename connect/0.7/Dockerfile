FROM debezium/connect-base:0.7

MAINTAINER Debezium Community

ENV DEBEZIUM_VERSION=0.7.2 \
    MAVEN_CENTRAL="https://repo1.maven.org/maven2" \
    MD5SUMS="MONGODB_MD5=7c6feee89fd0ce004c0ffb23c867ab41 MYSQL_MD5=74d234e64f02bf059fd4c8536f636cec POSTGRES_MD5=e89c97db4e3300b0cba523b2c6be2ee5"

#
# Download connectors, verify the contents, and then install into the `$KAFKA_CONNECT_PLUGINS_DIR/debezium` directory...
#
RUN eval $MD5SUMS &&\
    for CONNECTOR in {mysql,mongodb,postgres}; do \
    curl -fSL -o /tmp/plugin.tar.gz \
                 $MAVEN_CENTRAL/io/debezium/debezium-connector-$CONNECTOR/$DEBEZIUM_VERSION/debezium-connector-$CONNECTOR-$DEBEZIUM_VERSION-plugin.tar.gz &&\
    declare MD5_PARAM_NAME="${CONNECTOR^^}_MD5" &&\
    echo "${!MD5_PARAM_NAME}  /tmp/plugin.tar.gz" | md5sum -c - &&\
    tar -xzf /tmp/plugin.tar.gz -C $KAFKA_CONNECT_PLUGINS_DIR &&\
    rm -f /tmp/plugin.tar.gz; \
    done;
