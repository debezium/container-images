ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.7

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.7.1.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=1316553d7f6151324712eb51f34e59a0 \
    MYSQL_MD5=4d275164f0f3b916a1a8b5c2119f8515 \
    MARIADB_MD5=dca0c30adc6e2240ca9d40fd2d328cc5 \
    POSTGRES_MD5=bf11bd82133150d7a79ddd549ff44fb8 \
    SQLSERVER_MD5=76e6e2d7d3509a9f7d8dcd560d7837a9 \
    ORACLE_MD5=477f03c4a6dc7ef842e2f641d7ee7b04 \
    DB2_MD5=e9dec2fd83a49fa66fff9a29d23f38cb \
    SPANNER_MD5=374bbdefe1f1322d1e5c968350abce3d \
    VITESS_MD5=4481b16bfe4e9f69f0d078db9104dc68 \
    JDBC_MD5=5abe9b06903cfd3e7bf54ff56b51f8f0 \
    INFORMIX_MD5=d407d82b348946c1368dad895b21fa3a \
    IBMI_MD5=826a0e4a13bb08bb3ea9824c21eda7de \
    KCRESTEXT_MD5=b0beb5a346fd1308aa77333587a7940f \
    SCRIPTING_MD5=bb59d3d43ad445614cb3d6ab018f2cf4

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium mariadb "$DEBEZIUM_VERSION" "$MARIADB_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional jdbc jdbc "$DEBEZIUM_VERSION" "$JDBC_MD5" && \
    docker-maven-download debezium-additional spanner spanner "$DEBEZIUM_VERSION" "$SPANNER_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-additional informix informix "$DEBEZIUM_VERSION" "$INFORMIX_MD5" && \
    docker-maven-download debezium-additional ibmi ibmi "$DEBEZIUM_VERSION" "$IBMI_MD5" && \
    docker-maven-download debezium-optional connect-rest-extension "$DEBEZIUM_VERSION" "$KCRESTEXT_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

