FROM debezium/connect-base:1.0

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.0.0.Beta2" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPO_INCUBATOR="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=d81872ab07bf7f7d1b06ab19eb3cdb5b \
    MYSQL_MD5=db56b2bc0417ebcfc09c853afc48001f \
    POSTGRES_MD5=626f771d6658bc48174b52dadeb90601 \
    SQLSERVER_MD5=7b439c0f3eeead6ff45873116fe7416d \
    ORACLE_MD5=ad88868511bf516343150969ee9dd6f7

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5"
