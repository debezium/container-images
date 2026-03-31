ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.6

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.5.0.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=ac18d5c4a090359f8af1eb87ad1bda27 \
    MYSQL_MD5=f9c6069db7b486e67968a22996a46b22 \
    MARIADB_MD5=a7d45f403d739506964dee62dee6620d \
    POSTGRES_MD5=927884632e223f28540dd025f4d7d566 \
    SQLSERVER_MD5=cb42c70520ec2de814987867add1525b \
    ORACLE_MD5=b0dcb5613fb30dc861ce4cbbbadc3b5e \
    DB2_MD5=81ab326b2f83a76008384d93f7a8c530 \
    SPANNER_MD5=3e287b00b79308eaf3d8cf3c75acea22 \
    VITESS_MD5=861e9dba83d8bc88ef1bdba7f6a08c83 \
    JDBC_MD5=a4bcb85532e53dac31cd7fb1f2740258 \
    INFORMIX_MD5=660a4f98c7c0a357bba9988089685322 \
    IBMI_MD5=09ab420cf99f0edb7f5a8ee05e4ca0a4 \
    COCKROACHDB_MD5=b4094f642ff00d58eb122b2f33a66d7b \
    SCRIPTING_MD5=14e0be16a9fb67c32e6c92d848931d68

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

