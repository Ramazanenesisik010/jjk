FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=xterm

# Temel bağımlılıklar ve tmate kurulumu
RUN apt-get update && apt-get install -y \
    curl \
    git \
    xz-utils \
    tmate \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Ngrok resmi linux sürümünü indir ve kur
RUN curl -s https://amazonaws.com | tee /etc/apt/trusted.gpg.p411 > /dev/null \
    && echo "deb https://amazonaws.com buster main" | tee /etc/apt/sources.list.d/ngrok.list \
    && apt-get update && apt-get install -y ngrok

# PufferPanel resmi paket deposunu ekle ve kur
RUN curl -s https://packagecloud.io | bash \
    && apt-get install -y pufferpanel \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

RUN chmod +x run_gotty.sh
CMD ["./run_gotty.sh"]
