ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.1

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.1.3.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=4f10ec4f2e5246bc00cdb97152687391 \
    MYSQL_MD5=51abf222b1f49e749671c26914ef3742 \
    POSTGRES_MD5=da0820c857d51d90e74430bbfb8a980f \
    SQLSERVER_MD5=bfababf10cf0f6bdc69f13513959ca67 \
    ORACLE_MD5=9cf42e58eec63e43c65eb03325d7096d \
    DB2_MD5=602473dbd72f3c9b82f580ef061a1365 \
    SPANNER_MD5=87e4125488445cb2c63a252c34b70f35 \
    VITESS_MD5=7e803916a012570086421a4873f4ddb7 \
    KCRESTEXT_MD5=bd465b847a206f98f3b6c7cc216e73e3 \
    SCRIPTING_MD5=fa82348eeaaeb84a48769e4235160ca2

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

