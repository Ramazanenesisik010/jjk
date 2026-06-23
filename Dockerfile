FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=xterm

# Temel bağımlılıklar, tmate ve tarayıcı araçlarının kurulumu
RUN apt-get update && apt-get install -y \
    curl \
    git \
    xz-utils \
    tmate \
    wget \
    && rm -rf /var/lib/apt/lists/*

# HATALI APT DEPOSU YERİNE: Ngrok Linux Binary sürümünü doğrudan indir ve kur
RUN wget https://equinox.io \
    && tar -xvzf ngrok-v3-stable-linux-amd64.tgz -C /usr/local/bin \
    && rm ngrok-v3-stable-linux-amd64.tgz

# PufferPanel resmi paket deposunu ekle ve kur
RUN curl -s https://packagecloud.io | bash \
    && apt-get install -y pufferpanel \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

RUN chmod +x run_gotty.sh
CMD ["./run_gotty.sh"]
