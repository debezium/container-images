FROM debezium/connect-base:1.6

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.6.0.Beta2" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=52fd5c1cd056d63c9fbb564c571bf97a \
    MYSQL_MD5=748942ecea5c416288c5f83815e06011 \
    POSTGRES_MD5=0c414ec1f0ba6e4d520eec00526df451 \
    SQLSERVER_MD5=bab3bd75a5a15da7f45df0439eea1bfb \
    ORACLE_MD5=ea7a3588f11e0c78590498463caf5920 \
    DB2_MD5=5fca335ca021602e05b4ab8d644d6af1 \
    VITESS_MD5=092ae9d579ebc27ce1cc5977b96ffaad \
    SCRIPTING_MD5=20aec1eb7932412db719b6841702417b

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
