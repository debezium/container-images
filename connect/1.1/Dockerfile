FROM debezium/connect-base:1.1

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.1.0.CR1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPO_INCUBATOR="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=98dc2de15e571ec61c34044d69315084 \
    MYSQL_MD5=5b8c81a622bd01a367f936329c4e1247 \
    POSTGRES_MD5=0f757c01d8866bc925e99524c7d450c1 \
    SQLSERVER_MD5=200dc3d83202dff2ac790d04f77584a9 \
    ORACLE_MD5=8e594bfe36b296e7ee8009394f7e1588 \
    DB2_MD5=ab7849cb9c1c2e4d9ac23ea6b529af72

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-incubator db2 "$DEBEZIUM_VERSION" "$DB2_MD5"
