ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.4

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.4.0.CR1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=e17922576ca023cad74a8e19a2e0d322 \
    MYSQL_MD5=d0b1c53c8d1d15d476f22c1dd51738c7 \
    MARIADB_MD5=fd31fac68abeebd932773e61919262ba \
    POSTGRES_MD5=4355604546354dee5f2817daf7c6501d \
    SQLSERVER_MD5=afcdeee7178808320e6b7da83b5f7092 \
    ORACLE_MD5=67034865dd40a2ff2259f4b1b7380632 \
    DB2_MD5=05a08e6660a2a652ff359014d2a04861 \
    SPANNER_MD5=1fdf86400b6ef3abb7f28112f0d1747e \
    VITESS_MD5=ddae2200c775f1e521313b27d1be9f6d \
    JDBC_MD5=279129ff11587056aaee0176f069336b \
    INFORMIX_MD5=a6f7ceb30f0859d2298ec6f575b60cad \
    IBMI_MD5=a9e278be81e2388235d2d345e2dc4c00 \
    COCKROACHDB_MD5=17158cbb9aa86e3a50265c055a35b223 \
    SCRIPTING_MD5=ceea6252a58e8ba577cf23bbcab98893

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

