FROM debezium/connect-base:1.2

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.2.4.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPO_INCUBATOR="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=4c95fb7ede304e09e02d887487bd4d8f \
    MYSQL_MD5=c95c7c3267b558db4e14c936d0d5e17b \
    POSTGRES_MD5=5b1bcfaf4cef46fbdd2eeaa228e37455 \
    SQLSERVER_MD5=4e405a6f41979318bbbc3d075349a3b0 \
    ORACLE_MD5=6dc222766846286b14ed434befe7101d \
    DB2_MD5=36e1ba8ba4aaa63068fe43b6fb47ce01

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-incubator db2 "$DEBEZIUM_VERSION" "$DB2_MD5"
