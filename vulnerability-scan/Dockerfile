FROM fedora:31

COPY SRCCLR.repo /etc/yum.repos.d/
COPY agent.yml /root/.srcclr/agent.yml

RUN chmod 600 $HOME/.srcclr/agent.yml
RUN dnf -y update && dnf -y install srcclr git maven && dnf -y clean all
RUN git clone https://github.com/project-ncl/sourceclear-invoker.git &&\
    cd sourceclear-invoker &&\
    mvn clean install -DskipTests

COPY run.sh /root/run.sh
RUN chmod 755 $HOME/run.sh
WORKDIR /sourceclear-invoker
ENTRYPOINT ["/root/run.sh"]
