FROM debezium/connect-base:1.7

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.7.2.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=701f5739048caccefebc05cfd807518b \
    MYSQL_MD5=71d7e2566f84f53c21ab9649ad713da4 \
    POSTGRES_MD5=3a6698c05857314b3049779ee93c6dab \
    SQLSERVER_MD5=d3e8579b30da5c29e7bbee63caae08b1 \
    ORACLE_MD5=73c0e822e39c5a1817e7c157cfa5fa85 \
    DB2_MD5=116aef045da495b615a3ca9452e0dac1 \
    VITESS_MD5=c58c01e77e4cc685b20911424443cf9f \
    SCRIPTING_MD5=2ddd905ea7e7f11e2382c90b88a5e65f

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
