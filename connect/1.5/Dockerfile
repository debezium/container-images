FROM debezium/connect-base:1.5

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.5.0.Beta2" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=fdc26993facd343831997381280556db \
    MYSQL_MD5=26a764190ec65baa6f39bfd1f001c7bf \
    POSTGRES_MD5=090e0103c39ac7b3feeeb1e1ba2fecdc \
    SQLSERVER_MD5=9df4232a0c2c602c29f9c4e5def45ad7 \
    ORACLE_MD5=928c8ef1182110beccc594d45c3298d3 \
    DB2_MD5=47123ddb9e077e8d1aa10153dc44e0ce \
    VITESS_MD5=9efad526411f5dde52bd363b6a49de90 \
    SCRIPTING_MD5=a164dcc4e94622e27700aa81e44f1ed5

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
