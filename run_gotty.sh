#!/bin/bash

echo "tmate SSH oturumu başlatılıyor..."

# tmate'i arka planda bağımsız bir soketle başlat
tmate -S /tmp/tmate.sock new-session -d

# SSH tünelinin kurulması ve adresin üretilmesi için bekle
sleep 7

echo "=========================================================="
echo "DÜNYAYA AÇILAN SSH BAĞLANTI ADRESİNİZ:"
# Sadece terminalden bağlanabileceğiniz 'ssh ...' komutunu loga basar
tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}'
echo "=========================================================="

# Konteynerin kapanmaması için tmate sürecini ön planda kilitle
tmate -S /tmp/tmate.sock attach
