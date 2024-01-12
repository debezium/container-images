ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.4

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.4.2.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=5990c84ea3c7944b20fd4b66cd646332 \
    MYSQL_MD5=0597110f6dae623765b0984c8f4ce7ec \
    POSTGRES_MD5=dc572b7bfb2e3d7a153f4deaa0bc700f \
    SQLSERVER_MD5=b0499345e055a4e80aa3a8d8aafbf8da \
    ORACLE_MD5=42e4086df69ac3364fddaa021d963362 \
    DB2_MD5=efdc637c023c64d524cf1f9d9ffe6f4e \
    SPANNER_MD5=74de14bd0086eead2bccf065e6b7c6ee \
    VITESS_MD5=45899ada3cddee9b02c37ab27250bd58 \
    JDBC_MD5=b1eabe1a4425df6840d5c8e65dbadb2a \
    KCRESTEXT_MD5=8a8dabe6b9a39444d0a5ebd869aa1bf9 \
    SCRIPTING_MD5=a3bd66bade2ebeb31c3d777b3302cd16

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

