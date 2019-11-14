FROM debezium/connect-base:1.0

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.0.0.Beta3" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPO_INCUBATOR="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=f583b7e0a28e24ac384c8c17311d23a7 \
    MYSQL_MD5=0a96715b7ff977474e1d8c2818bbf519 \
    POSTGRES_MD5=75543d43c54c7ff5072ed163a2ab384f \
    SQLSERVER_MD5=0254a3d8d968060489dcde1034d38171 \
    ORACLE_MD5=0830de86ceb311df02bed2992fa5b4f0

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5"
