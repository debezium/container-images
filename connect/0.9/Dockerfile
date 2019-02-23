FROM debezium/connect-base:0.9

MAINTAINER Debezium Community

ENV DEBEZIUM_VERSION=0.9.2.Final \
    MAVEN_REPO_CORE="https://repo1.maven.org/maven2" \
    MAVEN_REPO_INCUBATOR="https://repo1.maven.org/maven2" \
    MD5SUMS="MONGODB_MD5=20e4721b480d8d4d7a885fef971c8030 MYSQL_MD5=8d7276713b55549ee985febda5fe7128 POSTGRES_MD5=c156fad668c1cd277ed7d2a42a1c29c3 SQLSERVER_MD5=552311fcb0fd963adbd6c2b5ae635da2 ORACLE_MD5=49a2a4187cccc6fa6706b31c4b7e4cd1"

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
