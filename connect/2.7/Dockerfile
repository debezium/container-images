ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.7

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.7.0.Beta2" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=a2ae4beca3cdbea8a8f260f349486487 \
    MYSQL_MD5=9760af27a068368a114c6e26c01fdaae \
    POSTGRES_MD5=cb1ca4ee45dfd0dd158ad59d9c4005be \
    SQLSERVER_MD5=c63d23bbcb4d4f6121d56e08b553c4ac \
    ORACLE_MD5=08eb87888cceb2e1d163c4b9ffaea7d6 \
    DB2_MD5=d0322498e4f8a5b62349187a4801fee8 \
    SPANNER_MD5=598ea786e912b5a86b99b7e447ae3d4d \
    VITESS_MD5=a09f48081ce1c48b088b2fa5df5977b0 \
    JDBC_MD5=a8b4944769bff82b65383af18411ff98 \
    INFORMIX_MD5=9a3a4cc496f50bcca3005e6d2cb996dc \
    IBMI_MD5=7b8cfe66caa00c42b24ad58fae57438d \
    KCRESTEXT_MD5=ef27d3b1f0fc16c25ae0b864a652446b \
    SCRIPTING_MD5=e026d9904ed175276c57e38fa7095bc6

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

