ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.3

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.3.0.Beta1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=274987c7dd2442196b160fb01e060e66 \
    MYSQL_MD5=3a87da9e0947cfa4ad0f5d13e3a35a47 \
    MARIADB_MD5=7ad39cb8b95a0fa5ac74a2cf68665686 \
    POSTGRES_MD5=28322b6057fecfd185b403f28b06534e \
    SQLSERVER_MD5=f9e5cdbb72affeb81708d1e755604606 \
    ORACLE_MD5=1fe10073c9edfdf1b1b19af2f62bfc29 \
    DB2_MD5=4349eb8e987decb914b010e71c117c60 \
    SPANNER_MD5=fc2d6347e2716741683fe1c5d2ede137 \
    VITESS_MD5=15b83e322f59da7c256e98c1bf0e9955 \
    JDBC_MD5=06e50a6b7c77a0d619fa966ea7a17c71 \
    INFORMIX_MD5=427fabf0b89cab07b553de52f6a47eac \
    IBMI_MD5=6cdb9862bccf6ddf3a66ed52199e1d12 \
    COCKROACHDB_MD5=da7f51a2b2781879975c646816fc1eaf \
    SCRIPTING_MD5=4a57148613747f943b5be36e903c6d96

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
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

