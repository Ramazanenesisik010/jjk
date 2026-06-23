FROM ubuntu:latest

# Soru ekranlarının kurulumu kilitlemesini engelle
ENV DEBIAN_FRONTEND=noninteractive

# Sistem güncellemeleri ve tmate kurulumu
RUN apt-get update && apt-get install -y \
    curl \
    git \
    xz-utils \
    tmate \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

RUN chmod +x run_gotty.sh
CMD ["./run_gotty.sh"]
