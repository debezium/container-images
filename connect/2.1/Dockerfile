ARG DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME
FROM $DEBEZIUM_DOCKER_REGISTRY_PRIMARY_NAME/connect-base:2.1

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="2.1.4.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=3060b16543ba0fe2cd8c56124d361054 \
    MYSQL_MD5=bb8f739138be7053ac7f13877573d147 \
    POSTGRES_MD5=0284f34be3034188b0cd9229681bdf5e \
    SQLSERVER_MD5=b92b49753a6a7be464ce2602ba680acf \
    ORACLE_MD5=beb7f620dc7b7c76c72530e5937372d9 \
    DB2_MD5=5bc66a99629f3c5ee8ab4a4072f5e4e7 \
    SPANNER_MD5=8d486cb1d55314733d3c8e90872d3558 \
    VITESS_MD5=e31aaec2f054b7dae1f9512e6d83f09e \
    KCRESTEXT_MD5=938af1567be09c099d05f4fb49ce5815 \
    SCRIPTING_MD5=730b79880ac41edf1133a5b7897db322

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional spanner spanner "$DEBEZIUM_VERSION" "$SPANNER_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional connect-rest-extension "$DEBEZIUM_VERSION" "$KCRESTEXT_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"

