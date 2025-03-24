ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:3.1

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="3.1.0.CR1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=b8ac49088a349c23e1c21f28771251af \
    MYSQL_MD5=e6a6b83fd7ac668f496be377ac882d58 \
    MARIADB_MD5=1e186a178890706b414428e0cdcd7f5e \
    POSTGRES_MD5=f32fcb008844efee166b95eb7c0966ed \
    SQLSERVER_MD5=47d60a9bc613b84c2520c8b8b8d8ca00 \
    ORACLE_MD5=930a61c006f865635415728c067ddc6f \
    DB2_MD5=08813ee6d452f4f8998e402ad5b94c12 \
    SPANNER_MD5=98055017c7c247846e13987a50defc99 \
    VITESS_MD5=3d87e23f14cd588bae88e337deeae9e1 \
    JDBC_MD5=8c19e17dd602ddc7097aa5dc2ac4aec0 \
    INFORMIX_MD5=cb630eb1d09f4c4d71e55ca369803134 \
    IBMI_MD5=16c175cccc9558e0449af1da871a4ed7 \
    KCRESTEXT_MD5=135a2fd0f21f4e48b4e50effc957fd52 \
    SCRIPTING_MD5=91f0602745dbf0da59f7f8e2168046cd

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

