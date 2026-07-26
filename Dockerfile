FROM ethereum/client-go:stable

# Genesis dosyasını yükle ve başlat
COPY genesis.json /tmp/genesis.json
RUN geth --datadir /root/.ethereum init /tmp/genesis.json

# RPC ve WebSocket portlarını aç
EXPOSE 8545
EXPOSE 8546

# Düğümü dış dünyaya ve dış domainlere açık RPC sunucusu olarak başlat
ENTRYPOINT ["geth", "--datadir", "/root/.ethereum", "--http", "--http.addr", "0.0.0.0", "--http.port", "8545", "--http.vhosts", "*", "--http.api", "eth,net,web3,personal,miner", "--http.corsdomain", "*", "--ws", "--ws.addr", "0.0.0.0", "--ws.port", "8546", "--ws.api", "eth,net,web3"]
