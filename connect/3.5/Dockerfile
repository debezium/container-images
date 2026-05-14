ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.5

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.5.1.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=70520c73160e8249e01dc9503bdd14a4 \
    MYSQL_MD5=b9a1d3c37dae161a5e4fada859ce0f5a \
    MARIADB_MD5=a8b052946687590ed59532b7941f5e06 \
    POSTGRES_MD5=761dca3dc2aea74cf12264fb9349e109 \
    SQLSERVER_MD5=342bb1823d989749abf008b847d49dd5 \
    ORACLE_MD5=6fa697d0e03296cbac2c5bd292962b91 \
    DB2_MD5=283f6310a9f15e252859d59c4e1aefdf \
    SPANNER_MD5=a5380a4cf8441e94a78d862e6783156b \
    VITESS_MD5=fc037c73e4f6bf02be19d9c4338fcfc8 \
    JDBC_MD5=e8af4bdf25f3de3b8cc9cfe7c325fef8 \
    INFORMIX_MD5=d6e949de4c38e3172f602b060d770cbf \
    IBMI_MD5=779ffa716b651c5eb70145ce020a8f3b \
    COCKROACHDB_MD5=8b7ee733594fad5f53357928eb883aca \
    SCRIPTING_MD5=fbcaa1c3d6071cddd2dc05f93da5d3c5

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

