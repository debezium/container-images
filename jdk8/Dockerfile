# A base docker image for the Debezium Java-based images, with Azul Zulu OpenJDK 8 installed.

FROM azul/zulu-openjdk-debian:8u72

MAINTAINER Debezium Community

RUN apt-get update && apt-get install -y --no-install-recommends \
		ca-certificates \
		curl \
	&& rm -rf /var/lib/apt/lists/*