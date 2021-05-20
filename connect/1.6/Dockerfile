FROM debezium/connect-base:1.6

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.6.0.Beta1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=6d5761ac44429dd67e5d5b097a0eb77f \
    MYSQL_MD5=56ce3d66bd33ae59dac517aad875a0a1 \
    POSTGRES_MD5=a30005242abe73243b73be77da1666d9 \
    SQLSERVER_MD5=a8cd73daac60cb0681ce979cd7bf8e1a \
    ORACLE_MD5=327bee950d85741e4a3dd87a8199fa47 \
    DB2_MD5=cba18e5b8551933dde6978d3a767013e \
    VITESS_MD5=0ea0a37a500c1d6ed23134c5c3b66ef8 \
    SCRIPTING_MD5=d91b2b3610a2afc181e868969d9e2a8c

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
