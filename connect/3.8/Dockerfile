ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.8

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.7.0.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=97bc87167542cd78545d60b3b6b70f45 \
    MYSQL_MD5=6e41a8475d12c557202aaa5e7320cd29 \
    MARIADB_MD5=da77c1529f881350378e68e1a0746b30 \
    POSTGRES_MD5=e584ba0dc9cb7b8329685c12c7a1e1d7 \
    SQLSERVER_MD5=9f740027e7a4994e8973ff66183fa2dd \
    ORACLE_MD5=0d3a03c55763b0562bd11b974439d123 \
    DB2_MD5=c36fd95b46943802bd109fb132ef8d00 \
    SPANNER_MD5=9ea2b764defb84ed7b8fae43593dec84 \
    VITESS_MD5=a22cf562b8bcb068f84ff9df3c677029 \
    JDBC_MD5=33c0da9128d4d159ed62619fa00691d4 \
    INFORMIX_MD5=1a9a60914bfd2adc715aefd6e02a4118 \
    IBMI_MD5=a72b22c17a77d56509c5acdc799103c5 \
    COCKROACHDB_MD5=d93a8bd1c3ad8c97660f4be68ebcf34d \
    SCRIPTING_MD5=19457393e156e1cb791dd90f8ce99306 \
    CHRONICLE_QUEUE_MD5=eba9e265f16b5254ef7a870db41ac816

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

