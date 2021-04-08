FROM debezium/connect-base:1.6

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.5.0.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=4f0391e352ff6c08b38e12da011a9e5e \
    MYSQL_MD5=0ad0c56977e5943496686aad69102fa3 \
    POSTGRES_MD5=5cbbb8038d09341a93596ced3073a6a5 \
    SQLSERVER_MD5=57dd585c88ff3564370b154f57a216a0 \
    ORACLE_MD5=23a5b50fb6381fa236eecd1317e0f995 \
    DB2_MD5=940738a748a0649df880d902dcd07651 \
    VITESS_MD5=a7670c421eb2189dc72fd88b6c08ecd9 \
    SCRIPTING_MD5=970fe5818833348e3e15354d2e3c7177

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
