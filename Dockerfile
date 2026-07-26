FROM ethereum/client-go:stable

# Genesis dosyasını kopyala ve ağı başlat
COPY genesis.json /tmp/genesis.json
RUN geth --datadir /root/.ethereum init /tmp/genesis.json

# RPC portunu dışarı aç
EXPOSE 8545

# Geth sunucusunu dış dünyadan gelen isteklere açık şekilde başlat
ENTRYPOINT ["geth", "--datadir", "/root/.ethereum", "--http", "--http.addr", "0.0.0.0", "--http.port", "8545", "--http.api", "eth,net,web3,personal", "--http.corsdomain", "*", "--ws", "--ws.addr", "0.0.0.0", "--ws.port", "8546", "--ws.api", "eth,net,web3", "--allow-insecure-unlock", "--mine"]
