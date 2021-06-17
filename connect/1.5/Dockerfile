FROM debezium/connect-base:1.5

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.5.3.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=c444e787e65d6e58235e01d2101fe127 \
    MYSQL_MD5=5c13d5b61c441eec6817cce2aa4d5516 \
    POSTGRES_MD5=4d84f9d2e334a06f9ce31a21203107e0 \
    SQLSERVER_MD5=f6cd79c6d35b6cc1547d0c66a33bdd7f \
    ORACLE_MD5=af81621130de76b5af7ca7497f7955dc \
    DB2_MD5=08087510107908edef3eb4bc7ef60010 \
    VITESS_MD5=22ea534fa7935846ae13667e12111ce2 \
    SCRIPTING_MD5=92f6303d4112d1edb9b9a7889ab64dfa

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
