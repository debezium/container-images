ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.0

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.0.8.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=374177a95d8f30c5c37f1c429bc6ffa6 \
    MYSQL_MD5=d1c2e97a9b261b488c3eb6eaa11c8c81 \
    MARIADB_MD5=15617f63eef0789ea59354bd30249092 \
    POSTGRES_MD5=765d77e291dffef482370be72f5be5db \
    SQLSERVER_MD5=1d46bdc2c61d84d726d57420ac49b3f0 \
    ORACLE_MD5=0d396dbf0f17a5ded608de6a1075033e \
    DB2_MD5=ff6d9c0a0aa46dd049e6c18d76c61306 \
    SPANNER_MD5=7c45ee89b2e69365048a5afbdc19fbbc \
    VITESS_MD5=317ed9441e365e574af73832253b7e83 \
    JDBC_MD5=c3459ad4e8774ac2346b699889464ec8 \
    INFORMIX_MD5=0455177a78d8a7cfa262e641a69e5a8a \
    IBMI_MD5=2d7d243685caaf9001e0f731883faa80 \
    KCRESTEXT_MD5=7ab7b239d4b44b90d196811ed6139434 \
    SCRIPTING_MD5=bb9a957a742bdcb329efa280aadec950

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

