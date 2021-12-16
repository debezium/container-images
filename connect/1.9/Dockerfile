FROM debezium/connect-base:1.9

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.8.0.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=9b4d6d99ef5b9d9405de44773ba54463 \
    MYSQL_MD5=9485b648d4f237791478a62ccc41eb37 \
    POSTGRES_MD5=93e991649f7681d75d9f6d8c6d66f8d8 \
    SQLSERVER_MD5=76a22e31ff63707cad6f782157ad4ce4 \
    ORACLE_MD5=a28fe1c8f9274dc88f40739775581e69 \
    DB2_MD5=1ef72bee479aa727809a263b3f8aceab \
    VITESS_MD5=941f7d77e58b56fcad49d451f90cf733 \
    SCRIPTING_MD5=342dc6b2fb48c8200162e340ddc582d5

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
