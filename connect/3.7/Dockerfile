ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.7

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.7.0.Beta2" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=cdc5513f2a69e779c40e567f4fba5a79 \
    MYSQL_MD5=b6e0f22b8d07207eaad19d0411ae0fc2 \
    MARIADB_MD5=4b5dec167a95e6d031911a59adbbf667 \
    POSTGRES_MD5=19de71ded928586d74a61fd7b267c861 \
    SQLSERVER_MD5=65bf2bc5a29fe615beae0e8668ebf5a3 \
    ORACLE_MD5=4f1bfc0e792b80d30a82bd44cb449fcb \
    DB2_MD5=462c0af3a819b8513359d2e0fded6dfb \
    SPANNER_MD5=b4b964a99016d0894db4db4d6d5ce76f \
    VITESS_MD5=a0095d4db09224b66f5c98d5c07304c4 \
    JDBC_MD5=96803eb3ba537085bdfb173a80eabf35 \
    INFORMIX_MD5=ba8c03c0953517edc6b94781b8ca977d \
    IBMI_MD5=785252f3e55978487abc555e08078263 \
    COCKROACHDB_MD5=afd3b3cf983bc93da1cfa4a0bf383067 \
    SCRIPTING_MD5=f49e3595c3cd2bace0a4d02e2b46cafa \
    CHRONICLE_QUEUE_MD5=b723979024a0cfa8e28ff9b5dd46df64

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

