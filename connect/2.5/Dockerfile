ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.5

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.5.0.Alpha2" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=33944be03705a0372580734c09769941 \
    MYSQL_MD5=5014d727bbaa1042a6605c28aff13808 \
    POSTGRES_MD5=9ae80e0139adf5e503281f4bd2cffd02 \
    SQLSERVER_MD5=e13edfeeedb060814ba5a6902420beca \
    ORACLE_MD5=6f6d41b50972ac3e44fbbc391e9bd0d1 \
    DB2_MD5=ecdca66f321b21e1362a35298614c8c1 \
    SPANNER_MD5=8eb93845a150ac617ff703e1f5ae6b7c \
    VITESS_MD5=8881050489d91187bde7ceee0212000a \
    JDBC_MD5=9def36b6039cfd07ef19213ed1802312 \
    INFORMIX_MD5=c691e01d5279f2f752f7200ad437b98f \
    KCRESTEXT_MD5=6c86b86a175e5beda18876dbe595e198 \
    SCRIPTING_MD5=62f0b859e66bcdeff2f828728b2690f4

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

