ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.2

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.2.0.Alpha3" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=64b21e2f556c21bac0903497a213b334 \
    MYSQL_MD5=47bd6eceb7899391a9c142372e298ff4 \
    POSTGRES_MD5=93afb1586197e2900b903bbfe3199fe6 \
    SQLSERVER_MD5=7731989f1aa7ec3a80b770790cf0d012 \
    ORACLE_MD5=a3282cda3a7821514da30a86db87a1ce \
    DB2_MD5=af387f112828ab1840eb2e225dff3414 \
    SPANNER_MD5=ac194c2d1700048ca9a1a7b3f2537363 \
    VITESS_MD5=3e430f8060b028b0a2f6dc661db15ac6 \
    JDBC_MD5=3e430f8060b028b0a2f6dc661db15ac6 \
    KCRESTEXT_MD5=c8d0366803f8750dfcfe95527511152a \
    SCRIPTING_MD5=bc0e7786eb45f9217be6b18a2f36ea48

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

