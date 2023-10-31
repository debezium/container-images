ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.2

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.2.1.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=f773a5fdc84c9b9157dcea4559a84db7 \
    MYSQL_MD5=c83cd14a7db7b7244d711a741735b1de \
    POSTGRES_MD5=dee4403afada17d281af7b1284608d0b \
    SQLSERVER_MD5=a0d307fde0d356973d924f21acce9927 \
    ORACLE_MD5=c698e3a94accd97181039fe47f4bc8b7 \
    DB2_MD5=94980de1c3b0c881e0695247be0b213e \
    SPANNER_MD5=51eea81d20f29e7fa3676b0f2ae990cd \
    VITESS_MD5=7dfafc0b6279c2f0cf29dc4d1e1da263 \
    JDBC_MD5=a51e005d3d713182c8706f71006a5944 \
    KCRESTEXT_MD5=38dc3dcd1d4f3cdfe03f1ffc229c64d3 \
    SCRIPTING_MD5=d0b9056c657a571cc95102d712efc626

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional jdbc jdbc "$DEBEZIUM_VERSION" "$JDBC_MD5" && \
    docker-maven-download debezium-additional spanner spanner "$DEBEZIUM_VERSION" "$SPANNER_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional connect-rest-extension "$DEBEZIUM_VERSION" "$KCRESTEXT_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

