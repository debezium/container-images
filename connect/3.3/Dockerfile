ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.3

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.3.0.CR1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=3078fd5bbc4d508ac7ac6224ade388c2 \
    MYSQL_MD5=887621e53aa97bb1ef6855f1846ddf78 \
    MARIADB_MD5=2c8488aa5a7d38ed03376d0bd8415e0f \
    POSTGRES_MD5=6b1c2f9e67f5e8fcd1ca028637080684 \
    SQLSERVER_MD5=33d563b0d20e70f26e96abf97ef21f59 \
    ORACLE_MD5=f0d843d826ea77fbcf7a6e686b06643a \
    DB2_MD5=279b45465cd4acd6c0ed75d196225ae2 \
    SPANNER_MD5=dcca96dd9d55423466ce0df1c33ca6b8 \
    VITESS_MD5=f4f9d9423cd63fae741e3638a8e0a3c4 \
    JDBC_MD5=ee131e74ceb2686ec47cb2b3256c190d \
    INFORMIX_MD5=36550e005a834cb2f4ff4b9441c95653 \
    IBMI_MD5=c0c6e86f689a28475f8fd47509f80248 \
    COCKROACHDB_MD5=7bf6b2ac8013e41e5ee593d525d03021 \
    SCRIPTING_MD5=29d54e2fc7be56d5539dcbf820c0a06e

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium mariadb "$DEBEZIUM_VERSION" "$MARIADB_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium jdbc "$DEBEZIUM_VERSION" "$JDBC_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional spanner spanner "$DEBEZIUM_VERSION" "$SPANNER_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-additional informix informix "$DEBEZIUM_VERSION" "$INFORMIX_MD5" && \
    docker-maven-download debezium-additional ibmi ibmi "$DEBEZIUM_VERSION" "$IBMI_MD5" && \
    docker-maven-download debezium-additional cockroachdb cockroachdb "$DEBEZIUM_VERSION" "$COCKROACHDB_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

