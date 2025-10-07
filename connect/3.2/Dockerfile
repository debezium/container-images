ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.2

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.2.4.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=5e22719c6d4a92fee1a47dfa254df588 \
    MYSQL_MD5=095cdf5f4d2d08fb08d2f624107b0934 \
    MARIADB_MD5=f87ce2aafd5a37c81a451b076f4b4830 \
    POSTGRES_MD5=1b14d88c03ba1627a74fcc30c4936556 \
    SQLSERVER_MD5=7073adf0f47d0a14725d7f92b32dc0ed \
    ORACLE_MD5=2e65a34e8cdc47a9e450834b4da06656 \
    DB2_MD5=fe92d4bff28796c5cd3c7a689d7d4c49 \
    SPANNER_MD5=986f11f1cafc69b0f1c5447c54e4b42e \
    VITESS_MD5=eb04d9c8f48bd2a06dcd1860f62a3d3a \
    JDBC_MD5=dbb62d60e652a8eb97f354bcadab3397 \
    INFORMIX_MD5=b00f4c64f892aee24baa6c1672ef5c20 \
    IBMI_MD5=7fe89d43fc59fbb9bef4ca3cf2855934 \
    SCRIPTING_MD5=2f0c84f64a336f3f16f85252e2caf410

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

