ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.2

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.1.0.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=895f6428461d43718d61ca46216887e3 \
    MYSQL_MD5=4726cf74822f7b2a1db0a3d641f7bc7b \
    POSTGRES_MD5=90821d06e250b1930a8843b324e17137 \
    SQLSERVER_MD5=0feb7795029711fd16fd0bf2f24f7bd8 \
    ORACLE_MD5=0f33f4cb457b9f667cc97d98accb258c \
    DB2_MD5=94948dc11e7e34b54de517dab21d367f \
    SPANNER_MD5=695245a18189057d3ef48ab5254c6a83 \
    VITESS_MD5=2b01b640c65480e6bf7ca77baf0bb1b9 \
    KCRESTEXT_MD5=4cfba5d79a37e58c40d3b5683db40c33 \
    SCRIPTING_MD5=067312fe2472a19dfaedcc77b0866e8c

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

