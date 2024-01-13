FROM --platform=linux/amd64 registry.access.redhat.com/ubi8/openjdk-11

LABEL maintainer="Debezium Community"

#
# Set the version, home directory, and MD5 hash.
#
ENV DEBEZIUM_VERSION=2.5.0.Final \
    SERVER_HOME=/debezium \
    MAVEN_REPO_CENTRAL="https://repo1.maven.org/maven2" \
    AWS_MSK_IAM_VERSION=1.1.6
ENV SERVER_URL_PATH=io/debezium/debezium-server-dist/$DEBEZIUM_VERSION/debezium-server-dist-$DEBEZIUM_VERSION.tar.gz \
    SERVER_MD5=0293ac8e8547bd2a8c7d385ce759682a

#
# Create a directory for Debezium Server
#
USER root
RUN microdnf -y install gzip && \
    microdnf clean all && \
    mkdir $SERVER_HOME && \
    chmod 755 $SERVER_HOME

RUN mkdir $SERVER_HOME/conf && \
    mkdir $SERVER_HOME/data

#
# Download and install Debezium Server
#
RUN curl -fSL -o /tmp/debezium.tar.gz "$MAVEN_REPO_CENTRAL/$SERVER_URL_PATH"

#
# Verify the contents and then install ...
#
RUN echo "$SERVER_MD5 /tmp/debezium.tar.gz" | md5sum -c - &&\
    tar xzf /tmp/debezium.tar.gz -C $SERVER_HOME --strip-components 1 &&\
    rm -f /tmp/debezium.tar.gz

## Mount this file onto Debezium
COPY debezium-server-kafka-2.5.0.Final.jar /debezium/lib/
#
# Download AWS IAM jar and put it in /debezium/lib
#
RUN curl -fSL -o "$SERVER_HOME/lib/aws-msk-iam-auth-all.jar" https://github.com/aws/aws-msk-iam-auth/releases/download/v$AWS_MSK_IAM_VERSION/aws-msk-iam-auth-$AWS_MSK_IAM_VERSION-all.jar

#
# Now install all the Amazon related certs for DocumentDB TLS
# https://docs.aws.amazon.com/documentdb/latest/developerguide/connect_programmatically.html#w139aac29c11c13b5b9
#
COPY setup_certs.sh /app/setup_certs.sh
RUN microdnf -y install curl openssl perl
RUN chmod +x /app/setup_certs.sh
RUN mkdir -p /tmp/certs
RUN /app/setup_certs.sh

#
# Allow random UID to use Debezium Server
#
RUN chmod -R g+w,o+w $SERVER_HOME

# Set the working directory to the Debezium Server home directory
WORKDIR $SERVER_HOME

#
# Expose the ports and set up volumes for the data, transaction log, and configuration
#
EXPOSE 8080
VOLUME ["/debezium/conf","/debezium/data"]

CMD ["/debezium/run.sh"]
