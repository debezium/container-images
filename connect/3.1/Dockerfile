ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.1

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.1.2.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=ef4407dc7eb187e8118e27a553a4d270 \
    MYSQL_MD5=7eebfba8955f24ec5248aca6c1642e2b \
    MARIADB_MD5=a6917873524bd5026c824384793f61b0 \
    POSTGRES_MD5=378cbb27bc6cd6b281ae621f6cf72609 \
    SQLSERVER_MD5=01ef4aa4264d07129e23a80930ab8581 \
    ORACLE_MD5=2fc7c7a00a4cba1f70efaad781435424 \
    DB2_MD5=32191593e262c5e0a94fd12fbe2dc377 \
    SPANNER_MD5=cfa8c1dbb5cf6273fff3f58ceb360552 \
    VITESS_MD5=b111f3dcf1a22acc2b24f2daa5dc8b4c \
    JDBC_MD5=c9302b452aaf5992fb7a3b67ae34a4d2 \
    INFORMIX_MD5=0273c9bfde326cd51fa17d202121bf6d \
    IBMI_MD5=6a77a47d7ffe10f84a86f6e7ab43fa2d \
    SCRIPTING_MD5=c5dba782531a80d2078981d175a982fa

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

