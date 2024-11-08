FROM openjdk:8-jre-alpine

ENV VERSION=1.1.7

# download
RUN wget https://github.com/alibaba/canal/releases/download/canal-${VERSION}/canal.deployer-${VERSION}.tar.gz -O /tmp/canal.server.tar.gz && \
    mkdir /canal-server && \
    tar xzf /tmp/canal.server.tar.gz -C /canal-server && \
    rm -f /tmp/canal.server.tar.gz

COPY ./*.sh /

WORKDIR /canal-server

VOLUME [ "/canal-server/logs/", "/canal-server/conf/" ]
EXPOSE 11110 11111 11112 9100

HEALTHCHECK CMD sh /health.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["startup"]