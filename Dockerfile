FROM ethereum/client-go:v1.12.0

# Genesis dosyasını yükle ve başlat
COPY genesis.json /tmp/genesis.json
RUN geth --datadir /root/.ethereum init /tmp/genesis.json

# RPC ve WebSocket portlarını aç
EXPOSE 8545
EXPOSE 8546

# Düğümü madencilik aktif ve senin cüzdanın tanımlı şekilde başlat
ENTRYPOINT ["geth", "--datadir", "/root/.ethereum", "--http", "--http.addr", "0.0.0.0", "--http.port", "8545", "--http.vhosts", "*", "--http.api", "eth,net,web3,personal,miner", "--http.corsdomain", "*", "--ws", "--ws.addr", "0.0.0.0", "--ws.port", "8546", "--ws.api", "eth,net,web3", "--mine", "--miner.etherbase", "0x1690496914e3a611364e825784853d84472db853"]
