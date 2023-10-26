ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.5

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.5.0.Alpha1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=c28658749f83d2b35a67fb28e71a12cb \
    MYSQL_MD5=3ae8399278856521d9f5d3b0f53b7028 \
    POSTGRES_MD5=71047d13fc4654f280411597ab6ed1ad \
    SQLSERVER_MD5=e34096a69b53b044ad96769e442d50ea \
    ORACLE_MD5=c8981a263aac652aa7945ea046dd6788 \
    DB2_MD5=41ce7551cf9252f86e4b9aee8152753d \
    SPANNER_MD5=2841b9d4d8ce3d089000d7985868f12f \
    VITESS_MD5=b370087aacba3b17295973e15420a786 \
    JDBC_MD5=ff3be9629012fc359a0636fd46e4a3eb \
    INFORMIX_MD5=f56453ec8688ba8eb79c012622326d27 \
    KCRESTEXT_MD5=7ce4b0c53e93da0cec02e9cb0ddf3d33 \
    SCRIPTING_MD5=66f3554fa919ca3a606e91804688489e

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional jdbc jdbc "$DEBEZIUM_VERSION" "$JDBC_MD5" && \
    docker-maven-download debezium-additional spanner spanner "$DEBEZIUM_VERSION" "$SPANNER_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-additional informix informix "$DEBEZIUM_VERSION" "$INFORMIX_MD5" && \
    docker-maven-download debezium-optional connect-rest-extension "$DEBEZIUM_VERSION" "$KCRESTEXT_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

