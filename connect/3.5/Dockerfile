ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.5

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.5.0.Beta1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=e96a47a5d1c24f0ae5c86f927b5bd697 \
    MYSQL_MD5=efc30afafc436b3fa30c0063d5f9e4dc \
    MARIADB_MD5=7f2255e119d4b8eaeeca15bfc69c8273 \
    POSTGRES_MD5=09a17db35a16eaeca7fb77059fe85568 \
    SQLSERVER_MD5=0b3564a014c66a0049476e2af709c7e9 \
    ORACLE_MD5=d504183524ba0ff5e08784fef1e70ea9 \
    DB2_MD5=ba0b9dd01ad2319b6a5ab21db3a38f39 \
    SPANNER_MD5=dcc58c145e6bd7bae729bc5570489a2f \
    VITESS_MD5=8347f155cd352299454bde0e959fffdb \
    JDBC_MD5=70825d085de574ddfaeacda18fc70f3a \
    INFORMIX_MD5=b5538ba8437b67b93f7ea34d584b8398 \
    IBMI_MD5=f2694c7e6285ba6dfc69f2ff02274785 \
    COCKROACHDB_MD5=295122f04d4b0c1e4c4532eb9053e6f9 \
    SCRIPTING_MD5=950f6cd4d53342a34b60e19b14706579

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

