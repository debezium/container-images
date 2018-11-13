FROM mongo:4.0

LABEL maintainer="Debezium Community"

COPY ./docker-entrypoint.sh /

USER mongodb

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["start"]