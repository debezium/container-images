FROM debezium/connect-base:1.6

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.6.1.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=ad491b70042bf5bf341ddd2f43ffd56f \
    MYSQL_MD5=e15658acf6fd35ca01042bdd8fcf58af \
    POSTGRES_MD5=c5ad2b07968bcb35a4e45874a6320e3b \
    SQLSERVER_MD5=85cece25a3ce05425c058cf63250be8a \
    ORACLE_MD5=e8459a183084a708f0a584a1dcf849ce \
    DB2_MD5=da1a7678282032025a1b8e3191264c75 \
    VITESS_MD5=0c30a88f85c2e01cd5425f052c8cbda0 \
    SCRIPTING_MD5=c78267d0c9c48cf59a6897a6c8deb9c1

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
