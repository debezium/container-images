ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.1

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.1.3.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=0a971ca4798ff55c29cab7e9039099a7 \
    MYSQL_MD5=0cf4d6efb0c705f292c75efddae1fe52 \
    MARIADB_MD5=a302dea084132475c1486c2e95d42e68 \
    POSTGRES_MD5=82d376ce9a8fe0b092dbd39c7584e163 \
    SQLSERVER_MD5=549d168d09fa076e0717001ab5591262 \
    ORACLE_MD5=df47e91571001d25dcf01376ed867a64 \
    DB2_MD5=c592f5c7c2e062c4b9b8b5c79133f448 \
    SPANNER_MD5=3a2b2eb024723b903debc6ffb73c1607 \
    VITESS_MD5=fee29833751d043740e98407f250ff46 \
    JDBC_MD5=d21b8b7e56ffe3ab41d13071ec3a8938 \
    INFORMIX_MD5=4a7bf0a96c914cf5d29956e81e8ff2d8 \
    IBMI_MD5=25007d202d68ef30c27eea2b8aa3522a \
    SCRIPTING_MD5=58119813afff6a9bef9bda200e81045b

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

