FROM openjdk:8-jre-alpine

ENV VERSION=1.1.7

# download
RUN wget https://github.com/alibaba/canal/releases/download/canal-${VERSION}/canal.adapter-${VERSION}.tar.gz -O /tmp/canal.adapter.tar.gz && \
    mkdir /canal-adapter && \
    tar xzf /tmp/canal.adapter.tar.gz -C /canal-adapter && \
    rm -f /tmp/canal.adapter.tar.gz

COPY ./entrypoint.sh /entrypoint.sh

WORKDIR /canal-adapter

ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["startup"]