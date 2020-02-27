FROM debezium/connect-base:1.0

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.0.2.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPO_INCUBATOR="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=48e29fd95b92481dc4a4815c28467ac4 \
    MYSQL_MD5=579be868cc9c393dda34e08904647b66 \
    POSTGRES_MD5=5f281fdf09ad6a55d0d7939cbffc7bcf \
    SQLSERVER_MD5=3009ee5a04ad7c8793555d0e17918c4b \
    ORACLE_MD5=96246c2e3158d7efb630112657edcdac

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5"
