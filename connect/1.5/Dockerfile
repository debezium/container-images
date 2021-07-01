FROM debezium/connect-base:1.5

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.5.4.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=f5a1d7ee3ea169a265ec7a758ef7d65a \
    MYSQL_MD5=75bdf5b13198967309071b3404a9d334 \
    POSTGRES_MD5=2488cff8b332186accac42f6fc91c7e0 \
    SQLSERVER_MD5=cb0ec80909aa911508bec6a84cbb8f26 \
    ORACLE_MD5=6dc6d4ce1a0d000e6666ca654f0a7607 \
    DB2_MD5=df00141bb3c726ed73ffd2b7826af842 \
    VITESS_MD5=5366b36f34a3fc095916e597f2c46911 \
    SCRIPTING_MD5=726a92ff8ee1eaaec8dfd21980623bbe

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
