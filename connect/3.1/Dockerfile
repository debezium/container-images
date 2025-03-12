ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.1

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.1.0.Beta1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=4417ab51623ab18111c93fbfae39002b \
    MYSQL_MD5=9f8d5a6b40379fb67aba1bf4e6ae81e6 \
    MARIADB_MD5=60fe427bd62e23115c895d7bda1a8ff9 \
    POSTGRES_MD5=20ebc4c787073f1eb146801884c6f561 \
    SQLSERVER_MD5=0d74077662095c14ceb0473849b2cb6b \
    ORACLE_MD5=696c8ce4c104b2225ab6dfe036410a1c \
    DB2_MD5=5664bb76e1f5f75b74498870494ead93 \
    SPANNER_MD5=0574918083288046d5c8ebb4190f654b \
    VITESS_MD5=cf72de1a8df486e713ff2dc5e63acc40 \
    JDBC_MD5=fa70fb0060943c60070100484cd17a34 \
    INFORMIX_MD5=761523d2ed99ef7ac3cc5980f0705a1e \
    IBMI_MD5=a4032988cf8c552367de7d8a92cca152 \
    KCRESTEXT_MD5=75b1cbde52065e9a039d6e188e02af81 \
    SCRIPTING_MD5=7eb8409f0969f920a006334b62eac69f

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
    docker-maven-download debezium-optional connect-rest-extension "$DEBEZIUM_VERSION" "$KCRESTEXT_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

