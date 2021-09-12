FROM openjdk:8-jre-alpine

ENV VERSION=1.1.5

# download
RUN wget https://github.com/alibaba/canal/releases/download/canal-${VERSION}/canal.admin-${VERSION}.tar.gz -O /tmp/canal.admin.tar.gz && \
    mkdir /canal-admin && \
    tar xzf /tmp/canal.admin.tar.gz -C /canal-admin && \
    rm -f /tmp/canal.admin.tar.gz

COPY ./*.sh /

WORKDIR /canal-admin

EXPOSE 8089
VOLUME [ "/canal-admin/logs/", "/canal-admin/conf/" ]

HEALTHCHECK CMD sh /health.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["startup"]