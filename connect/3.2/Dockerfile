ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.2

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.2.6.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=70da99b5283f5e694722fab9ad8fb42c \
    MYSQL_MD5=32843151d7703828684488baab29ee1d \
    MARIADB_MD5=142c7725042551032b43556e0a751fc3 \
    POSTGRES_MD5=807bc2af83a3d44bde4a6577ec48c5b8 \
    SQLSERVER_MD5=067410352bca0a70af4e894b41e8a9aa \
    ORACLE_MD5=2494b0bf8d7b2b7f46494c07d825c216 \
    DB2_MD5=36fb4b5d08f13e42592148a30aae2ce9 \
    SPANNER_MD5=98facb09d57aaec0d3250a685e1d5e0f \
    VITESS_MD5=c459d6caae7f15945700f10b0ea60515 \
    JDBC_MD5=02a3b4ecc4afa42758b5285ed5f659f0 \
    INFORMIX_MD5=93ea6b373dd7da12c0e5e17c6abe238c \
    IBMI_MD5=f56f08af49f942a18a6301b1a5939629 \
    SCRIPTING_MD5=a3240f77c56e8c705cb86170ef02d1a8

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium mariadb "$DEBEZIUM_VERSION" "$MARIADB_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium jdbc "$DEBEZIUM_VERSION" "$JDBC_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional spanner spanner "$DEBEZIUM_VERSION" "$SPANNER_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-additional informix informix "$DEBEZIUM_VERSION" "$INFORMIX_MD5" && \
    docker-maven-download debezium-additional ibmi ibmi "$DEBEZIUM_VERSION" "$IBMI_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

