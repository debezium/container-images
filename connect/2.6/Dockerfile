ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.6

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.6.2.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=bbcbbf8880be252249b15b2f0a75c950 \
    MYSQL_MD5=f2f8f8a0fbd3d84af6ee3f6aab5b0a54 \
    POSTGRES_MD5=5e5c428927179fd6df6d727ba95e9e1c \
    SQLSERVER_MD5=e5cea53628fd46d35f525d75ac410388 \
    ORACLE_MD5=de3ba5fe660055c595012ea2cb153c28 \
    DB2_MD5=1f86d380947c31b840290ff19685bb27 \
    SPANNER_MD5=b6461bf69a1835411ec8f26639f1e52d \
    VITESS_MD5=1a21bdfd27c9edaae7493344d5299f8f \
    JDBC_MD5=ba9f5cea0c7a8dc925c4035b11ddeb71 \
    INFORMIX_MD5=3903b870a97a2ea161b7834d857e6b94 \
    IBMI_MD5=3bf900580328079c97f9e430c697b469 \
    KCRESTEXT_MD5=f291987d8df27b8019a3f7fe81f953c0 \
    SCRIPTING_MD5=7104dc0f933741c586e26ac62f9b948e

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
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

