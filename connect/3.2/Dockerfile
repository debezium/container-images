ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.2

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.2.5.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=354d123c1c13d14f9152143c856e3d48 \
    MYSQL_MD5=cca0ece1666ce169d1354278008a00d5 \
    MARIADB_MD5=1f9027a8fef3f33106a50ec829b3a85a \
    POSTGRES_MD5=c68ead5362baf721bac2fe209a401ead \
    SQLSERVER_MD5=186352e1aef6f99b9e81e592a10c76ce \
    ORACLE_MD5=639e622d3182dddfbaf78fa5e4465557 \
    DB2_MD5=f37f77ef928bd2772242ff0f2786eced \
    SPANNER_MD5=e9c6587b4582b4a63d6e6c30181ec694 \
    VITESS_MD5=a71e95149db64b0c3e59dad70f71e27e \
    JDBC_MD5=9ed5bba618fb670ef0177f30e7a4d555 \
    INFORMIX_MD5=d3e1c60538b8c5d0f0c5f2cc0516cb9f \
    IBMI_MD5=f48350bef17d20b45e59ffcc5576b2f6 \
    SCRIPTING_MD5=7baa16cdb29d0cfffed4a02164b98c9a

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
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

