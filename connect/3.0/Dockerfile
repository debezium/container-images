ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.0

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.0.0.Alpha2" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=978b103b5a456c9cf64031f20682e674 \
    MYSQL_MD5=dcc98784bd5a3969308b07da35552bdf \
    MARIADB_MD5=7606acb52106fca0e3d44136a48ade30 \
    POSTGRES_MD5=e566fd5d0822ac0e1c752f11dca3bd19 \
    SQLSERVER_MD5=631603b995b2eb9f1df8ec1b2b7a32e2 \
    ORACLE_MD5=8ebddf6298f63501de6c742912b532e8 \
    DB2_MD5=404fc088c48d445a61d3f18e0547cc78 \
    SPANNER_MD5=5a71fbabba557999eced070bc146731b \
    VITESS_MD5=9d6a77dee69e9fb84a3a639392a1318d \
    JDBC_MD5=39ea75d533c50d0d60520a9710b1144c \
    INFORMIX_MD5=4f3013f92a2390d2602780c85f930bff \
    IBMI_MD5=d9ba3cb818682775c3dbfb1e351e0fbe \
    KCRESTEXT_MD5=80d270ab2a1d8713090f1aca922967f2 \
    SCRIPTING_MD5=5b91e6a6064f6dc8409902b54e936c48

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

