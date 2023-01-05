ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.1

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.1.1.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=1bbe7fc461cb6e24c5028639a4624592 \
    MYSQL_MD5=e7c93fdf45ffb676631c1fa7bd573ec9 \
    POSTGRES_MD5=44217336d442bb934d828b330564fd4d \
    SQLSERVER_MD5=ccb890c9488f04046026d496a8b26bae \
    ORACLE_MD5=015bfe3eba02fd3fa77ea5d8bd9b95bd \
    DB2_MD5=604f4c54c44c4c5661c54a7a2d6e2c52 \
    SPANNER_MD5=d2dc96023ece30c62fe6a20f4106c07a \
    VITESS_MD5=5ce06022d46f6a9a2a58120b80cfc73d \
    KCRESTEXT_MD5=8066ecb1d6c065369a3c896ccf058ec0 \
    SCRIPTING_MD5=79f0729f46b5085ae9297d0181b36ddf

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

