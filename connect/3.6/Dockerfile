ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.6

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.6.3.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=b2d12340b3be209e4339ebd5586a8d11 \
    MYSQL_MD5=bdfab90171641bb2800f6ae28ca605a4 \
    MARIADB_MD5=e25d564482b6dfa1cd5994de6e79e55d \
    POSTGRES_MD5=36bb52d1df08ba2b2dc26d23fbf49240 \
    SQLSERVER_MD5=36f97ecc69dbb3fa110a107860e084d5 \
    ORACLE_MD5=6a58d004f8b0d9e769870d1697dad837 \
    DB2_MD5=8978353b2220f704dc2b42538bc81749 \
    SPANNER_MD5=1399109e027b5881366f039f9b3dbf1b \
    VITESS_MD5=e1a485fd92bb1dc5cd5e9be3745e04d6 \
    JDBC_MD5=2feb0d1c6aeda9331e7e07110f2a08c3 \
    INFORMIX_MD5=cd7dd5d460e51ae1bae7315dbc30d2a9 \
    IBMI_MD5=66ce3e483306d02af47e7e55ee350772 \
    COCKROACHDB_MD5=55bd2657752bbdb5ed8751a6a212d2b4 \
    SCRIPTING_MD5=feb5422f18e5c3d70239d6d572631595 \
    CHRONICLE_QUEUE_MD5=b91e76b4e9859fe3ea364b5f31cda480

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
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5" && \
    docker-maven-download debezium-store storage-chronicle-queue "$DEBEZIUM_VERSION" "$CHRONICLE_QUEUE_MD5"

