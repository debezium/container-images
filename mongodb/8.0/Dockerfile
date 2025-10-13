ARG IMAGE_TAG=8.0
FROM mirror.gcr.io/library/mongo:$IMAGE_TAG

LABEL maintainer="Debezium Community"

RUN openssl rand -base64 756 > /etc/mongodb.keyfile &&\
    chown mongodb /etc/mongodb.keyfile &&\
    chmod 400 /etc/mongodb.keyfile

# Copy custom entrypoint script
COPY --chmod=+x mongodb-debezium-entrypoint.sh /usr/local/bin/mongodb-debezium-entrypoint.sh

# Switch to non-root user
USER mongodb

# Override the default entrypoint
ENTRYPOINT ["/usr/local/bin/mongodb-debezium-entrypoint.sh"]