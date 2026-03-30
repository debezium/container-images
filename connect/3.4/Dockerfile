ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.4

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.4.3.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=8d72056eba07d5c1e0e8cb1d774b668d \
    MYSQL_MD5=65641c488cff7f085891d7b533d8a679 \
    MARIADB_MD5=511ae2cd16e83184110946276bb96ace \
    POSTGRES_MD5=7752d2629c5aee9d24b95be60b1eb529 \
    SQLSERVER_MD5=b4bf7cc212abe14cc391be6c2c752637 \
    ORACLE_MD5=78321d2e8d086216187cbf253df8dde0 \
    DB2_MD5=44ad13fef25e16852a618a22ff6f826d \
    SPANNER_MD5=bd547824c8bb69e04aa24cb9303393e3 \
    VITESS_MD5=2ecffb54e7f5f68852ff95b325bb9989 \
    JDBC_MD5=6b14dd057b7c2da1994fa2ee79df2565 \
    INFORMIX_MD5=0b2c32fc3a8ca921f241b47fcf300b15 \
    IBMI_MD5=18d9e5ce3feaf69a262fd2f02a428f48 \
    COCKROACHDB_MD5=58b2a4b76fefdfb13ebe601488a047e6 \
    SCRIPTING_MD5=c7ab889a1b34c5be87d5c2597f0c3275

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

