FROM debezium/connect-base:1.2

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.2.3.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPO_INCUBATOR="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=98126afc51d5875ab1112e0abf77a329 \
    MYSQL_MD5=0a406ed4af56fb9fa532af14f0607644 \
    POSTGRES_MD5=be29d79f77b1f182178f86a7e536f4dd \
    SQLSERVER_MD5=b55e2b8ae1cf821319ad372ea711715b \
    ORACLE_MD5=6ee2e36662914f6cbf9c24e516ad8e8d \
    DB2_MD5=e8dcb51c9193e8820405e90f0a602279

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-incubator db2 "$DEBEZIUM_VERSION" "$DB2_MD5"
