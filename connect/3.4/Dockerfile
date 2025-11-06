ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.4

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.4.0.Alpha2" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=f767e8b4eb119f54603cf887f8d36bbf \
    MYSQL_MD5=052470f7eaee3d783db795b6caa64d22 \
    MARIADB_MD5=b17128714ed6461e1ba07c2bbd2aecb8 \
    POSTGRES_MD5=89a26c26d53390385b24c6e9b74c6bc2 \
    SQLSERVER_MD5=7e5c474b8c322f1466fbbd2d9d27f46f \
    ORACLE_MD5=615882839eea8bc560f8e6bd06ebf937 \
    DB2_MD5=d4b84cf1a7be8a3ca7d9fdaacef69de1 \
    SPANNER_MD5=cc565aeef63f4800409e9739a41f7736 \
    VITESS_MD5=77f46ca86b2cd094d6e060060153039e \
    JDBC_MD5=18a05feac49aa7aa94312b6f372bc6bb \
    INFORMIX_MD5=cc61960744deecf3e0df8f1700eea3a1 \
    IBMI_MD5=f2b35219860dd8c55df555baf0fd9028 \
    COCKROACHDB_MD5=6682000e828e81b77ff65e89fc4f93ee \
    SCRIPTING_MD5=52e799274add6e4eb5d66e4f6e0d62c4

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

