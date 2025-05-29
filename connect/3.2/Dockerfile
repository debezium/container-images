ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.2

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.2.0.Beta1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=5d3419d72bc955d15da1d87c4350ff52 \
    MYSQL_MD5=ef7c609265cc88e06c017c7ca83e2575 \
    MARIADB_MD5=135f67d3bf4ef4914be5b845b1e9d7f3 \
    POSTGRES_MD5=816568a3ca4b14c151bd8c07f034fb96 \
    SQLSERVER_MD5=bec1c38605abb6469e719bec3d145c16 \
    ORACLE_MD5=edc62095d5451d69ea9b09b79a81fd65 \
    DB2_MD5=c738fca81678b5aa26927ee11593af3e \
    SPANNER_MD5=902c07a9aacef91f8876401986cd68c7 \
    VITESS_MD5=5cce4fed3d011070fe959bc486ae419d \
    JDBC_MD5=19a933ed52a7fb8c1bea42552469da2f \
    INFORMIX_MD5=a1c9d478fcf3484de2c903f14382b590 \
    IBMI_MD5=702665de0526b52cdffafa7adbb9ea48 \
    SCRIPTING_MD5=729e5e84223a6f1c3ef74e5ffc472108

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium mariadb "$DEBEZIUM_VERSION" "$MARIADB_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium jdbc "$DEBEZIUM_VERSION" "$JDBC_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional spanner spanner "$DEBEZIUM_VERSION" "$SPANNER_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-additional informix informix "$DEBEZIUM_VERSION" "$INFORMIX_MD5" && \
    docker-maven-download debezium-additional ibmi ibmi "$DEBEZIUM_VERSION" "$IBMI_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

