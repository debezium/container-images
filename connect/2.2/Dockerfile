ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.2

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.2.0.Alpha1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=bf3854d84250b1cc92e7c31959a22ce5 \
    MYSQL_MD5=dd440be4609dc1e1b31e12fdb5bd24d3 \
    POSTGRES_MD5=dd18a4c53e8176cdf81c1f833cfde5cc \
    SQLSERVER_MD5=965d493ac642c014962a3044e064bf13 \
    ORACLE_MD5=7f1129930b850a04ac172ecad93a065b \
    DB2_MD5=247863666ee59decc41d74e7e3c1ce66 \
    SPANNER_MD5=fee7242566333ae84725ebbc054ea67b \
    VITESS_MD5=d368ac98d4dd06786d64d9f4e4329e1a \
    KCRESTEXT_MD5=f776ce1c8ea023f8bbc731d54521ab56 \
    SCRIPTING_MD5=9d68f1f751aa08657c6bd3f24b307d31

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional spanner spanner "$DEBEZIUM_VERSION" "$SPANNER_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional connect-rest-extension "$DEBEZIUM_VERSION" "$KCRESTEXT_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

