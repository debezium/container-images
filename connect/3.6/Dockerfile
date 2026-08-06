ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.6

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.6.1.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=4bc05486fe4d38b453d3ddf2179af79a \
    MYSQL_MD5=90df2164eba77cdaea689bb00daee198 \
    MARIADB_MD5=1b6eeb0ee5873d4af5db3c5bf3536101 \
    POSTGRES_MD5=66745383aa6a8f6ffa8d4f9889dcc83a \
    SQLSERVER_MD5=060e0c7a75a9fcc1d3d221dcfba9b8b2 \
    ORACLE_MD5=153554d7b9dcce83dee646909feb3536 \
    DB2_MD5=f452983ee68de89a830fa14cbcbf7997 \
    SPANNER_MD5=d7a0a409398322e0f5d1936247170142 \
    VITESS_MD5=49169f2696e150efb0026e5906f2c95e \
    JDBC_MD5=144df175107a6b69e200fe21009e53c8 \
    INFORMIX_MD5=c881e816764c258661cedeac112276d1 \
    IBMI_MD5=9bfcb3c46e985208116e8e2a73bc209d \
    COCKROACHDB_MD5=ff8375afdbca475a2d99962c27e209ee \
    SCRIPTING_MD5=3d4b34c8991ebb7355a3a9d839447681 \
    CHRONICLE_QUEUE_MD5=1fb066da6a67c7c02962f59b4b8cd1ee

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
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5" && \
    docker-maven-download debezium-store storage-chronicle-queue "$DEBEZIUM_VERSION" "$CHRONICLE_QUEUE_MD5"

