ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.5

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.5.0.CR1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=fd8032b4849145c260a7b7f16c5f70e6 \
    MYSQL_MD5=08430a792a008603bb933c34aaec9626 \
    POSTGRES_MD5=69e2896e52107c86e5ceeba5087f8447 \
    SQLSERVER_MD5=bc04a9ab2ad85f8e04fad355e1d26d42 \
    ORACLE_MD5=f9fbef1e3d8668dcf801eac98a89df2f \
    DB2_MD5=dc5fcf8ddbc5ca6e4b6fe1ac4f5b5d0e \
    SPANNER_MD5=e70e61a870527f3524c1b2d7eaee232a \
    VITESS_MD5=52e1f58902b29f8b5b868ad602f99b23 \
    JDBC_MD5=3edad043a0e57652eefae9eac249ce35 \
    INFORMIX_MD5=4ceac3ad27497f0d417c3a750a789066 \
    KCRESTEXT_MD5=0685d8550fc7b78707838d41733eca46 \
    SCRIPTING_MD5=5b4b738ca6d052d3e89294b7833419ec

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional jdbc jdbc "$DEBEZIUM_VERSION" "$JDBC_MD5" && \
    docker-maven-download debezium-additional spanner spanner "$DEBEZIUM_VERSION" "$SPANNER_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-additional informix informix "$DEBEZIUM_VERSION" "$INFORMIX_MD5" && \
    docker-maven-download debezium-optional connect-rest-extension "$DEBEZIUM_VERSION" "$KCRESTEXT_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

