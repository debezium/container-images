FROM mongo:3.2.12

MAINTAINER Debezium Community

COPY ./docker-entrypoint.sh /

USER mongodb

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["start"]