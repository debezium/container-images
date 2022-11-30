ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM debezium/connect-base:2.1

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.1.0.Alpha2" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=79059a6842953fd42f943610b4df4906 \
    MYSQL_MD5=aafb89a8a86e3402505e94c717163e8b \
    POSTGRES_MD5=2c543e6da2df73307ade49e91f15ad2d \
    SQLSERVER_MD5=8618c64a0aed52b5f3b913d9b2f48b3b \
    ORACLE_MD5=7711f320cd07241f15926a68cf2a6d27 \
    DB2_MD5=0d94cd465757aa3961f542dfe7c647a6 \
    VITESS_MD5=b7f3b954891b9526123f63414ea4983b \
    KCRESTEXT_MD5=c6f0df8613c731d1d70f956a547b726f \
    SCRIPTING_MD5=ef7dcf735d729847205d5a77692f6e44

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional connect-rest-extension "$DEBEZIUM_VERSION" "$KCRESTEXT_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

