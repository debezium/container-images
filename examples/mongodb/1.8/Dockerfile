FROM mongo:5.0

LABEL maintainer="Debezium Community"

ENV REPLICA_SET_HOSTS="localhost"

# Starting with MongoDB 4.4 the authentication enabled MongoDB requires a key
# for intra-replica set communication
RUN openssl rand -base64 756 > /etc/mongodb.keyfile &&\
    chown mongodb:mongodb /etc/mongodb.keyfile &&\
    chmod 400 /etc/mongodb.keyfile

COPY start-mongodb.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start-mongodb.sh

ENTRYPOINT ["start-mongodb.sh"]
