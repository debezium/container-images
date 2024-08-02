ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.0

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.0.0.Alpha1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=98a232390c38b6c66f0d23ee391cada6 \
    MYSQL_MD5=b9863ba826225754784925c0167f4b03 \
    MARIADB_MD5=d0f3d1d4a5bdc6cdd000520a5bf68003 \
    POSTGRES_MD5=b98f1583f9799a80ae60d85dc09981d1 \
    SQLSERVER_MD5=5f4b255553395b4cbd7860f11a9c47d7 \
    ORACLE_MD5=8fdcef71f46aa3ec1b04264791a4537f \
    DB2_MD5=b2caa202cf17b5215f18350dc81c4c8d \
    SPANNER_MD5=aa3c9b8a319f4d3b953c8410c35feb03 \
    VITESS_MD5=06f767e3ccfeee188f2e877dce7d56ec \
    JDBC_MD5=767d15d505c1278fcd06ecf9205783e6 \
    INFORMIX_MD5=2470d7bfb97a019b921cf143e4a0edb0 \
    IBMI_MD5=de4f8dddcb495727d6628dbb2eddf95c \
    KCRESTEXT_MD5=07db8b5870a8df2d828e0f7e4806cbdd \
    SCRIPTING_MD5=3fa125f75e7fff2ff6093c6e8b65d339

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

