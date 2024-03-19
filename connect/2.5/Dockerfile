ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.5

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.5.3.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=8243b609a00f8e5e5b38e7d6cf65b721 \
    MYSQL_MD5=569bb8afac9ee1326ea92037b67dd2d0 \
    POSTGRES_MD5=0e119e8fac1a0bc0c35c009786110508 \
    SQLSERVER_MD5=39e4aaaae26d7e00b0634711071ef273 \
    ORACLE_MD5=912f57ab6155ecdd65eebb095920a475 \
    DB2_MD5=8aa8946872935fd40d0599bdcc81d7d0 \
    SPANNER_MD5=0ee542749356025107491f90fc5b6b20 \
    VITESS_MD5=02ac5288b26ad71459b67bdfeaa4f6a1 \
    JDBC_MD5=077a0a158b5178c6dc1e7b83154ad1d5 \
    INFORMIX_MD5=34cdc104f60a127c6d4580649dda3540 \
    KCRESTEXT_MD5=3f559d0d209beb73ab5ca4f6ad998074 \
    SCRIPTING_MD5=eb90d4ff892dd75375a3ec2e0bf3b628

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

