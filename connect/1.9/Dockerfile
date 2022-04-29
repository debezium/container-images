FROM debezium/connect-base:1.9

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.9.2.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=bfe78740d00ff6cdf0239a4df2c3d552 \
    MYSQL_MD5=2f43e2e0108cf62ade1811d9442ad24b \
    POSTGRES_MD5=8b6b3cbe76923bc38750fe4a2bbbc439 \
    SQLSERVER_MD5=35d8c36791a4957f8bd6107905fdf3e9 \
    ORACLE_MD5=99a4eb676c7c96a913bc333f69163bf3 \
    DB2_MD5=07d187667d28ed6a0b8f2a82d5041ce9 \
    VITESS_MD5=c1e6c5f649fca3b7dd513ac32b3c3923 \
    SCRIPTING_MD5=22f7b63f840ce8b4499bdd871935d4af

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
