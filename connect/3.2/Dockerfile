ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.2

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.2.2.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=b402a7b83963ad47381b2d9b7141d5e0 \
    MYSQL_MD5=feb9198ab41344398d248539c48d0fab \
    MARIADB_MD5=e4436bd81d19a09e3531ea460aa78348 \
    POSTGRES_MD5=7aab67711a68e69e27265aa36ec82f89 \
    SQLSERVER_MD5=0ce889dff1afd8bdae156ad2ce0e4347 \
    ORACLE_MD5=fa245ea0f3fb28398e82513a034b0a3b \
    DB2_MD5=ad74987cab7bbdad1240e112e065fdf8 \
    SPANNER_MD5=45599455be6e77b8f016f7a8df535731 \
    VITESS_MD5=983fa1c86d5911a4d39f93076090fe04 \
    JDBC_MD5=ad53af348072df89802f1c5ef144d2c1 \
    INFORMIX_MD5=881eb413b6a5679fb631b9aa6ec0e88a \
    IBMI_MD5=d05ab154397104780688581757c362cd \
    SCRIPTING_MD5=06a42901cdc7fce560407b356b608697

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

