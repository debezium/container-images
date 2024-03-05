ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.6

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.6.0.Beta1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MONGODB_MD5=1a07833ff75b49800d99ecdfbcef93fc \
    MYSQL_MD5=212227f6707f9c95b6e6d6e1c61cadce \
    POSTGRES_MD5=741b69d502401a5d09e3ed577617df9a \
    SQLSERVER_MD5=a78e319d3680733f47ba61f72592a1a0 \
    ORACLE_MD5=e49e58c575388380c441df8f5d6bfdba \
    DB2_MD5=55ad6469ee7e3a4717d898487e9a2d8d \
    SPANNER_MD5=828214228f00e23ab96fca3ef505010e \
    VITESS_MD5=8303915ca7a19929467757238c9beb0f \
    JDBC_MD5=75a2583e570407f510e8f7e0ea4ae531 \
    INFORMIX_MD5=64e860bfa9c72ae63f265ed57ccbf6ce \
    IBMI_MD5=e973c682354c4725aadd19f3a2d4f635 \
    KCRESTEXT_MD5=b6f5544db912afe6008cc2cdda9f4fe6 \
    SCRIPTING_MD5=97ad6252534bf840fbd3dc27d4da0c82

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

