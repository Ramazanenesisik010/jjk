#!/bin/bash

# 1. Render ortam değişkenlerinden Ngrok token kontrolü
if [ -z "$NGROK_TOKEN" ]; then
    echo "HATA: Lütfen Render panelinden NGROK_TOKEN değişkenini tanımlayın!"
    exit 1
fi
ngrok config add-authtoken "$NGROK_TOKEN"

echo "PufferPanel arka planda başlatılıyor..."
/usr/sbin/pufferpanel run &

sleep 3

echo "tmate SSH oturumu arka planda başlatılıyor..."
tmate -S /tmp/tmate.sock new-session -d
sleep 5

echo "=========================================================="
echo "1) TERMİNALE BAĞLANMAK İÇİN SSH ADRESİNİZ (tmate):"
tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}'
echo "=========================================================="

echo "Ngrok tünelleri dünyaya açılıyor (HTTP & TCP)..."
# PufferPanel'in web arayüzünü (8080 portunu) ngrok ile dışarı açıyoruz.
# Eğer ngrok.yml yapılandırma dosyanız varsa burayı `ngrok start --all` yapabilirsiniz.
# Şimdilik paneli açmak için HTTP 8080 portunu tetikliyoruz:
ngrok http 8080 --log=stdout
