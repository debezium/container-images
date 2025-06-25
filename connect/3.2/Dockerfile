ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.2

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.2.0.CR1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=84b931e8a449e39c5dbb7f6ccdf35a35 \
    MYSQL_MD5=b35c3a2f8f32607eb1819a902ff8dec9 \
    MARIADB_MD5=059f2dd21f2c34a928ef02a79f53d4e4 \
    POSTGRES_MD5=612c304c9c39f8f165a1d07799834b36 \
    SQLSERVER_MD5=c2040c5d1161d86684e7caac89c736da \
    ORACLE_MD5=08821f423f6f2298190bed150d3a0ff9 \
    DB2_MD5=972ab631f3c0d641944b5512a6b579d3 \
    SPANNER_MD5=7d7bd6a8bf056779c996c97585c94382 \
    VITESS_MD5=87b6c5187359a20047ae466ef0ab8d53 \
    JDBC_MD5=1179a2690fd0482a82c2277086279939 \
    INFORMIX_MD5=d3df90c98ef5a9cc4cd0dbac5847b54e \
    IBMI_MD5=6b6385d85814eaa139ac78aeb15c4bd9 \
    SCRIPTING_MD5=db6d061f0550a44661a43eee25f58bca

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

