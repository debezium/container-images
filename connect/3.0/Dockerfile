ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.0

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.0.0.Beta1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=5eda00869cf2f74255eb5be75386c588 \
    MYSQL_MD5=720f11b928ee93a8dc7259d9ff5d7257 \
    MARIADB_MD5=52fafa826ee8a79fedb278404e869577 \
    POSTGRES_MD5=d9c3384583ccd7a37a325e0b6c495f6a \
    SQLSERVER_MD5=7add96b8748b15ca1767ddb695dad387 \
    ORACLE_MD5=e84b95f68905bc209fc4b3beee16dc64 \
    DB2_MD5=6a9e991b603ca9a4f11fdbaf4b725e1e \
    SPANNER_MD5=ac3f6dafe0eb5f28bbf368e6c37b0f63 \
    VITESS_MD5=bd633b74130c2fb227c2814635bd2dde \
    JDBC_MD5=651a2ce45ec922bc0350d218a1947bce \
    INFORMIX_MD5=0962bd6fddd2e785bbc3547414704039 \
    IBMI_MD5=5ea77389d83dcf8f1456a870ef86f3bb \
    KCRESTEXT_MD5=3db89260d720f4ed72d975cb3c97a8b2 \
    SCRIPTING_MD5=994e04275d58ec3c8a4fd5ea1838719c

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

