FROM debezium/connect-base:1.9

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.9.0.Beta1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=0c62b91de5d4ae567b942357678911b8 \
    MYSQL_MD5=a0666012007545fac156b12f224c8f2b \
    POSTGRES_MD5=9ceee29fd4b2d110f42ac2075e808d01 \
    SQLSERVER_MD5=569ef7d85d1fba061bdde5fdae8a8105 \
    ORACLE_MD5=2879031f324509d6d71af19998243359 \
    DB2_MD5=a52eaf322726063ecf8fdd4ee70b2ad0 \
    VITESS_MD5=afa4241f4256aa97864cbd005a743b7b \
    SCRIPTING_MD5=29c41f0874848369e1f30df6b3d69d3d

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
