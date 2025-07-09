ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.3

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.3.0.Alpha1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=87b5dfbb99dc791ee29b279987829999 \
    MYSQL_MD5=c481f3442932c05e528b2ec0748ce1d0 \
    MARIADB_MD5=59e490e97eeb66bd361ae4dee0f8fbe7 \
    POSTGRES_MD5=6e562d166324a424a9e0a9510437ea4d \
    SQLSERVER_MD5=e274f9e3b95fe435c44e2bd14064b13d \
    ORACLE_MD5=c8eea7ef99acda7e1bfa7cd731b95fdf \
    DB2_MD5=de8bc8065e771f28455398f227e4fb92 \
    SPANNER_MD5=c1b6796cc12e7fedf8d361a2c5bb7236 \
    VITESS_MD5=866a999d40494bdf1eb4572938fa64bb \
    JDBC_MD5=53339343e30bd0c04a20b0dd36fed9a7 \
    INFORMIX_MD5=79744f8682f4645fad2fb1e628a496ad \
    IBMI_MD5=55f863d4d301c31ceede6e7f870dbd61 \
    COCKROACHDB_MD5=5be3502897047dc650712822d3f351fe \
    SCRIPTING_MD5=dc836c13fb18ab8e8b29abdf8b50192d

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
    docker-maven-download debezium-additional cockroachdb cockroachdb "$DEBEZIUM_VERSION" "$COCKROACHDB_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

