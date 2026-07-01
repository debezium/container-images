FROM mirror.gcr.io/library/mongo:6.0

LABEL maintainer="Debezium Community"

ENV MONGO_INITDB_ROOT_USERNAME=admin
ENV MONGO_INITDB_ROOT_PASSWORD=admin

COPY init-inventory.sh /usr/local/bin/
COPY insert-inventory-data.js /usr/local/bin/

RUN chmod +x /usr/local/bin/init-inventory.sh

# Starting with MongoDB 4.4 the authentication enabled MongoDB requires a key
# for intra-replica set communication
RUN openssl rand -base64 756 > /etc/mongodb.keyfile &&\
    chown mongodb /etc/mongodb.keyfile &&\
    chmod 400 /etc/mongodb.keyfile

CMD ["mongod", "--replSet", "rs0", "--auth", "--keyFile", "/etc/mongodb.keyfile"]
