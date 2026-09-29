# VPN status + helpers

## Статус (без VPN)
https://hertuno.github.io/vpn-status-live/

## Пуш при сбоях (ntfy)
https://ntfy.sh/vpn-hertuno-alert-7f3a9c2e

## Почта
[EMAIL.md](EMAIL.md) — GitHub Secrets SMTP_*

## DNS без рекламы на VPN-сервере
```bash
curl -fsSL https://raw.githubusercontent.com/Hertuno/vpn-status-live/main/install-adguard.sh | bash
# или: curl -fsSL ... | GATEWAY=10.8.0.1 bash
```
