ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.2

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.2.0.Beta1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=1d77e4ac86b1f4f6f6178038ac8d76c4 \
    MYSQL_MD5=b58010acfd578689bb89635d407668b4 \
    POSTGRES_MD5=5a5866569ae138bf5c3e41d8f9e5dc07 \
    SQLSERVER_MD5=a0f417af6c01b3496ffad9e5be12f038 \
    ORACLE_MD5=3edbfc9efaa17e1af28e3f1fc59f7cb2 \
    DB2_MD5=b6084cce5ac5e0f8ce2c9203bdccb9af \
    SPANNER_MD5=1df710ce9d7c3c0bf437f7c2de4143f0 \
    VITESS_MD5=b2256505b383b76756e31ae96f9dbce5 \
    JDBC_MD5=4d4675b5a604ccde1b7ebc83b22e1832 \
    KCRESTEXT_MD5=42bd0ae35f1f8d2bb150ab1838e76e1c \
    SCRIPTING_MD5=734fd43afbaa72d3c78fc273b5b8f31f

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

