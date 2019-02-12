FROM fedora:28
RUN dnf -y install gcc which gcc-c++ wget make
RUN mkdir kafkacat &&\
    curl -L https://github.com/edenhill/kafkacat/archive/1.3.1.tar.gz | tar xz --strip-components 1 -C kafkacat &&\
    cd kafkacat &&\
    ./bootstrap.sh

FROM fedora:28
RUN dnf -y install jq httpie mycli python-pip gcc redhat-rpm-config python-devel &&\
    pip install pgcli &&\
    dnf clean all
COPY --from=0 /kafkacat/kafkacat /usr/bin/kafkacat
