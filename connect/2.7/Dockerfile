ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM localhost:5500/debeziumquay/connect-base:2.7

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.6.0.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=e2169b6e79da3c97c14bca50d7675626 \
    MYSQL_MD5=591c1565d9efa7732f6b60cfd12a0d92 \
    POSTGRES_MD5=54abb25a73ebe37876411d87ea6f612d \
    SQLSERVER_MD5=2cba27e4ebee58d716e8e1960fc3dd55 \
    ORACLE_MD5=591352633d43a9705309edf0733500c9 \
    DB2_MD5=f67e5ee9a25e633ba4101fc3c4db055c \
    SPANNER_MD5=2e8685d937df9a07ff2b223421551c99 \
    VITESS_MD5=bf9f5a0bedb6c46e02f5b6469c6b8aaf \
    JDBC_MD5=d91ec1132b2391873bb25003f281f084 \
    INFORMIX_MD5=9dc7c18dacc493b58e09e71fa7a5bd24 \
    IBMI_MD5=bc47df0fb222a4edb01c88a8aea3f748 \
    KCRESTEXT_MD5=3ce9a7dd71b4ce13034591408481ed9b \
    SCRIPTING_MD5=040f9956fbd55108c7feffce7a53b3ed

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional jdbc jdbc "$DEBEZIUM_VERSION" "$JDBC_MD5" && \
    docker-maven-download debezium-additional spanner spanner "$DEBEZIUM_VERSION" "$SPANNER_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-additional informix informix "$DEBEZIUM_VERSION" "$INFORMIX_MD5" && \
    docker-maven-download debezium-additional ibmi ibmi "$DEBEZIUM_VERSION" "$IBMI_MD5" && \
    docker-maven-download debezium-optional connect-rest-extension "$DEBEZIUM_VERSION" "$KCRESTEXT_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

