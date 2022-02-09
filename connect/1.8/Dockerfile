FROM debezium/connect-base:1.8

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.8.1.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=cc14a3ce989498a257550cb1f2a53c54 \
    MYSQL_MD5=61d26d24d7e85feb1fe347e6e2bd4364 \
    POSTGRES_MD5=f400dadbea68abf38eb143da8b88a339 \
    SQLSERVER_MD5=8881f904d44dc69d9a561af70e1ac100 \
    ORACLE_MD5=170de47100cc20ee36e96f0efacd7d15 \
    DB2_MD5=4b1164a842d323e55083ca5ae5f7db75 \
    VITESS_MD5=35a35027df92a1c0346d1d9cc584c4bc \
    SCRIPTING_MD5=5121a7b98bdeb43cbac6f9387bd2383c

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
