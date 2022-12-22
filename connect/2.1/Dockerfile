ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM debezium/connect-base:2.1

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.1.0.Beta1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=01e2e4bef5ee190ba6143b1fd180440d \
    MYSQL_MD5=ac01e185397b9e4337ebdcfc3e7dba0e \
    POSTGRES_MD5=bcbc23d61713c1af0112edea96bef971 \
    SQLSERVER_MD5=75c96a52de109e787a85fa02710b793d \
    ORACLE_MD5=2379edc04d763bbc709cdbfe3062f474 \
    DB2_MD5=3d7b515bc968305febce8fcbf88498ff \
    SPANNER_MD5=807a17355e17fed4397d1c4db4d74a8b \
    VITESS_MD5=bf86321ea39f7fd5528e6d926c232750 \
    KCRESTEXT_MD5=c6c98640f6edcd467821152e6836af34 \
    SCRIPTING_MD5=45bb75f4391b98dac9ed5b1cedd228f0

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional spanner spanner "$DEBEZIUM_VERSION" "$SPANNER_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional connect-rest-extension "$DEBEZIUM_VERSION" "$KCRESTEXT_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

