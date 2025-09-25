ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.2

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.2.3.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=fd4ee6b7ac9f76425e8794e089a7be85 \
    MYSQL_MD5=f96d9a14307bb64f63c19314b760dcb4 \
    MARIADB_MD5=1c8963c481695cf919d8cffa92268e85 \
    POSTGRES_MD5=84530ad5b4c83e2dea3f79efe782b829 \
    SQLSERVER_MD5=a5b5756d3d2c1cc81a4487f2d7ca266b \
    ORACLE_MD5=723c9cf14a2be31d1e23f6d334cdac7e \
    DB2_MD5=ff482375012cf35e529e3f11103dd762 \
    SPANNER_MD5=d78337dec61077be5e04d2fa11c05873 \
    VITESS_MD5=5af3d9e0f96bcba05ec3b5a399d73998 \
    JDBC_MD5=e0067b196b193a4995a24cdac3fe6861 \
    INFORMIX_MD5=f9034b3967e4ee0ec17a64eb5e74c3f2 \
    IBMI_MD5=684f2decc6a207b801fd29f735273d10 \
    SCRIPTING_MD5=f88e5cdeda3e6a142263369b44e607a9

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

