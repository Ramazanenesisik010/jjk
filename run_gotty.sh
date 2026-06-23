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

echo "Bağlantı canlı tutuluyor..."

# Render konteynerinin 'not a terminal' hatasıyla kapanmasını önlemek için
# tmate sürecini attach etmek yerine tail ile logları izleyerek kilitleyin
tail -f /dev/null
