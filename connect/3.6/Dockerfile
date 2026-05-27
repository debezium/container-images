ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.6

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.6.0.Alpha2" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=faa794d1b10f1d8ced1ba312b8961ca9 \
    MYSQL_MD5=00cd23f37da14a6c2090fe94e63718ce \
    MARIADB_MD5=6d5096bf366beb5ea9c2218277ff1e77 \
    POSTGRES_MD5=6dc3ae3cd66666388b2fab1599925064 \
    SQLSERVER_MD5=7f4ef56d30c8c2efa146cb19194f7714 \
    ORACLE_MD5=bfa7f5539b4eba3e4cebcfad5e5f1dc4 \
    DB2_MD5=481ca69c9ec07ea8fb32598fe9e85c80 \
    SPANNER_MD5=7a772a07dcd5c1bcfa8a897f91ca6d62 \
    VITESS_MD5=867e0e0c70779c4a26971e7e5138919c \
    JDBC_MD5=3221bb8e2996b8722209ee29f8a47775 \
    INFORMIX_MD5=72f05d727a7b6448a34e1626e73d9591 \
    IBMI_MD5=cd97144bb6157bc7efbeddbd3e51903e \
    COCKROACHDB_MD5=73a92c86006bb22782f281f15c848970 \
    SCRIPTING_MD5=d1afe6663661cf78ca31e0a7f3e6436e \
    CHRONICLE_QUEUE_MD5=33967e127dfe963f94b9feb5b26964ed

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
    docker-maven-download debezium-optional storage-chronicle-queue "$DEBEZIUM_VERSION" "$CHRONICLE_QUEUE_MD5"

