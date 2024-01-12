ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM localhost:5500/debeziumquay/connect-base:2.6

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.5.0.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=fd5ca6d535108cafaef2a92a9afd97ae \
    MYSQL_MD5=09d944f3a21bd205d9f01edde5cf3963 \
    POSTGRES_MD5=16e95339cb27dba3a3d96bdd7b5ba3d0 \
    SQLSERVER_MD5=64579046f37a1523e2fd27e5b9ab330c \
    ORACLE_MD5=250d169979d2d3d8d919f8da65007634 \
    DB2_MD5=aa5405943a493992d848679532c796a4 \
    SPANNER_MD5=fb1c4a80c0990070497498600c1d50d6 \
    VITESS_MD5=7462d3e3600bd98c20dd23bce5c415ea \
    JDBC_MD5=7e3dae35120837b21e2f98a72eaf91d9 \
    INFORMIX_MD5=5ae365d3a3ca3afaba00bd1312b69e58 \
    KCRESTEXT_MD5=1dd7df4e6c7dd5dc4e5a74a5c887365f \
    SCRIPTING_MD5=49163a506e826056ac2f5ef758c03f5e

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

