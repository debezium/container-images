ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.0

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.0.7.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=5850dc63cfaf43d334033800c2360426 \
    MYSQL_MD5=96088966d264660f09db6d88b8cc6180 \
    MARIADB_MD5=2b510e1433dd6487f2070c6c5cb80063 \
    POSTGRES_MD5=1a92e55fe78bc44a302e45da2f1233db \
    SQLSERVER_MD5=3d4c17f637e9d87d9e0d726afbd264ce \
    ORACLE_MD5=5b431894196c539eae3a7b9003448f8b \
    DB2_MD5=21e071f476d0fc8d817997e0c4e1be5b \
    SPANNER_MD5=371465da822130f726bc1caa05c05a6c \
    VITESS_MD5=3a1099dd257b1a6a6609980cf83b0026 \
    JDBC_MD5=5ad6d19381cd56fa83542388998978bf \
    INFORMIX_MD5=9fcbe89a5e2ac6ff91c2dacb82917878 \
    IBMI_MD5=6197146cb73dec0998a06a5d06a2d942 \
    KCRESTEXT_MD5=6bb9beea391eefa1f4c3ca103fcf2069 \
    SCRIPTING_MD5=8026bd27fa997bc203e8393d647595b8

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
    docker-maven-download debezium-optional connect-rest-extension "$DEBEZIUM_VERSION" "$KCRESTEXT_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

