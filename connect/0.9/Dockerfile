FROM debezium/connect-base:0.9

MAINTAINER Debezium Community

ENV DEBEZIUM_VERSION=0.9.0.CR1 \
    MAVEN_REPO_CORE="https://repo1.maven.org/maven2" \
    MAVEN_REPO_INCUBATOR="https://repo1.maven.org/maven2" \
    MD5SUMS="MONGODB_MD5=cf975a3dd583f125bb3643b0481c9c13 MYSQL_MD5=48632be243d5e26d91b6fb540879a278 POSTGRES_MD5=64abbecdf3ec2a98261d737785814052 SQLSERVER_MD5=082ae0bb20f43d0354c964d53c036bfd ORACLE_MD5=d273d6caa509c9baf45f692770d74280"

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
