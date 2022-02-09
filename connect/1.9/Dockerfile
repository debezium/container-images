FROM debezium/connect-base:1.9

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.9.0.Alpha2" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=9ea57f4a3d986390fd25b5a4d7a97f36 \
    MYSQL_MD5=6af456a1907ff942f5ffc50a0e7ba069 \
    POSTGRES_MD5=a39b92c42ac145823c9a24fad7bf6abe \
    SQLSERVER_MD5=3df0cc93eaf698f132131ada90e1b671 \
    ORACLE_MD5=5cd29e5540c6fd2033bcbdd74eb96866 \
    DB2_MD5=bd8069ec3155f760888113ac169089a9 \
    VITESS_MD5=904dc643ca289c2e5c3d972eabe5306f \
    SCRIPTING_MD5=4b4565d58d02fa4eff1902ab8f550fd6

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
