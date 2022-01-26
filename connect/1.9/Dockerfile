FROM debezium/connect-base:1.9

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.9.0.Alpha1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=5d4d3b44fd9f6a85a561716c950506af \
    MYSQL_MD5=dd0c309da7a9b8a5eafb30ab5162f559 \
    POSTGRES_MD5=22a1c7e92afa5fbbf2b6ab53f70305d2 \
    SQLSERVER_MD5=7c8e229bf4dd703bf91e61f26ef96113 \
    ORACLE_MD5=3ca838c81820300d2a0aae731299faa8 \
    DB2_MD5=e997b6bb9fab1bb0dc6ce8ca9468b92d \
    VITESS_MD5=bb37d87ff1d95ae20ae9aa739c5f345c \
    SCRIPTING_MD5=8b12d446718c25ef9f6686cd29ac4d12

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
