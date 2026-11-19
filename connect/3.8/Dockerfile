ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.8

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.8.0.Alpha2" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=884bba4cb1097e244909839abcb94e15 \
    MYSQL_MD5=f71e44ea139d37236917f42c591ac72f \
    MARIADB_MD5=42579663fced1f606532ac223545c581 \
    POSTGRES_MD5=57e9af80a269bc82f65a6acd6b502dc9 \
    SQLSERVER_MD5=816bb54e26bdb30ce30cc4dba66c4bbb \
    ORACLE_MD5=7c57ffa9d8f779a6d3f91e5f9a20cd17 \
    DB2_MD5=7c0ed1355b1016aa68842d16ac06d46b \
    SPANNER_MD5=e6602c58dc44d96093bf2a0176a3bf34 \
    VITESS_MD5=d1c3b14ba89910d33f65962f779d398c \
    JDBC_MD5=e60dfedc18d2c3a88eabf4f94f03fea6 \
    ELASTICSEARCH_MD5=a2ae3f2cec2ed383a97a0ece8bed967b \
    INFORMIX_MD5=365728d3460b2ff0e2264fa6b543d4ca \
    IBMI_MD5=ed7a3b1304d47f3d1dcf7702d97c11aa \
    COCKROACHDB_MD5=f7d3979e09ef2c8f4eb53a6169238eda \
    SCRIPTING_MD5=698b5906544a7476ddc223a76abe275c \
    CHRONICLE_QUEUE_MD5=bf58590d3dfaa1c96e13f937e2b14173

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
    docker-maven-download debezium-additional elasticsearch elasticsearch "$DEBEZIUM_VERSION" "$ELASTICSEARCH_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5" && \
    docker-maven-download debezium-store storage-chronicle-queue "$DEBEZIUM_VERSION" "$CHRONICLE_QUEUE_MD5"

