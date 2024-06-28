ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.7

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.7.0.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=df1ad43f9e3ebdfa1ab4a52b7c28a49b \
    MYSQL_MD5=154efb8d280613370f0925a4ce6d2ad9 \
    POSTGRES_MD5=41bf19186ac1c2bddd3c50d6a6fd13c7 \
    SQLSERVER_MD5=7cd6d68ec4ed48dac278d496852511da \
    ORACLE_MD5=45a211d574bf1e1871733a71f2163756 \
    DB2_MD5=5db5add8781ab7c3a6354e4511066b95 \
    SPANNER_MD5=c3ea236fc7c0fe1c408a337b7aa528a9 \
    VITESS_MD5=abe464b2b7e15478605bb5ac4aa04851 \
    JDBC_MD5=1c24205ee205d1b917912ff9ddb5a776 \
    INFORMIX_MD5=eba6de22a9f11be09c98ecd9b129d239 \
    IBMI_MD5=b38731f8529ea9a475e05b8102620f6e \
    KCRESTEXT_MD5=2c49b673c56b3124fd2895ad0ffe7d50 \
    SCRIPTING_MD5=5590888a155a3908fd9e0c0eee6d1a61

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

