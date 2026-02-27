ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.2

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.2.7.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=2d7a35268077d9dfab672f35be756379 \
    MYSQL_MD5=3044ba9745a1fb39e7763d27039a71a0 \
    MARIADB_MD5=b74a7f2d34a76f131f78d6480aad883c \
    POSTGRES_MD5=e0f738bc7b8ac6976f7c01ab5637b984 \
    SQLSERVER_MD5=b7a576295a869ff0c1718e2f030fc870 \
    ORACLE_MD5=3ca73f12d7d9934c21540931ee65d8df \
    DB2_MD5=d0aea23ecff305ec039e59e543ac75ba \
    SPANNER_MD5=39ee9cbd5c49612da22ff79980b5cb49 \
    VITESS_MD5=dbd71de4e05f8bcd616e1b23905456ba \
    JDBC_MD5=1938e135d9ff5f012fabede04e5581ca \
    INFORMIX_MD5=ece32d6a82582dd2d5326d336d1e3146 \
    IBMI_MD5=e53e1a34f5834bea8b115d7cb15a653b \
    SCRIPTING_MD5=8784828dc7bacf560d7cf191d12a48fd

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium mariadb "$DEBEZIUM_VERSION" "$MARIADB_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium jdbc "$DEBEZIUM_VERSION" "$JDBC_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional spanner spanner "$DEBEZIUM_VERSION" "$SPANNER_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-additional informix informix "$DEBEZIUM_VERSION" "$INFORMIX_MD5" && \
    docker-maven-download debezium-additional ibmi ibmi "$DEBEZIUM_VERSION" "$IBMI_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

