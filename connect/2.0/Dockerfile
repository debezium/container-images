FROM debezium/connect-base:2.0

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.0.0.Alpha3" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=38604d9853a70aa2e25f18c6489e34a8 \
    MYSQL_MD5=2306edd43d008c75bf4d67b9464caab9 \
    POSTGRES_MD5=36c20223b07b1eda7edc95ca458a958f \
    SQLSERVER_MD5=398884075eaec13e2aff4e03c23034ec \
    ORACLE_MD5=784a8b05aa28bb4977187fee43047d8f \
    DB2_MD5=042a41b8e6df692e0ea3965b4e48f05c \
    VITESS_MD5=50b2759cd5b6fd24ee44ed33988eee26 \
    SCRIPTING_MD5=5660ad8e45ddb601625295af20220a02

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
