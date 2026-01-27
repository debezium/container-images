ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.4

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.4.1.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=c10a4a4d8f76bd26dc5f02e40d22ae05 \
    MYSQL_MD5=ab37adf64a649ac328c7dfc8af067582 \
    MARIADB_MD5=b7f81f31ca5daaf4da34b03072c6d7dd \
    POSTGRES_MD5=133e13bbaff5d7c46987a033f729ed6d \
    SQLSERVER_MD5=2e820b9f87bfd8435593ac38150a6ff6 \
    ORACLE_MD5=ac00dc292830f24a198d46cea5aeed91 \
    DB2_MD5=40049ab7e1e4af358ab835b0365ea544 \
    SPANNER_MD5=8d39a9e7d112479e69d898fb9e982c5d \
    VITESS_MD5=8d73aea5c38c333a09b0f6f01d2a5989 \
    JDBC_MD5=be94d9099bcb860c7fc4adb7f9e082ef \
    INFORMIX_MD5=8be5df3f1fd86188e58179906b70eb45 \
    IBMI_MD5=b14b64f66447dfc832e5af1af74517ff \
    COCKROACHDB_MD5=c7c9a8f21a3cee29d7a1a09f84be84a0 \
    SCRIPTING_MD5=682b5d41951db8e8acce73d78af6c7c6

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

