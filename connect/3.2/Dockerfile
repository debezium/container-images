ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.2

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.2.0.Beta2" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=faaf8b4100ebb882a5120000b9f21859 \
    MYSQL_MD5=1605d354d66fee2666fac0f57f291c98 \
    MARIADB_MD5=78963a8eed8448b2d2f430b76f869282 \
    POSTGRES_MD5=c0a4f9415415f308813507c632b655d2 \
    SQLSERVER_MD5=23e79a7bb6669cdb9f250c5e2cc32955 \
    ORACLE_MD5=58c70370714195a6f295ce4e73219142 \
    DB2_MD5=abf3b5e2132cb2cc89b43fea04c31252 \
    SPANNER_MD5=7291bedb056df49fb529b65ec4027e86 \
    VITESS_MD5=523a1dea3de4e1241efd6de4cf7c086e \
    JDBC_MD5=6a60e3843379215c469e748cb8afc16d \
    INFORMIX_MD5=230640affbe42665657115b99fa88f7d \
    IBMI_MD5=20c3fc0f5f6a3ec5256f292de946c116 \
    SCRIPTING_MD5=88da296eb87a0d178a1dcaeff814fcb9

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

