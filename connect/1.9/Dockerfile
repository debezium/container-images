FROM debezium/connect-base:1.9

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.9.4.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=27656349cf38d03e36eca911368f7655 \
    MYSQL_MD5=7e4a7183961b43bd276dce4f8a67065e \
    POSTGRES_MD5=31d2525c2eb34d886830ac6ec962e073 \
    SQLSERVER_MD5=f5fff7ca73338de5a56e46366fee0757 \
    ORACLE_MD5=1653d398d2b88185e7e6d56b25b032d8 \
    DB2_MD5=eebc198acc90c6636ffee3490fb01e60 \
    VITESS_MD5=1e5aab1719ee934c0b68132f8dc7a85c \
    SCRIPTING_MD5=f320cbe7cb4bac36c5275c6edf4d8f26

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
