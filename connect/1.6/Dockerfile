FROM debezium/connect-base:1.6

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.6.2.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=07c39475d8e0a5713016ac339ed8fbe3 \
    MYSQL_MD5=0095dac67bd7802c06ce3b9f996d8edd \
    POSTGRES_MD5=238d0f141e19f0e126b78e1802fef3d0 \
    SQLSERVER_MD5=38d931f1f19405147b4f95f3ad16ca2d \
    ORACLE_MD5=bf038ea7b3b4a5dc5e1298c184da5d92 \
    DB2_MD5=9d3f3a98a83df57d174c6f919fb27028 \
    VITESS_MD5=102e87297d926f53f3349e5118f02569 \
    SCRIPTING_MD5=32260871542bf1c4cd59ff6f59681838

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
