FROM debezium/connect-base:1.4

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.4.0.Alpha2" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=50fa9042d065ae33abb335fe0d6cb6d5 \
    MYSQL_MD5=791c48f786d55e6a2c58d3561dc11d29 \
    POSTGRES_MD5=3b86444c5675936e2fcb7b78a52a87ba \
    SQLSERVER_MD5=e71642e2499ccd823a7d966e33e476e9 \
    ORACLE_MD5=c9775f2845a9fce6ab6060e01a318b14 \
    DB2_MD5=3b57ca91dddf11406edaf2fe0242d243 \
    VITESS_MD5=4371a4cc112e858034e2add8e94fbff4 \
    SCRIPTING_MD5=be54e97c58f29767c0e9289f15cd9457

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-additional incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional incubator db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
