ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.7

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.7.3.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=3b231b2aedf808c2d33fe6d0c3f7e537 \
    MYSQL_MD5=134fae5489da998e8f29659764837fb4 \
    MARIADB_MD5=cdec58acae10f894ec18e5d95cdb0425 \
    POSTGRES_MD5=9bb46566fa18541be206f0bd0f77c4de \
    SQLSERVER_MD5=7ee840859be88c375142e69e023acde8 \
    ORACLE_MD5=19b3265ec9a7886e05d8aabf1da8fc17 \
    DB2_MD5=2d7aa73738c7403d2a02bc60acc20acd \
    SPANNER_MD5=3b964e01a85dceda4ea69c3af2596181 \
    VITESS_MD5=30d6b64324958bf8cd6315287d02389a \
    JDBC_MD5=d2dd91fec02b92ad5af4c6eabdb81c1e \
    INFORMIX_MD5=d3004803ba0c64a60b2b2bd3f8833ffd \
    IBMI_MD5=667d0cb003e48c6f438d1acc4109f185 \
    KCRESTEXT_MD5=ad3f8dcdc133d1b3fa3d431892e15fd8 \
    SCRIPTING_MD5=e8c6825ada56c4f028b67fe634f7d4d6

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

