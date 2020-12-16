FROM debezium/connect-base:1.4

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.4.0.CR1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=860bd562acee994830d23c9538d304da \
    MYSQL_MD5=27cb2ca8910798fee4059f4d8e9c3d0c \
    POSTGRES_MD5=f12aee6674ee7e74a12f060ad14eb929 \
    SQLSERVER_MD5=83168fac17434212adaa446609b286f7 \
    ORACLE_MD5=fb5221c1e350297bfcb22fa423f54a04 \
    DB2_MD5=4b5d580a265056a29abda66a8cd50348 \
    VITESS_MD5=ec512abc11818e7b7d29b109b1c11d09 \
    SCRIPTING_MD5=6b364c150ac8f650b136060ebb1b84df

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium-additional incubator oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
