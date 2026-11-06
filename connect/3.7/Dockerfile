ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.7

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.7.1.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=bd4c81487f68393e9bcf45619ee6efed \
    MYSQL_MD5=1d5bdcccbb92e231901b76526612847b \
    MARIADB_MD5=b52e27b6680488ad13f263a0410c9556 \
    POSTGRES_MD5=1ab3f57143b54413c5d353bbfc4f3c13 \
    SQLSERVER_MD5=3a3f6c29d858ce0f10761bfc223cb4bc \
    ORACLE_MD5=1c25f856cf732cd73d103fa1ef3399c0 \
    DB2_MD5=78e6f9c3ebc555c80f423296f47e8958 \
    SPANNER_MD5=621365295bcf61479b00e79007e5daae \
    VITESS_MD5=1d81a5b9f69a6123844ba1e7f0443864 \
    JDBC_MD5=1f01538e6570989455d1a691424ff1c0 \
    INFORMIX_MD5=3823726473d2fd7e7e10bc09ff55ccc2 \
    IBMI_MD5=7df64a4d3c5c95f1af007d047001ff5f \
    COCKROACHDB_MD5=47267b09470b8744a64f6163ab9ec16a \
    SCRIPTING_MD5=2072b8a23a24b7709c0ea4d9a6f8b84c \
    CHRONICLE_QUEUE_MD5=653d004de1b79df8194827b0db3db96e

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
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5" && \
    docker-maven-download debezium-store storage-chronicle-queue "$DEBEZIUM_VERSION" "$CHRONICLE_QUEUE_MD5"

