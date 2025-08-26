ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.3

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.3.0.Alpha2" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=6650b5a756bf9358f504a63f652f7663 \
    MYSQL_MD5=e6db16c23058502c82a141b71dab30ea \
    MARIADB_MD5=084268e458c8fdf8e93f9751c369e5f6 \
    POSTGRES_MD5=fb721073f7d104ccc88947eab5c56bb0 \
    SQLSERVER_MD5=e773747ef95079ae9f34895ec85937ad \
    ORACLE_MD5=4ef1527e914531d261785f25c62cb919 \
    DB2_MD5=099949775d1a52e8041a8377282dfd20 \
    SPANNER_MD5=403dc27e4aa3439bc6e5d8793f42f313 \
    VITESS_MD5=210ffcfe5aeed0a23c2d074f29fa581f \
    JDBC_MD5=576de7323ac2d35833c56b3e07512e09 \
    INFORMIX_MD5=970578177266793a1df05012cb3ad70b \
    IBMI_MD5=b9f194b2a982cbbd2b6366d0e18fb0ff \
    COCKROACHDB_MD5=8fb9658b3c59d812150f532966368160 \
    SCRIPTING_MD5=62a05b4dea8f168375971e5ef5e122f8

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

