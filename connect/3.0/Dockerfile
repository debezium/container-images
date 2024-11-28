ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.0

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.0.4.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=3093e84f5acbad4d29c64ff802ba02f9 \
    MYSQL_MD5=05c07262ca22de4fcb1807553c7d2ca0 \
    MARIADB_MD5=528c31f3cc09c920d299b68833522e36 \
    POSTGRES_MD5=911bef941b5a7305d4254f55984c5348 \
    SQLSERVER_MD5=3fe0a393acf871e59b37b86684392e27 \
    ORACLE_MD5=6c3e92557261f96dfaeffcb01d8dfd5b \
    DB2_MD5=ffc7bdaab53ba2ea3b83923406f564de \
    SPANNER_MD5=56deef160b953690e64656e0e982a0d3 \
    VITESS_MD5=758875dd2a72696fd467063f6b86c7f9 \
    JDBC_MD5=b8e2275fc46dd87f59b7b575f009a67d \
    INFORMIX_MD5=7b3668828e1c8bee929277a2705bec08 \
    IBMI_MD5=b8c8f1ddfa3db9d68e236f930a1f3d1f \
    KCRESTEXT_MD5=0d5804e9c945427d320d158a04145cc9 \
    SCRIPTING_MD5=115230551a5d5882d4d6fb032f67ddfc

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

