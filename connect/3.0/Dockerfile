ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.0

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.0.3.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=758a9ba31d1140a891d7ca536fdded08 \
    MYSQL_MD5=d35a8b1463352ac84162a59f2fd48e2a \
    MARIADB_MD5=e119492e0778277e319a80f8ddb2fab6 \
    POSTGRES_MD5=a61581e89bd2cbb7dd43cbff5af446ac \
    SQLSERVER_MD5=30bf9290e995ee7e06983a7737ea138e \
    ORACLE_MD5=a821a3696aea1b43a48132bf8fd1b4b1 \
    DB2_MD5=81db1c7bf2051bfa03cfea47d3f19c0a \
    SPANNER_MD5=b717266b40f4d2dea9780e172c7e672e \
    VITESS_MD5=ce0173616d3809cb8a58bffc29811f89 \
    JDBC_MD5=d07674191aef00b7e289d8cfc93d1607 \
    INFORMIX_MD5=e341dbad843e9ee4507c291d16ed7a53 \
    IBMI_MD5=100d68860123cbdd5b883b47345105ff \
    KCRESTEXT_MD5=dfe0eb3e5ee45469dfc5e5930611bb2b \
    SCRIPTING_MD5=7f8a9ca03dc58f7a4b007c48e1eefc90

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

