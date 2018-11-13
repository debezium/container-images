FROM mongo:3.4

LABEL maintainer="Debezium Community"

COPY ./docker-entrypoint.sh /

USER mongodb

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["start"]