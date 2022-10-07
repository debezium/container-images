FROM debezium/connect-base:2.0

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.0.0.CR1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=ab1e395325d3793baedb74791c5f9950 \
    MYSQL_MD5=78329ad6db1e122c4c02d072a9adf210 \
    POSTGRES_MD5=9324c4231b03cd89d031a6b3d931888b \
    SQLSERVER_MD5=1a43722326ab5ccc3357a745b68d7b32 \
    ORACLE_MD5=cb2ef35a7bbed0d9060b29ced9ec18ff \
    DB2_MD5=1936fed8f700f521031cb57bde24a6d9 \
    VITESS_MD5=30b3a8c74549fddce81510c3060c9848 \
    SCRIPTING_MD5=3d0d2db0b96a882f297d4a47210f73ba

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
