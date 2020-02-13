FROM debezium/connect-base:1.1

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.1.0.Beta2" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPO_INCUBATOR="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=f18b00ffa870a4962e601f7ad0231c2f \
    MYSQL_MD5=91c286d2ed68d6f25f1d17132260dc5a \
    POSTGRES_MD5=f4c685e817868606d98ac52a9a24b06f \
    SQLSERVER_MD5=a0cb1f95d01853496fd5e8f70d4cce48 \
    ORACLE_MD5=a4c938fdfe2560c90e6db08f0fea74dc \
    DB2_MD5=31e2b88f0e9af3841faa82c9851c4403

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-incubator db2 "$DEBEZIUM_VERSION" "$DB2_MD5"
