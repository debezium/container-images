ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.6

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.6.1.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=4a54c681626a8e7daa541c1af7430299 \
    MYSQL_MD5=254a736b9c42606d1cd9d5167adfe6c5 \
    POSTGRES_MD5=19c504725ae1bde425d176c3ca3952a9 \
    SQLSERVER_MD5=be9ce1d3929488718ad582873b9869d4 \
    ORACLE_MD5=39e5a749fb3d7bae3ed106aec5b11561 \
    DB2_MD5=b03f59516bbdebaedf7c974c8319981b \
    SPANNER_MD5=3900dceaae7aed8ab2cbbeb0a452d615 \
    VITESS_MD5=78b2ce29710ccc11f85109ce7316cd5f \
    JDBC_MD5=027ac34413994b9b1bc8e9a5164ba4ff \
    INFORMIX_MD5=c0b85654f2c1bac14672a1ef4f73bfcf \
    IBMI_MD5=384bc3cc450355e18a3036d10cc06b10 \
    KCRESTEXT_MD5=310b7b622ec06b6eb475f82b8cc3176c \
    SCRIPTING_MD5=01e613e9ab093b32afd796fda1cc4c05

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional jdbc jdbc "$DEBEZIUM_VERSION" "$JDBC_MD5" && \
    docker-maven-download debezium-additional spanner spanner "$DEBEZIUM_VERSION" "$SPANNER_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-additional informix informix "$DEBEZIUM_VERSION" "$INFORMIX_MD5" && \
    docker-maven-download debezium-additional ibmi ibmi "$DEBEZIUM_VERSION" "$IBMI_MD5" && \
    docker-maven-download debezium-optional connect-rest-extension "$DEBEZIUM_VERSION" "$KCRESTEXT_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

