ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.0

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.0.5.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=8d7886576c765b824ab715bed67cdd2d \
    MYSQL_MD5=fa3b0c2cd71181f5528d47076b6febd6 \
    MARIADB_MD5=c4dea7462e5ccd1bd5515cd927b8c795 \
    POSTGRES_MD5=fa3dda0fe521a13d906bf15eaa6e37f7 \
    SQLSERVER_MD5=273ef214f9a7f54fd07fee1acc1daab7 \
    ORACLE_MD5=6c28981df430367eb7d2a5cf8af06ee9 \
    DB2_MD5=94fa2521c45e690e431f959288e343d9 \
    SPANNER_MD5=a5c772fb43671964bfe99fb2fef7910f \
    VITESS_MD5=f587b253b1f73139a1f2e930c3ffe978 \
    JDBC_MD5=1895b3bdac406b0b0360c204ca45faf4 \
    INFORMIX_MD5=d1a36fba5c1f14dafe78dfeb4f9dd3cc \
    IBMI_MD5=8004b80d8218fd0a85848cdbae7a3a4a \
    KCRESTEXT_MD5=fc589e62a6a3735232293a04e1a38714 \
    SCRIPTING_MD5=52d90b15aeae5f5cf5e442f5dd3f901b

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

