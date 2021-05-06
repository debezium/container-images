FROM debezium/connect-base:1.6

LABEL maintainer="Debezium Community"

ENV DEBEZIUM_VERSION="1.6.0.Alpha1" \
    MAVEN_REPO_CENTRAL="" \
    MAVEN_REPOS_ADDITIONAL="" \
    MAVEN_DEP_DESTINATION=$KAFKA_CONNECT_PLUGINS_DIR \
    MONGODB_MD5=f6f37d230be4d00c71d0a54cca3d33f0 \
    MYSQL_MD5=b5708d6b3c5eb2e9e770b24ed8277728 \
    POSTGRES_MD5=a8b4c534c4ea6fb58f175e5143043b3f \
    SQLSERVER_MD5=71d11e798e1aa3d36721071173d9d8d3 \
    ORACLE_MD5=7405369009e04a28423843c0ad3171e6 \
    DB2_MD5=28ddb063f82c5db74528884602aba1d0 \
    VITESS_MD5=8d277da70d35799cf1b7d6235e705b9b \
    SCRIPTING_MD5=ac9dee0e208d6d5d42362779fc3fcc16

RUN docker-maven-download debezium mongodb "$DEBEZIUM_VERSION" "$MONGODB_MD5" && \
    docker-maven-download debezium mysql "$DEBEZIUM_VERSION" "$MYSQL_MD5" && \
    docker-maven-download debezium postgres "$DEBEZIUM_VERSION" "$POSTGRES_MD5" && \
    docker-maven-download debezium sqlserver "$DEBEZIUM_VERSION" "$SQLSERVER_MD5" && \
    docker-maven-download debezium oracle "$DEBEZIUM_VERSION" "$ORACLE_MD5" && \
    docker-maven-download debezium-additional db2 db2 "$DEBEZIUM_VERSION" "$DB2_MD5" && \
    docker-maven-download debezium-additional vitess vitess "$DEBEZIUM_VERSION" "$VITESS_MD5" && \
    docker-maven-download debezium-optional scripting "$DEBEZIUM_VERSION" "$SCRIPTING_MD5"
