FROM debezium/connect-base:1.3

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.3.0.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=27787826350f858dab57fd7eaf0db972 \
    MYSQL_MD5=1550ea087c675f9e9db5c70df5e3f2cd \
    POSTGRES_MD5=2bf32d403d9e3d951f11d53cb8b35be3 \
    SQLSERVER_MD5=ab8a799fddc1104125f159da71984f19 \
    ORACLE_MD5=7dab51244dfbab8d6f35e0ed22fda205 \
    DB2_MD5=6538b503aac8951ad340530ae57444ac \
    SCRIPTING_MD5=7169d7ad4a2b97e641de4ffbe673cf3a

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-additional incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional incubator db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
