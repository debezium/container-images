ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.1

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.1.2.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=f77b1ef5a58caba4f978703e6c2ad916 \
    MYSQL_MD5=6b6ca2c86ec46549b53a9994728bb964 \
    MARIADB_MD5=a1143395525590032992267a91281788 \
    POSTGRES_MD5=153cf7fc0821e63cb4969271b3855e08 \
    SQLSERVER_MD5=7b09c568bc10edfd4ac806f07d13df53 \
    ORACLE_MD5=cc5b9185772129ace4516737e03dd838 \
    DB2_MD5=32191593e262c5e0a94fd12fbe2dc377 \
    SPANNER_MD5=cfa8c1dbb5cf6273fff3f58ceb360552 \
    VITESS_MD5=b111f3dcf1a22acc2b24f2daa5dc8b4c \
    JDBC_MD5=eb2247990b3e669c7c65939635ba6e87 \
    INFORMIX_MD5=0273c9bfde326cd51fa17d202121bf6d \
    IBMI_MD5=6a77a47d7ffe10f84a86f6e7ab43fa2d \
    SCRIPTING_MD5=7581dd3c1cd332c9b760e5c178e73176

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

