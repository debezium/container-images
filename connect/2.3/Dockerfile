ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.3

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.3.2.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=385805098ae729f9fd2a76824c35d39c \
    MYSQL_MD5=dfd11bddc043c935ddb68c8207eafd75 \
    POSTGRES_MD5=37f441ec730dd770928b4219a9a79d21 \
    SQLSERVER_MD5=90ce09673bc2a862b8867b0f1607fb52 \
    ORACLE_MD5=aef1032d1044a6151866a4426b5b8b6f \
    DB2_MD5=ec9c2044b4d422590090d7bc7a1ebb83 \
    SPANNER_MD5=f8b305236be49a686552046437801767 \
    VITESS_MD5=ae65214272f7192e53039961325b83c4 \
    JDBC_MD5=7f9297dd61a09379cb60cdc3e4f23ba0 \
    KCRESTEXT_MD5=c28e8184a234db32b4c32780ba789c10 \
    SCRIPTING_MD5=0726417249e59e375404c1b670e9a237

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

