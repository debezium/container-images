ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.3

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.3.6.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=1ded42cc5cc459057a3e626d0db4e905 \
    MYSQL_MD5=7af5146f7d16e7607dcda7453434feac \
    POSTGRES_MD5=df6f51f77099364358aef949ad3906e7 \
    SQLSERVER_MD5=5b68ba7238e3dea1daefbc8e5e413b31 \
    ORACLE_MD5=7b341064c22929f8d7f88a307e6ac0c3 \
    DB2_MD5=d38ce55eafaca9217e5b2a6041b40ffd \
    SPANNER_MD5=205537d272d5e4be5c74cb9bf1416f44 \
    VITESS_MD5=fb0f31fd24344c4bdd94098a72d42427 \
    JDBC_MD5=c46d27e54561936e406b1f41c2a8497d \
    KCRESTEXT_MD5=c553e0795382f0be9da931cdd24c3da5 \
    SCRIPTING_MD5=ae7b3859413a594e8fe043af99424bc3

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

