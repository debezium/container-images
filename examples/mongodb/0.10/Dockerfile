FROM mongo:3.6

LABEL maintainer="Debezium Community"

COPY init-inventory.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/init-inventory.sh

CMD ["mongod", "--replSet", "rs0", "--auth"]
