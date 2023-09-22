ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.4

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.4.0.CR1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=c2dfc650f131e3bca4b97e06db1d5954 \
    MYSQL_MD5=8b7b44bcb75bdfad74c345bea3384068 \
    POSTGRES_MD5=abc310b52a26b7a93ee01dc17bc8f2ea \
    SQLSERVER_MD5=4021b81b90fb9ce3ffcb21a1ff486b23 \
    ORACLE_MD5=35f3dd7c3be8c31b5bcb08ebb22312e2 \
    DB2_MD5=39ce554d353341eb07a496ef4d202189 \
    SPANNER_MD5=3267eee7f00a6e2fa906432be0595e54 \
    VITESS_MD5=e7e8ad42a36ada01365f72f248a25496 \
    JDBC_MD5=965be4d901f5f3c86ef07ce49df5ad46 \
    KCRESTEXT_MD5=37179cc0e461b66792f82983ff5bb93c \
    SCRIPTING_MD5=c0bd8c9733ae365a09fc3d1b32811f2d

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional jdbc jdbc "$DEBEZIUM_VERSION" "$JDBC_MD5" && \
    docker-maven-download debezium-additional spanner spanner "$DEBEZIUM_VERSION" "$SPANNER_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional connect-rest-extension "$DEBEZIUM_VERSION" "$KCRESTEXT_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

