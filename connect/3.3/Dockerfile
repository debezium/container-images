ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.3

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.3.1.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=1d6d5104da9c2eeb7b70d456874f206f \
    MYSQL_MD5=03c0966b9b3bc695597e79f3b01cb211 \
    MARIADB_MD5=8e138a67049a1b50e6f409d88e972a04 \
    POSTGRES_MD5=0ddd632ff3316f6b4f77bcc6af3cfec7 \
    SQLSERVER_MD5=e43062f6b0d9ea8474ba75effebe46c2 \
    ORACLE_MD5=46ca6ef24665239ce42584e3297125f9 \
    DB2_MD5=5aa3e74779cfa218c8821ae3ec753a0a \
    SPANNER_MD5=cd8311da30c6d47f6adc5309a09ed132 \
    VITESS_MD5=c36223347807911f64a3f6af467c37b1 \
    JDBC_MD5=d4f69cd60faf689662628bc46d95d8a9 \
    INFORMIX_MD5=1f7be6a09933cd73617a1ed311303a16 \
    IBMI_MD5=a0e3d0d3eed9b469f19c153759446973 \
    COCKROACHDB_MD5=26e1220db764b69898731a9829fde8bd \
    SCRIPTING_MD5=8aea18c254aafde2306da66da7562a57

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

