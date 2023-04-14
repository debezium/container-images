ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.2

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.2.0.CR1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=fe28e31f7b76d2a4911edcce63ccccf0 \
    MYSQL_MD5=90d9f81eda4b57692e5dc3cec5116115 \
    POSTGRES_MD5=9bcbfecc618babd6e0ce696cd1d28512 \
    SQLSERVER_MD5=1192f49edf026a19300161390fe1eb2a \
    ORACLE_MD5=353ea2eb6b00ceac99db3945aa66ebd7 \
    DB2_MD5=266224b892fc4d2f2efe8bd3256fddbb \
    SPANNER_MD5=5f5899737dd77a8cc1a9ee029120ff4f \
    VITESS_MD5=010a2060d13a4bc6d2b653daa106651c \
    JDBC_MD5=5c408ad8a1ce129759c3e1d8ba02060d \
    KCRESTEXT_MD5=e388ba2a2f0436b32c8640fca9e6ee01 \
    SCRIPTING_MD5=91f8cd792e34c7a7f38b3635a5e080a1

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

