FROM debezium/connect-base:0.9

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION=0.9.5.Final \
    MAVEN_REPO_CORE="https://repo1.maven.org/maven2" \
    MAVEN_REPO_INCUBATOR="https://repo1.maven.org/maven2" \
    MD5SUMS="MONGODB_MD5=a9bde9c4173d4c4f3c0adc9d97a795ee MYSQL_MD5=720b1396358fbdc59bce953f47d3c53f POSTGRES_MD5=a838ae664b7d8d050419d3e638e64273 SQLSERVER_MD5=f21ef11e7b3e34736d428eb1d6ce5450 ORACLE_MD5=1b93c90502d5d369e5a7173759de2504"

#
# Download connectors, verify the contents, and then install into the `$KAFKA_CONNECT_PLUGINS_DIR/debezium` directory...
#
RUN eval $MD5SUMS &&\
    for CONNECTOR in {mysql,mongodb,postgres,sqlserver}; do \
    curl -fSL -o /tmp/plugin.tar.gz \
                 $MAVEN_REPO_CORE/io/debezium/debezium-connector-$CONNECTOR/$DEBEZIUM_VERSION/debezium-connector-$CONNECTOR-$DEBEZIUM_VERSION-plugin.tar.gz &&\
    declare MD5_PARAM_NAME="${CONNECTOR^^}_MD5" &&\
    echo "${!MD5_PARAM_NAME}  /tmp/plugin.tar.gz" | md5sum -c - &&\
    tar -xzf /tmp/plugin.tar.gz -C $KAFKA_CONNECT_PLUGINS_DIR &&\
    rm -f /tmp/plugin.tar.gz; \
    done;
RUN eval $MD5SUMS &&\
    for CONNECTOR in oracle; do \
    curl -fSL -o /tmp/plugin.tar.gz \
                 $MAVEN_REPO_INCUBATOR/io/debezium/debezium-connector-$CONNECTOR/$DEBEZIUM_VERSION/debezium-connector-$CONNECTOR-$DEBEZIUM_VERSION-plugin.tar.gz &&\
    declare MD5_PARAM_NAME="${CONNECTOR^^}_MD5" &&\
    echo "${!MD5_PARAM_NAME}  /tmp/plugin.tar.gz" | md5sum -c - &&\
    tar -xzf /tmp/plugin.tar.gz -C $KAFKA_CONNECT_PLUGINS_DIR &&\
    rm -f /tmp/plugin.tar.gz; \
    done;
