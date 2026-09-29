#!/usr/bin/env bash
# На VPS под root:
#   curl -fsSL https://raw.githubusercontent.com/Hertuno/vpn-status-live/main/install-adguard.sh | bash
# Или с явным DNS IP:
#   curl -fsSL ... | GATEWAY=10.8.0.1 bash
set -euo pipefail

echo "== DNS без рекламы (AdGuard Home) =="

if [[ "$(id -u)" -ne 0 ]]; then
  echo "Нужен root"; exit 1
fi

if ! command -v docker >/dev/null 2>&1; then
  echo "Ставлю Docker..."
  curl -fsSL https://get.docker.com | sh
fi

if [[ -z "${GATEWAY:-}" ]]; then
  for cand in $(ip -4 -o addr show | awk '{print $4}' | sed 's#/.*##' | grep -E '^10\.|^172\.(1[6-9]|2[0-9]|3[0-1])\.|^192\.168\.' || true); do
    if [[ "$cand" == *.1 || "$cand" == *.0.1 ]]; then
      GATEWAY="$cand"
      break
    fi
  done
fi

if [[ -z "${GATEWAY:-}" ]]; then
  echo "Не нашёл gateway. Список:"
  ip -br a || true
  echo "Запусти так: curl -fsSL ... | GATEWAY=10.8.0.1 bash"
  exit 1
fi

echo "VPN_DNS_IP=$GATEWAY"
DIR=/opt/adguard-vpn
mkdir -p "$DIR/work/conf" "$DIR/work/data"
cd "$DIR"

if systemctl is-active --quiet systemd-resolved 2>/dev/null; then
  mkdir -p /etc/systemd/resolved.conf.d
  printf '%s\n' '[Resolve]' 'DNSStubListener=no' >/etc/systemd/resolved.conf.d/adguard-dns.conf
  systemctl restart systemd-resolved || true
fi

cat >docker-compose.yml <<EOF
services:
  adguardhome:
    image: adguard/adguardhome:latest
    container_name: adguardhome
    restart: unless-stopped
    ports:
      - "127.0.0.1:3000:3000/tcp"
      - "${GATEWAY}:53:53/tcp"
      - "${GATEWAY}:53:53/udp"
    volumes:
      - ./work/conf:/opt/adguardhome/conf
      - ./work/data:/opt/adguardhome/work
    environment:
      TZ: Europe/Moscow
EOF

docker compose pull
docker compose up -d

echo
echo "Готово. Кабинет: ssh -L 3000:127.0.0.1:3000 root@SERVER → http://127.0.0.1:3000"
echo "В клиентах DNS = ${GATEWAY}"
echo "Проверка: dig @${GATEWAY} youtube.com +short"
