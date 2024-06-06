ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.7

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.7.0.Beta1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=daf72cb8555b128ae1d43d33388fa521 \
    MYSQL_MD5=7a25d8b08973570d062b32cc0fc7f08c \
    POSTGRES_MD5=7bd3272d18e13bc496b9ced91e54f298 \
    SQLSERVER_MD5=3d0e840bfb3462ba0cf2dfaaf06dbd5e \
    ORACLE_MD5=65c619807a5a0532b05f39ca5fed10e4 \
    DB2_MD5=92071352b1887cf5fd64c0f3bd5f094b \
    SPANNER_MD5=92b6429a3453d372eed544dd3426a0bf \
    VITESS_MD5=118abdd50a694ab671a47e0815dd82e2 \
    JDBC_MD5=3582c1617b032bb695ec1b0e7aa612f1 \
    INFORMIX_MD5=ce3dcdfa083169590f6e1c9644673ca9 \
    IBMI_MD5=96ec13a19dba0e1e903dc23ded2a4aa7 \
    KCRESTEXT_MD5=a09bfb7ef967a116cbead0cbf83caad8 \
    SCRIPTING_MD5=9f0b7f24b8218c054ee6ff87fdc4cc32

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

