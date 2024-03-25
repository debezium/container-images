ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.6

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.6.0.CR1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=fc4f88eb4413fafab298b868d67c2118 \
    MYSQL_MD5=e10b42d323143106a753e1cda5bc666a \
    POSTGRES_MD5=31ea8ec05984844d4bc9fcb60c3fbfbd \
    SQLSERVER_MD5=ccd51dcb698c9c595ebfa7336bbea184 \
    ORACLE_MD5=b37eb1807ad07aa33721141d49bb1a3c \
    DB2_MD5=f964dd8164b53d68246eccbe78f5aced \
    SPANNER_MD5=ad2082aa0525110df1da1bac96348615 \
    VITESS_MD5=dec82996f6e315e5cc8b50ec124ab5b6 \
    JDBC_MD5=35569d7eea9435f54bcc5e652b42aa79 \
    INFORMIX_MD5=77a13b6a46eb880998d94d46635e1ce1 \
    IBMI_MD5=cde2daebe9ca7c850d3fe2f048b1bcfe \
    KCRESTEXT_MD5=157eeede43dfab9ca4e98fb5abd570fb \
    SCRIPTING_MD5=c717d06893db365345dee8a871491314

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

