ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM localhost:5500/debeziumquay/connect-base:3.2

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.1.0.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=2335bdd2d30876689ac4b3a6fe218e68 \
    MYSQL_MD5=e6bf8d4f2fb3bc892caf5ecc86f68f72 \
    MARIADB_MD5=6d5c55eb7d67eeb9bb07e9f4c82d4f5f \
    POSTGRES_MD5=7b704401e415db48ea03f7dda03f43fb \
    SQLSERVER_MD5=59d1a04f10e54ef7e421e30f9d23dd11 \
    ORACLE_MD5=4cd49d6187458f1f3f166733792e311b \
    DB2_MD5=0ebcf86c387f1759222af0618ef1e54c \
    SPANNER_MD5=54409e422995d5f1c5cfdd9fd911335c \
    VITESS_MD5=46100c38a97cb77525967305dd1dcc69 \
    JDBC_MD5=ac8b37d9fb158caa805c19a0f79ac1be \
    INFORMIX_MD5=87030684b2754d461dab1daeb4271c77 \
    IBMI_MD5=1c575bdd9380f08c398fb5d5c7f739ac \
    KCRESTEXT_MD5=20d827596e888eff9395920e09971a1f \
    SCRIPTING_MD5=390fe64ef0374dc8b6794e9e34550478

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
    docker-maven-download debezium-optional connect-rest-extension "$DEBEZIUM_VERSION" "$KCRESTEXT_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

