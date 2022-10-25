ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:1.9

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.9.7.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=9b941094d06ea29f03bbc8ae55d42baf \
    MYSQL_MD5=38d6485246db15a7d9df74152ea3b467 \
    POSTGRES_MD5=161e362568163639fcde39da27e29456 \
    SQLSERVER_MD5=e550767b54edf6bf4ccac79992f78ae1 \
    ORACLE_MD5=5251855544d8c3fea34a512f3fbe38fc \
    DB2_MD5=22317e399d1eb57f3930eb6e3bfae6e5 \
    VITESS_MD5=b4e30ded99634b4c49c933b03e3c5627 \
    SCRIPTING_MD5=d087c12bd992455b3f47e8a9d5627f68

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
