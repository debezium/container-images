FROM debezium/connect-base:1.2

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.2.0.Beta1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPO_INCUBATOR="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=2776a08890562d6648fb768950b3a2c4 \
    MYSQL_MD5=88837eacd09d2fd10afceae761c5ae4d \
    POSTGRES_MD5=5bf813ee82a287fe1f845c5b574b04e2 \
    SQLSERVER_MD5=62420a7a1b39a62419752b32ca47ac4c \
    ORACLE_MD5=67283ec1d55992233e30d9d4689573f9 \
    DB2_MD5=d55ec629b58d715156b252279512e384

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-incubator db2 "$DEBEZIUM_VERSION" "$DB2_MD5"
