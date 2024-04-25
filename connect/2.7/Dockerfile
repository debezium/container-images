ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM localhost:5500/debeziumquay/connect-base:2.7

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.7.0.Alpha1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=1aa59d72d9fd9347e1792f3cc3d59385 \
    MYSQL_MD5=3cff94f4d2f2b81d204ec37da318f516 \
    POSTGRES_MD5=258ca1ccc6739a8385937f366825bf5b \
    SQLSERVER_MD5=5b3d9a0a8c6bd9d5bbd1012340b9da70 \
    ORACLE_MD5=bcf7ca1695e1fa19ac886d0e27188857 \
    DB2_MD5=fe6c09755676243dd49c4aa89d9f82d3 \
    SPANNER_MD5=f1b1c7bdc522f9ca258e1eb21767a077 \
    VITESS_MD5=cb835bfb8ebfe1c0971150551f8c55c3 \
    JDBC_MD5=6f33e66ad77f9419f66a090e645a6646 \
    INFORMIX_MD5=614b4f4d59e6e7ff9c6b19d4fcb76de2 \
    IBMI_MD5=43615ede7854c91cc0aa32aff22e2283 \
    KCRESTEXT_MD5=47ba8de48fcbc4dd2d27ce200e4f2160 \
    SCRIPTING_MD5=a91d647e197f0c0f9ecf947fdb83fa2a

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
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

