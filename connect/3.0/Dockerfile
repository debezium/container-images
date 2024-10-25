ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.0

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.0.1.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=7cab7a7c838df6de7463a9d8b68d5f2b \
    MYSQL_MD5=6567b2cf3d3cc53a105bbf51b365e016 \
    MARIADB_MD5=f61c4b7631c70dcdc15ca99348042e1d \
    POSTGRES_MD5=d15eb557a4e72a26bf97f0be8c0caea8 \
    SQLSERVER_MD5=b3e46267369751ee4184e1d1f94f911a \
    ORACLE_MD5=e73da3ca4bf4679f9a41a4f23b61ecfb \
    DB2_MD5=7c1b2efd41f37001f60d9c821df034e3 \
    SPANNER_MD5=2c4b29ea43ce48193b51bcee1108b89e \
    VITESS_MD5=978432366ec5ed8560032d1f7cef9b53 \
    JDBC_MD5=d3317f638e4eea3459c479ff0b12823f \
    INFORMIX_MD5=2424f9f1ce247ac6afb2462d532cf687 \
    IBMI_MD5=b74367a4c117815ad59c742211713833 \
    KCRESTEXT_MD5=6e6eb63690bfc9208006cfd985a30f25 \
    SCRIPTING_MD5=31ed5284d67cb4cf3d5fa8c4b2845d8b

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

