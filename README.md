# Askol Kripto Ağı (`askol.askolperl.org.tr`)

Tamamen bağımsız, EVM uyumlu Proof of Authority (PoA) tabanlı Katman 1 blokzincir projesi.

## Başlangıç

1. Genesis bloğunu başlatın:
   ```bash
   docker run --rm -v $(pwd):/root ethereum/client-go:stable --datadir=/root/data init /root/genesis.json
