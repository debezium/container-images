ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.4

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.4.0.Alpha1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=775d33f3cc0210222728cc4366b411f0 \
    MYSQL_MD5=7e206ae8c8178430a9bc3cc597aafce7 \
    MARIADB_MD5=145e116fd121e36abc7ef49e39a88056 \
    POSTGRES_MD5=56486966329509b546780a2dbe4cb8a7 \
    SQLSERVER_MD5=c83e1582824f362c26ec6fac28017ed5 \
    ORACLE_MD5=9545f52c5068f31e6c0c165ff907612a \
    DB2_MD5=1390b4a1594470014e73843abfae48a5 \
    SPANNER_MD5=c1035e9ee57188e6abdb8cb79502c70e \
    VITESS_MD5=3da149e2dc6e42aac457629b3dcabf64 \
    JDBC_MD5=54c0684458bc094439883c666a88ac5f \
    INFORMIX_MD5=5dbd53a0bd77f1ea8d7334ae4f51ff7f \
    IBMI_MD5=d9760ff9f3dd8cbdaf6e3a11b8b3b4e4 \
    COCKROACHDB_MD5=f31808f52a2172e5538476db38fe6ced \
    SCRIPTING_MD5=9a800065a77858d8fb0fde708eb3f1b9

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

