ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.5

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.5.0.Alpha1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=a02efb00c6a354343934b95239a76f5c \
    MYSQL_MD5=1ad5708703e2c831142e1b44486658f2 \
    MARIADB_MD5=727691632ddcaca67f863e1904e5201d \
    POSTGRES_MD5=62c8627f73e11f2c0fdaa1a95be42bcd \
    SQLSERVER_MD5=e97344e23fbdc5114e993e6493bb36e7 \
    ORACLE_MD5=5cc9a4524b768f23d98eb1b9fcc5708b \
    DB2_MD5=3899e6848b58d99a821dad8d24e80f81 \
    SPANNER_MD5=244d206c389362fa19e252eb84c5850d \
    VITESS_MD5=773c2507bb4121f1696452c34b4fdaae \
    JDBC_MD5=98460523847857536cab9ca350a40308 \
    INFORMIX_MD5=ea868830d2b5011892b9907d50ae1078 \
    IBMI_MD5=306fcdec9bc2ba9eede9d548341ec635 \
    COCKROACHDB_MD5=eedff592159600159fa2431391791470 \
    SCRIPTING_MD5=dddd1bc0eae5da38e53eb0987ed5b9d4

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

