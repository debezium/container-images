FROM debezium/connect-base:1.8

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.8.0.Alpha1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=3feea21e027f01c73fbdfce0666066c7 \
    MYSQL_MD5=6ee0b63039cc7d054c2fb1e2b44bd538 \
    POSTGRES_MD5=224e687881dbdc6bbdaed2c09e83cfeb \
    SQLSERVER_MD5=9d2f9e36c705ddb2726e672debfd706c \
    ORACLE_MD5=c5edfe0a98319ce9a3fcf67720b45cf9 \
    DB2_MD5=7801d71e187bf5567353a35a2561d3c9 \
    VITESS_MD5=061d262d83eec0a112cb1ed47b1a1145 \
    SCRIPTING_MD5=88c6b7126b8e4cc10aa0798823bfbef0

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
