ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.0

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.0.0.CR1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=8cb2ba09300e502fff22428ddb381f35 \
    MYSQL_MD5=98af700e826b889d7aadeef2e63236d9 \
    MARIADB_MD5=e327bbd417735e9193a600d169f4b81d \
    POSTGRES_MD5=76e518e73861c208f4a4dbb4d7e7da2e \
    SQLSERVER_MD5=8485eb7eef920a09a99c2236e0b25c7e \
    ORACLE_MD5=c77b724d1dea470717f1c243966ce252 \
    DB2_MD5=878ad8b9091977e6aaf0299176196c10 \
    SPANNER_MD5=15ab546d6ed448be209552149a10eed6 \
    VITESS_MD5=8093e6d76b496265a44d9a96ad18d869 \
    JDBC_MD5=121fe82a9f367c21386d07c7ba763e83 \
    INFORMIX_MD5=8993d4c45768461dbe0f808f1fe276db \
    IBMI_MD5=dc3d3bfd537f62c4b315774530ceea4d \
    KCRESTEXT_MD5=35c56f87db22c338253a5db9b6e797ae \
    SCRIPTING_MD5=b5a8d24a371eb95e94d3e57a2fc0e563

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

