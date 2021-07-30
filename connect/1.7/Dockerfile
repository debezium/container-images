FROM debezium/connect-base:1.7

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.7.0.Alpha1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=3ab9e1da69d52bc06da306d47025ebb8 \
    MYSQL_MD5=bb94cd9e4fb30c5781e388290faa0194 \
    POSTGRES_MD5=905c3300ba0935bc1374687c31e7865a \
    SQLSERVER_MD5=32035b0121ea97375b024b6293873599 \
    ORACLE_MD5=76ccde9a46e0b14042832fa2aac2e10f \
    DB2_MD5=c3ff7d16d0796ce9cbe8617be3ec2d48 \
    VITESS_MD5=7e44cce4ab473d5bc1b5e735095eb868 \
    SCRIPTING_MD5=099db4d5acefb2afb0ee119f91764d43

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
