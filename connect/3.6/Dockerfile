ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.6

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.6.0.Alpha1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=aada1a1ac6abc25783effcb0627875c2 \
    MYSQL_MD5=b7aef0f6cc44d593e88e7e3891019272 \
    MARIADB_MD5=d3486df21c0b5a63fbc0e1182e45d68b \
    POSTGRES_MD5=f887fd032635d34ac5e693d00c0cf8c1 \
    SQLSERVER_MD5=1e4ac9c041eeda44a8da38180867d941 \
    ORACLE_MD5=2b23a438be5c2a5003be902bebb3161d \
    DB2_MD5=a4720f0cd38c7423c79ad5c909a9f2e3 \
    SPANNER_MD5=736988e060fccff284a5f3beb249d2f4 \
    VITESS_MD5=9fa8c39023bec11d2ca75aae2a770264 \
    JDBC_MD5=efe76b142dc3cc0732335a79b1209a1c \
    INFORMIX_MD5=226831dcead1c3078a9a577ee6e65208 \
    IBMI_MD5=1db624bd03b59d1f6d5bcd76d206ef94 \
    COCKROACHDB_MD5=e1cf7edfb69de817d6447978e3d354a4 \
    SCRIPTING_MD5=2c672e4b2406a1c33c3eb727c08df77c

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

