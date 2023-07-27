ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.3

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.3.1.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=87ab8a260c73150267ba8e7822d50c55 \
    MYSQL_MD5=47d80c6955923deb7823c8c6c352864b \
    POSTGRES_MD5=548cf64bbb49c8dec4c0592c1e26f611 \
    SQLSERVER_MD5=9635b79adbfb1cb7bd97a67781286b76 \
    ORACLE_MD5=39fd3e04d7c6d2189f5284ccd7b44db8 \
    DB2_MD5=a432aef71031629d00b6fc7d9f8a06e4 \
    SPANNER_MD5=47958385e1c146d5b1487a35acf8f774 \
    VITESS_MD5=150502404cd97e55e4646f2ebc7778ef \
    JDBC_MD5=931e4d431b12b77eb26f1678dffe4d80 \
    KCRESTEXT_MD5=f818803063ba2a52bce63dc13dd39b28 \
    SCRIPTING_MD5=164bc18040572043df0ee4f1aca54f00

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional jdbc jdbc "$DEBEZIUM_VERSION" "$JDBC_MD5" && \
    docker-maven-download debezium-additional spanner spanner "$DEBEZIUM_VERSION" "$SPANNER_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional connect-rest-extension "$DEBEZIUM_VERSION" "$KCRESTEXT_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

