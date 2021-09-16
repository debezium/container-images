FROM debezium/connect-base:1.7

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.7.0.CR1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=cb8d5c6618ab381b59034779668a3571 \
    MYSQL_MD5=2ea42419ee3804b5eeeaa1aff67058b6 \
    POSTGRES_MD5=c629d28e9419508c2b3d85fd7e17666c \
    SQLSERVER_MD5=ca7e004e5f2dfdd15d485ba67254efe6 \
    ORACLE_MD5=52607990d91f27dca86a78dd956648b5 \
    DB2_MD5=4a2244df343984de9287526a26ca9612 \
    VITESS_MD5=a43bfdc3f1d86233631abaa4cd24c05b \
    SCRIPTING_MD5=652ece52966f31b698ebf030c19cfb70

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
