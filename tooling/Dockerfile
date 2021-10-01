FROM fedora:34 AS kcat
RUN dnf -y install gcc which gcc-c++ wget make git cmake
ENV KCAT_VERSION=1.5.0
RUN dnf -y install cyrus-sasl-devel libcurl-devel libzstd-devel
RUN git clone https://github.com/edenhill/kcat -b $KCAT_VERSION --single-branch && \
    cd kcat && \
    ./bootstrap.sh

FROM fedora:34
RUN dnf -y install jq httpie mycli python3-pip gcc redhat-rpm-config python-devel libpq-devel &&\
    pip install pgcli &&\
    dnf clean all
COPY --from=kcat /kcat /usr/bin/kcat

RUN mkdir licenses

COPY LICENSE* /licenses/
