ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.1

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.1.1.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=c65242b89fd53c5a67dfb024fac3c500 \
    MYSQL_MD5=06ac64bd00d9246c14bbe2db9dd226fe \
    MARIADB_MD5=490b3637a54aa07f916b7c9d11759517 \
    POSTGRES_MD5=cefc4d8ae267e578c750a8d805a6fc50 \
    SQLSERVER_MD5=0b6ba4a9ddf2b71055077930b1f1e606 \
    ORACLE_MD5=d7e87f279ea377eb09ba2fc55744ec89 \
    DB2_MD5=8b0769cac73b67b575d73fd10f3bb59d \
    SPANNER_MD5=7d469663436b95bc5d8893fcb00acb9e \
    VITESS_MD5=eab75b445973c20d2fb38101a005b815 \
    JDBC_MD5=1bff740cb70b5176801bfaeab83328d2 \
    INFORMIX_MD5=b38c4dff766e9d1ff4422d7ec5b5ae7a \
    IBMI_MD5=015ffd7fa5e91e4adf15dbc6478d9e6e \
    SCRIPTING_MD5=d68d4cb51b880970cc08c219ba323274

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

