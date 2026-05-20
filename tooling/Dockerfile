FROM registry.fedoraproject.org/fedora:40 AS oracle-tool

RUN dnf -y install tar gzip java-21-openjdk-devel

ADD https://github.com/Naros/debezium-oracle-query-tool/archive/refs/heads/main.tar.gz /tmp/repo.tar.gz

RUN mkdir -p /opt && \
    tar -xzf /tmp/repo.tar.gz -C /opt && \
    mv /opt/debezium-oracle-query-tool-main /opt/debezium-oracle-query-tool && \
    cd /opt/debezium-oracle-query-tool && \
    chmod +x mvnw && \
    ./mvnw clean install

FROM registry.fedoraproject.org/fedora:40 AS kcctl

ENV KCCTL_VERSION=v1.0.0.CR4 \
    JAVA_HOME=/usr/lib/jvm/java-21-openjdk/

RUN dnf -y install git java-21-openjdk-devel && \
    git clone https://github.com/kcctl/kcctl.git -b $KCCTL_VERSION --depth 1 && \
    cd kcctl && ./mvnw clean install -DskipTests && \
    cp -r ./target/quarkus-app /usr/bin/kcctl

FROM registry.fedoraproject.org/fedora:40

LABEL maintainer="Debezium Community"

RUN mkdir licenses
COPY LICENSE* /licenses/
ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk/

RUN dnf -y install java-21-openjdk-devel less jq httpie mycli pgcli kcat && \
    dnf clean all && \
    ln -s /usr/bin/kcat /usr/bin/kafkacat

COPY --from=kcctl /usr/bin/kcctl /usr/bin/kcctl-dir

COPY --from=oracle-tool /opt/debezium-oracle-query-tool/target/quarkus-app /opt/debezium-oracle-query-tool

RUN echo -e '#!/bin/bash\njava -jar /opt/debezium-oracle-query-tool/quarkus-run.jar' > /usr/bin/dbzoqt && \
    chmod +x /usr/bin/dbzoqt

RUN echo -e '#!/bin/bash\njava -jar /usr/bin/kcctl-dir/quarkus-run.jar' > /usr/bin/kcctl && \
    chmod +x /usr/bin/kcctl
