FROM debian:sid

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    bitcoind \
    bitcoin-tx \
    bitcoin-qt \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN useradd --system --uid 666 -M --shell /usr/sbin/nologin bitcoind && \
    touch /etc/bitcoind.conf && \
    chown bitcoind:bitcoind /etc/bitcoind.conf && \
    mkdir /data && \
    chown bitcoind:bitcoind /data
USER bitcoind

# API Ports
EXPOSE 8332 
EXPOSE 8333

VOLUME /data

COPY main.sh /
ENTRYPOINT ["/main.sh"]
