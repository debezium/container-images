ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.2

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.2.0.Alpha1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=e3e3bc3c611f50e62f78521585f9e807 \
    MYSQL_MD5=48d8e770d279ef31cb78fc2c092f6916 \
    MARIADB_MD5=1fcd37c13187c7fb6532295fced0edd5 \
    POSTGRES_MD5=d5fb4963183281b6aa9dd18d83b17899 \
    SQLSERVER_MD5=1c55e1180ac7211e2a099c0dd8d368b7 \
    ORACLE_MD5=e339bab88bdbac6c4f04df458d23c789 \
    DB2_MD5=00446f8876df1bb48d70ec815ab7b6f4 \
    SPANNER_MD5=4ac4e1571947f8b930c4ca4cc2cb5752 \
    VITESS_MD5=d74d970be00c354aa8d033146548d0a3 \
    JDBC_MD5=440ba70657d3879158639cce7129c7c4 \
    INFORMIX_MD5=1f91cf758135c4bb5f247c8ee1e8abdf \
    IBMI_MD5=a4f4c49ce3a4624cac20ec4fa7e9ae69 \
    SCRIPTING_MD5=3e30adc5747d797bb8a9a3d5bc7208bd

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

