ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.7

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.6.0.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=bb2e662c2114685f0f117b9fad109c85 \
    MYSQL_MD5=b6740897423afc33ffe7c384a35c9da4 \
    MARIADB_MD5=79cb54b05a66a56c92f3a75bf2ebd1ff \
    POSTGRES_MD5=8aff333b98803af027d5c0c13f99423e \
    SQLSERVER_MD5=5c84cbaeaafd30b2ac54415f24b09313 \
    ORACLE_MD5=5c57dae0922b484fddfcaa3696abfeaa \
    DB2_MD5=861581a0142443f48a42b5ae446b3b25 \
    SPANNER_MD5=116d03d40e53d4a8c6fe3e0e3a02ba91 \
    VITESS_MD5=2537d8f2a75316b537fa1f42ae684b9c \
    JDBC_MD5=ada834448f890fafe4cefa2372b01bf1 \
    INFORMIX_MD5=d9901289b1082a8aae33f605b229c7a1 \
    IBMI_MD5=0af2cdfba93bf4aebaa72f3beb98c9f3 \
    COCKROACHDB_MD5=c4c4f741453bcb57770c63827d1badfe \
    SCRIPTING_MD5=04f2b3fae6e8380939b97d4642798df0 \
    CHRONICLE_QUEUE_MD5=d1538ec6a31af009788134316f1c6ef0

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
    docker-maven-download debezium-additional cockroachdb cockroachdb "$DEBEZIUM_VERSION" "$COCKROACHDB_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5" && \
    docker-maven-download debezium-store storage-chronicle-queue "$DEBEZIUM_VERSION" "$CHRONICLE_QUEUE_MD5"

