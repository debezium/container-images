ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.0

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.0.1.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=c4f567ef44468d9bf53fcda1f5e74abb \
    MYSQL_MD5=c18c50405dc1398480d931d802be0f8d \
    POSTGRES_MD5=c1ab7cba8aa7b494ad8a299a4e24e339 \
    SQLSERVER_MD5=b13a84314ea4783e226d36e951dc2d6d \
    ORACLE_MD5=cf0e416f3d8746bb908ee7331d221d62 \
    DB2_MD5=23283240526a4a40077ed3da05e3294c \
    VITESS_MD5=78cecec82bb8fffbf55f11a9b2bbb7db \
    SCRIPTING_MD5=d89dcd393f179eb2e4a00589255e8c63

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
