ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.1

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.1.2.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=a1f4ae834a7e7b935324648b47832b93 \
    MYSQL_MD5=a0f00ed38a9525592a52e84efae1c415 \
    POSTGRES_MD5=ccaadb12b962a4dae6147534e1bfbe0b \
    SQLSERVER_MD5=ca85e2cf04a29f239718469b48c82539 \
    ORACLE_MD5=cf4378a79da596f86346113280bffd02 \
    DB2_MD5=8afc22d095572a9d4db5cbc2705d4416 \
    SPANNER_MD5=ba6799aa21c45606b30f16b026a25db4 \
    VITESS_MD5=2a1a3e2e76f03424864b737235a9fbea \
    KCRESTEXT_MD5=8871d67a69616981c24983a895577d5a \
    SCRIPTING_MD5=b2cd5292e297dd1ac1dad7a68f3d1741

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

