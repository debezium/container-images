FROM mongo:4.2

LABEL maintainer="Debezium Community"

COPY ./docker-entrypoint.sh /

USER mongodb

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["start"]
