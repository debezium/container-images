ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.6

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.6.4.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=b633e3c7ed7380349c395004bd1b90d9 \
    MYSQL_MD5=10ab4cfef58a0ade971a80a8c78d6e1e \
    MARIADB_MD5=0ed74ad1452348a2f62ed3b345ec3b3a \
    POSTGRES_MD5=41858672da002bcb4ab9c64b1d68ad5b \
    SQLSERVER_MD5=e79804bd61d76fd15f2d932bdcab3b84 \
    ORACLE_MD5=23d34479b58f5ae70bf641c32fa035c0 \
    DB2_MD5=94c3a2b0734c050cf4a589340cb78b3a \
    SPANNER_MD5=46df6b25096cb37e0bc389e700dfa2fc \
    VITESS_MD5=eb5d63a650ab5ef2808f15f3c369550f \
    JDBC_MD5=dad4d3aa06e6460b17a791043ce82788 \
    INFORMIX_MD5=4f135d10765ccc180ff3fed00db22e50 \
    IBMI_MD5=19dd24cadd38fcb652677760da50a153 \
    COCKROACHDB_MD5=6fec2c9c52ec49dc1dcd5d3d77351142 \
    SCRIPTING_MD5=29d53f5ffabf771034cceb3b1e39bd67 \
    CHRONICLE_QUEUE_MD5=0300566fdae8266dee19a25aedb2b2bc

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

