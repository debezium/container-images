ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.6

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.6.0.Beta2" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=6fa5022467c78a6a3fd5e1b4fe2cc984 \
    MYSQL_MD5=a59b72996016e5e5eacac50fc0370683 \
    MARIADB_MD5=520e899a465e10f17c5051ba960f54c8 \
    POSTGRES_MD5=0a67610f494b2c96956f651e81b54782 \
    SQLSERVER_MD5=4593468e91246127cb0a7401a7076a2e \
    ORACLE_MD5=cd5bcb7472877dc8dcc01c6acc70a1b1 \
    DB2_MD5=89e18f02a04fe02d5ef2c40b94669044 \
    SPANNER_MD5=60c0e49845cb83a51c6d3936706f350a \
    VITESS_MD5=80f8430b68075688da43ebf913a1d666 \
    JDBC_MD5=1cd049175bad89a9bec9590aa4f8a708 \
    INFORMIX_MD5=4dadc2c26682e63c5fa8a49acefacfb8 \
    IBMI_MD5=a612458a827308724eabb54f070602bb \
    COCKROACHDB_MD5=f871ff919571a6d9c534392f36acd8cb \
    SCRIPTING_MD5=694ec9cf96db4f53661ef8df3f096228 \
    CHRONICLE_QUEUE_MD5=67e360651147fb96dc802065bf2a7299

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

