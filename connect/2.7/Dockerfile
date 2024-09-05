ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.7

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.7.2.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=cde35b0e824f402fb3dc4a4b12d66f32 \
    MYSQL_MD5=51aeafe856ed6ba18b644952d091fbc2 \
    MARIADB_MD5=3bf82eb59ab1093e1af9ad651ea91ac9 \
    POSTGRES_MD5=1612a63ca911b17eaec6a52cf3e2c84b \
    SQLSERVER_MD5=763ef5664e11305a8fe3ae40b6231483 \
    ORACLE_MD5=ffe13e4be8d0cdc2a60c1c786676a302 \
    DB2_MD5=35c8469d63baf8a7d5d40b9f778c1610 \
    SPANNER_MD5=e226a91536dfd04515d8018444f2b3be \
    VITESS_MD5=429d670ceebc0240196c3cc0acb41aae \
    JDBC_MD5=823aba2cb4092dc0140d29002378bb59 \
    INFORMIX_MD5=96303d43f01f2fcda560ef9f7d4e1f95 \
    IBMI_MD5=1ab38e228a05771516a80e8ae4bdb337 \
    KCRESTEXT_MD5=1104f539892e1543bdbd817f7d32a760 \
    SCRIPTING_MD5=906e2364e8d26b71237ece554723772a

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium mariadb "$DEBEZIUM_VERSION" "$MARIADB_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional jdbc jdbc "$DEBEZIUM_VERSION" "$JDBC_MD5" && \
    docker-maven-download debezium-additional spanner spanner "$DEBEZIUM_VERSION" "$SPANNER_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-additional informix informix "$DEBEZIUM_VERSION" "$INFORMIX_MD5" && \
    docker-maven-download debezium-additional ibmi ibmi "$DEBEZIUM_VERSION" "$IBMI_MD5" && \
    docker-maven-download debezium-optional connect-rest-extension "$DEBEZIUM_VERSION" "$KCRESTEXT_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

