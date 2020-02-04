FROM debezium/connect-base:1.1

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.1.0.Alpha1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPO_INCUBATOR="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=fd48bad6c7b9d411946d400a112d372e \
    MYSQL_MD5=15398c0004b888572d1261bb7681f27c \
    POSTGRES_MD5=8e72fa0ed1231597ab7f67204d53751b \
    SQLSERVER_MD5=1df7d2775823fa5bdc9cc840be92de9b \
    ORACLE_MD5=e400b21724e5d02142e9eb0a9461ff1f \
    DB2_MD5=TBD

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-incubator db2 "$DEBEZIUM_VERSION" "$DB2_MD5"
