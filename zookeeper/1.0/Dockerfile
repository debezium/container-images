FROM fabric8/java-centos-openjdk11-jdk

LABEL maintainer="Debezium Community"

#
# Set the version, home directory, and SHA hash.
# SHA 512 hash from https://www.apache.org/dist/zookeeper/zookeeper-$ZK_VERSION/zookeeper-$ZK_VERSION.tar.gz.sha512
#
ENV ZK_VERSION=3.5.6 \
    ZK_HOME=/zookeeper \
    SHA256HASH=2bbd0c3a1de0a7d466d0c2c7dce47730bf20002381e2032b87b216bddb41b659d16920c587d4769d45d2ad12230b0fef6adad7fddbfef275bbb547d7bca2c78d
ENV ZK_URL_PATH=zookeeper/zookeeper-$ZK_VERSION/apache-zookeeper-$ZK_VERSION-bin.tar.gz

#
# Create a user and home directory for Zookeeper
#
USER root
RUN groupadd -r zookeeper -g 1001 && \
    useradd -u 1001 -r -g zookeeper -m -d $ZK_HOME -s /sbin/nologin -c "Zookeeper user" zookeeper && \
    chmod 755 $ZK_HOME

#
# Change ownership and switch user
#
RUN chown -R zookeeper $ZK_HOME && \
    chgrp -R zookeeper $ZK_HOME
USER zookeeper

RUN mkdir $ZK_HOME/data && \
    mkdir $ZK_HOME/txns && \
    mkdir $ZK_HOME/logs

#
# Download and install Zookeeper
#
#RUN curl -fSL -o /tmp/zookeeper.tar.gz $(curl --stderr /dev/null https://www.apache.org/dyn/closer.cgi\?as_json\=1 | sed -rn 's/.*"preferred":.*"(.*)"/\1/p')$ZK_URL_PATH || curl -fSL -o /tmp/zookeeper.tgz https://archive.apache.org/dist/$ZK_URL_PATH
RUN curl -fSL -o /tmp/zookeeper.tar.gz https://archive.apache.org/dist/$ZK_URL_PATH

#
# Verify the contents and then install ...
#
RUN echo "$SHA256HASH /tmp/zookeeper.tar.gz" | sha512sum -c - &&\
    tar -xzf /tmp/zookeeper.tar.gz -C $ZK_HOME --strip-components 1 &&\
    rm -f /tmp/zookeeper.tar.gz

# Remove unnecessary files
RUN rm -r $ZK_HOME/docs

#
# Allow random UID to use Zookeeper
#
RUN chmod -R g+w,o+w $ZK_HOME

# Set the working directory to the Zookeeper home directory
WORKDIR $ZK_HOME

#
# Customize the Zookeeper and Log4J configuration files
#
COPY ./zoo.cfg $ZK_HOME/conf/zoo.cfg
RUN sed -i -r -e "s|(\\$\\{zookeeper.log.dir\\})|$ZK_HOME/logs|g" \
              -e "s|(\\$\\{zookeeper.tracelog.dir\\})|$ZK_HOME/logs|g" \
              -e "s|(\\$\\{zookeeper.log.file\\})|zookeeper.log|g" \
              -e "s|(\\$\\{zookeeper.tracelog.file\\})|zookeeper_trace.log|g" \
              -e "s|(\[myid\:\%X\{myid\}\]\s?)||g" \
              -e 's|#(log4j.appender.ROLLINGFILE.MaxBackupIndex.*)|\1|g' \
              $ZK_HOME/conf/log4j.properties
RUN mkdir $ZK_HOME/conf.orig && mv $ZK_HOME/conf/* $ZK_HOME/conf.orig

#
# Expose the ports and set up volumes for the data, transaction log, and configuration
#
EXPOSE 2181 2888 3888
VOLUME ["/zookeeper/data","/zookeeper/txns","/zookeeper/conf"]

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["start"]
