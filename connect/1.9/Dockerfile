ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:1.9

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.9.8.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=1ef769a555cc6f21e5be214d77c71397 \
    MYSQL_MD5=39278934508e77c63e679e1335583d99 \
    POSTGRES_MD5=36c94700f577b5f5c7591ee5eb97638f \
    SQLSERVER_MD5=5aad02c77fb54c358e3de8acee7a3e1d \
    ORACLE_MD5=8c24ec447339ea088d53696709a129e0 \
    DB2_MD5=cd02e2b4f5917b541708b9568f171477 \
    VITESS_MD5=9f469336b72cce540ace7a497c71eaf0 \
    SCRIPTING_MD5=b9f86468ef9901653392bc5ed5f9c457

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
