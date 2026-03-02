ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.4

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.4.2.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=76b52d4717b6fa3816d09e3ac9f62f4c \
    MYSQL_MD5=7d8dab961621e46529b764e996b08097 \
    MARIADB_MD5=2fef3f46221c6475a4d73d2bcb594738 \
    POSTGRES_MD5=e589c2e38e5455a03fc5159129287e58 \
    SQLSERVER_MD5=540adfb19e234521a41a10a4787407c9 \
    ORACLE_MD5=a6b5b22cc0d3d5fa0847c3d415c1fe13 \
    DB2_MD5=429796dea496b193987bbd168b63d609 \
    SPANNER_MD5=e27193bef53470f788fda3bd2f31f263 \
    VITESS_MD5=95f4f98bfe34071d870f235e192bc7f4 \
    JDBC_MD5=4913d7807cb3799ca80c737df312b231 \
    INFORMIX_MD5=13419029a15b90dfd4c1b734adf16b62 \
    IBMI_MD5=0626546aa6e42076157eb446885d6a5b \
    COCKROACHDB_MD5=4f2de52310c4291f94a837e8fcb2f9a2 \
    SCRIPTING_MD5=0d2d45881274656311e03e025ec5206c

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

