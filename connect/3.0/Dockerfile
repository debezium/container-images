ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.0

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.0.0.CR2" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=4f123c36c918bd7ffcadf9a1d0f92f6f \
    MYSQL_MD5=438dda1c9489613240f0af184548111d \
    MARIADB_MD5=abd6d19727f62deb9b31b8b887b1e80e \
    POSTGRES_MD5=c6aef11a700dbfcadc95399e504e81da \
    SQLSERVER_MD5=1f9e4ace811a545529aed54a206d4b78 \
    ORACLE_MD5=0c1c7e9b42880767fbdf343acb76ec94 \
    DB2_MD5=b0f65341f08083670c5f7afa7f0d6877 \
    SPANNER_MD5=d4bc2c8f2f1dfa7c5467557676e4bcc3 \
    VITESS_MD5=e1b28c790a7eb07b0dfaec1e85dc1a27 \
    JDBC_MD5=9df2a9f0fb4dc6fe115a0fa019277e78 \
    INFORMIX_MD5=21aabd631f07cc9537fe389675ea7aa3 \
    IBMI_MD5=15c42298ee486b53c1fdaea6becff4d7 \
    KCRESTEXT_MD5=9ee1bb01da728ebb85fab60d2657d219 \
    SCRIPTING_MD5=db9456fe8cbd5cba9e48c1a266bf84a5

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
    docker-maven-download debezium-optional connect-rest-extension "$DEBEZIUM_VERSION" "$KCRESTEXT_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

