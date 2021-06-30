FROM debezium/connect-base:1.7

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.6.0.Final" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=191ea81c10207ec07dfd7029b48127ca \
    MYSQL_MD5=ac61d099ec5f7c1c89714399741cf465 \
    POSTGRES_MD5=aa8fab35bbfacdf6a85c3ca1c1d86940 \
    SQLSERVER_MD5=8edb5cf70ae0eeae1f3f27d2ed32688c \
    ORACLE_MD5=d51d0111bec460dac4fa8d25b97f0b15 \
    DB2_MD5=5d87cb2b2be6d1c2ba64832458b49e0b \
    VITESS_MD5=7e76a6517fa65ac199eaf2c36262bc61 \
    SCRIPTING_MD5=d8810c3df51a9fb90268ded2ff202ffa

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
