FROM debezium/connect-base:1.7

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.7.0.Beta1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=0b19597380a3713ba972647f10fcd517 \
    MYSQL_MD5=4bfcab7fdfa530179ace77adea9f30c9 \
    POSTGRES_MD5=b555df272116e19afce96fe8e85ebc46 \
    SQLSERVER_MD5=575c7def434611c38c5a7ed4f2d14693 \
    ORACLE_MD5=50f860e3d274e367ab57c543965f9739 \
    DB2_MD5=8ed7a898ef8a900534aaca9a1a1bf4fb \
    VITESS_MD5=a3393f1e2b6123448b055429d2f30182 \
    SCRIPTING_MD5=cf4d655bc1a4f53672bb53459005fb4e

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
