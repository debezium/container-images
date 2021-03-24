FROM debezium/connect-base:1.5

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.5.0.CR1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=fef1093320b687aada0ef63d29243805 \
    MYSQL_MD5=eb7dbbc044902ff1334b45c335aface8 \
    POSTGRES_MD5=377aee5ced58224d03d60b9b00c1a686 \
    SQLSERVER_MD5=2540c89fb7385b8d2c959d2763910513 \
    ORACLE_MD5=d5d5dbfbc59a5bc636e250f444a52954 \
    DB2_MD5=f0f28ed12066df216460ff91e24d28e8 \
    VITESS_MD5=9dfb07579d261c2fa579931b45b6236c \
    SCRIPTING_MD5=5bed301c50b77853d5eb406d2dfc3b00

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
