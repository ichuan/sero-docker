FROM debian:9
WORKDIR /opt/coin

RUN apt update && apt install -y wget libgmpxx4ldbl libgomp1
RUN wget https://github.com/sero-cash/go-sero/releases/download/v1.0.3-rc2/gero-v1.0.3-rc2-linux-amd64-v3.tar.gz -O - | tar -C /opt/coin --strip-components 1 -xzf -
ENV DYLD_LIBRARY_PATH=/opt/coin/czero/lib/ LD_LIBRARY_PATH=/opt/coin/czero/lib/

# cleanup
RUN apt autoremove -y && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["bin/gero", "--config", "./geroConfig.toml", "--exchange", "--rpc", "--rpcaddr", "0.0.0.0", "--rpcport", "8545", "--rpcapi", "flight,local,sero,exchange", "--syncmode", "fast", "--gcmode", "full"]
