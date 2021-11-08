FROM fedora:35 AS kcat
RUN dnf -y install gcc which gcc-c++ wget make git cmake
ENV KCAT_VERSION=1.7.0
RUN dnf -y install cyrus-sasl-devel libcurl-devel libzstd-devel zlib-devel openssl-devel krb5-devel
RUN git clone https://github.com/edenhill/kcat -b $KCAT_VERSION --single-branch && \
    cd kcat && \
    ./bootstrap.sh

FROM fedora:35
RUN dnf -y install jq httpie mycli pgcli &&\
    dnf clean all &&\
    curl -SL https://github.com/kcctl/kcctl/releases/download/1.0.0-early-access/kcctl-1.0.0-early-access-linux-x86_64.tar.gz | tar -zx &&\
    mv kcctl-1.0.0-SNAPSHOT-linux-x86_64/bin/kcctl /usr/bin &&\
    rm -r kcctl-1.0.0-SNAPSHOT-linux-x86_64*
COPY --from=kcat /kcat/kcat /usr/bin/kcat
RUN ln -s /usr/bin/kcat /usr/bin/kafkacat

RUN mkdir licenses

COPY LICENSE* /licenses/
