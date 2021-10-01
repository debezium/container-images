FROM debezium/connect-base:1.7

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.7.0.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=b2f32e9a1622dafaa1152ffe05803396 \
    MYSQL_MD5=4e734ac99d232c663d63249369d3c714 \
    POSTGRES_MD5=11c1e135700e11e4ca6fdf62cea8308e \
    SQLSERVER_MD5=559a08b9b97cb9f912f96c2782a1948e \
    ORACLE_MD5=94a8d8764d2617ee573ce9dc57f854b9 \
    DB2_MD5=09f5222e1ba43a53c6c0cde359daae50 \
    VITESS_MD5=71f6e41b61b47c0b88e3b01787a99a94 \
    SCRIPTING_MD5=c6d4971a81a547db38f1325099219551

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
