FROM debezium/connect-base:1.4

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.4.1.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=38809fec219a11f863920a49a9aa2b73 \
    MYSQL_MD5=3c8a8b6e5305f72946b4f2fca697e495 \
    POSTGRES_MD5=a24f614c9d42bd91401f886142f6d46b \
    SQLSERVER_MD5=5b835851a05aa1012efdf22b6233348d \
    ORACLE_MD5=9579590fc34a62760b24b524e117d67d \
    DB2_MD5=7610c5384a2718f17ae795681f529982 \
    VITESS_MD5=5013de3ce8e125d87759ffecf5bfb7a6 \
    SCRIPTING_MD5=40e998e534c4f56537b9237997b917c0

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-additional incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
