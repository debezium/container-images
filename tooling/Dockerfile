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
RUN echo -e '#!/bin/bash\njava -jar /usr/bin/kcctl-dir/quarkus-run.jar' > /usr/bin/kcctl && \
    chmod +x /usr/bin/kcctl
