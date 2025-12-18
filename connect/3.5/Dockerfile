ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.5

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.4.0.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=9adda60a465a905bb3e088e38b4dae82 \
    MYSQL_MD5=081280ba0cf2e8e0a3777835079a4a2a \
    MARIADB_MD5=b488bf00c2318337866347371388bd1d \
    POSTGRES_MD5=54679da8eb301f2fb33925b6efdfbdb0 \
    SQLSERVER_MD5=05e30150d1d7e8bf880682158d99aed8 \
    ORACLE_MD5=ec9d61e9f013fc6b2e5f072c2d6b2aea \
    DB2_MD5=e1263073578a140e973a01f5660eb132 \
    SPANNER_MD5=494e714316c960f26873e55f5e9df851 \
    VITESS_MD5=c37fa8e5eabd1677e5a8efeeaa60a9c3 \
    JDBC_MD5=1ea2aa0add72d927c5c82acc109ac078 \
    INFORMIX_MD5=303b6cccd2e82fbe8733695ee4d3757d \
    IBMI_MD5=c1c6afb99300513bc75f02873aa00b54 \
    COCKROACHDB_MD5=42db8ddff0a2906451b3dbf142fe3b76 \
    SCRIPTING_MD5=0cd540ba0dc045a50ff5a3fa06940710

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

