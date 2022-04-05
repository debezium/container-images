FROM debezium/connect-base:1.9

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.9.0.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=05aba76330355e34df8eab2ac5073661 \
    MYSQL_MD5=d94d1dac41158b78fe5510e3b62c948a \
    POSTGRES_MD5=fa6f1b883a9763bbd4b92e20391ce7b6 \
    SQLSERVER_MD5=85e3bf60ca6bcb95f658a239bf0dedd9 \
    ORACLE_MD5=90385731df0e8068e8fba61b22f7a086 \
    DB2_MD5=481d11d1d310b549163ed5c7d6c4fba5 \
    VITESS_MD5=bfefc570d8288fdbc5fc6db4936b118d \
    SCRIPTING_MD5=58660fd64dbe4bfea4cee909f2de6167

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
