FROM debezium/connect-base:1.5

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.4.0.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=5f6e622c501b9450cb18c6513e4cd314 \
    MYSQL_MD5=f9b7fb89e5b0fcfab61547d8b4364200 \
    POSTGRES_MD5=a57d653d21c01646bc7d2611d84bc268 \
    SQLSERVER_MD5=b08e6a4c4620b6a168729ae3d185abd5 \
    ORACLE_MD5=4c05854befe07b92c83a66e8ad4d43e4 \
    DB2_MD5=23dd3705bef05d415b26144be49d30d7 \
    VITESS_MD5=6c4b93fc4d9088d30dbb59f9f054ff5e \
    SCRIPTING_MD5=826a9c60104d2d58fe983c38b0a4d05b

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-additional incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
