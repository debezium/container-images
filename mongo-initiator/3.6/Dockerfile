FROM mongo:3.6

LABEL maintainer="Debezium Community"

COPY ./docker-entrypoint.sh /

USER mongodb

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["start"]