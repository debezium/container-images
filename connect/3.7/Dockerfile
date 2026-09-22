ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.7

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.7.0.CR1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=e629dd2e1c905c04428d04bbeb10a994 \
    MYSQL_MD5=5152ca25bee8019f5d072598b46d3f71 \
    MARIADB_MD5=3f97598adf5fceccaea1366b6cf5fb52 \
    POSTGRES_MD5=320ac1fc6e672d8b6f520855b80d7515 \
    SQLSERVER_MD5=620dd3c18ce5cac76414b1411b5aff88 \
    ORACLE_MD5=870418c451cc00f689d59369c5786a39 \
    DB2_MD5=4de6342c08781514a89d53fcab7f8218 \
    SPANNER_MD5=a2e54d761d5ce51da0098725afb54cc2 \
    VITESS_MD5=f7330df7a1bb9cf21ebfa2622497581b \
    JDBC_MD5=4cc87df825a686558579d3a8025f5b6f \
    INFORMIX_MD5=726ca5650f967f950dcc3e86b385b181 \
    IBMI_MD5=ebf49bce50794822688c7be4418a3bf1 \
    COCKROACHDB_MD5=321c6fc39cd64aed83ef705496b737de \
    SCRIPTING_MD5=af4961a878f1ae9c7241300d8c8b7da0 \
    CHRONICLE_QUEUE_MD5=d08b137fefb16b5e08532498a7429b31

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

