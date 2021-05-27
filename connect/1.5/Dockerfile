FROM debezium/connect-base:1.5

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.5.1.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=a302824dfba0349bd180bef7c1e78f69 \
    MYSQL_MD5=38fe06a81d79b4b0dba99522708c39bc \
    POSTGRES_MD5=32eb565d9c6fa22ce7e6ebd3747a67d4 \
    SQLSERVER_MD5=9506ec31b74c3ae5d5c8e4390c4ab5f6 \
    ORACLE_MD5=bac48989c1d8f7ae08dab317a8bc9a2a \
    DB2_MD5=bf3d571fa0ad8eaa02ab399ad99643ff \
    VITESS_MD5=09f501ce2ea2598b47fcd7c904ae6a97 \
    SCRIPTING_MD5=aad13540fc059d02bce67ab5889c063b

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
