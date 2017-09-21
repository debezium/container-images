FROM debezium/connect-base:0.7

MAINTAINER Debezium Community

ENV DEBEZIUM_VERSION=0.6.0 \
    MAVEN_CENTRAL="https://repo1.maven.org/maven2" \
    MD5SUMS="MONGODB_MD5=9b9a374b57eaf7b29dcf5dd9e187b57e MYSQL_MD5=15dfdbcbf0c1b0e1ab67d25ef31db861 POSTGRES_MD5=457defff04ca562268509d6a46c1af82"

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
