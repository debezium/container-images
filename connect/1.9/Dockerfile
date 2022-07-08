FROM debezium/connect-base:1.9

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.9.5.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=c88e77ee851d7db88dfb6a4f5fd4a08e \
    MYSQL_MD5=bc1552b538d8136e6ac7f824c20a4333 \
    POSTGRES_MD5=f8e663b891ecca0d68350b0da0e6cc08 \
    SQLSERVER_MD5=1341b6e95f0603db32e25be70fd210cc \
    ORACLE_MD5=5ed2aa3a6b128fb8e220b385430048fd \
    DB2_MD5=89fa5c983f4e56c176d5f7573c40d07d \
    VITESS_MD5=63c2b55b2623ad4b209433ae9e41fad8 \
    SCRIPTING_MD5=9a2b9ae0ef30cc8de62e4358294803a6

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
