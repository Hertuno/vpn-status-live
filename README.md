# VPN status (public)

Страница для клиентов **без VPN**:

- https://raw.githack.com/Hertuno/vpn-status-live/main/index.html
- https://cdn.jsdelivr.net/gh/Hertuno/vpn-status-live@main/index.html

Данные в `status.json` обновляет GitHub Action каждые 5 минут (и вручную: Actions → Monitor VPN nodes → Run workflow).

IP узлов на странице не показываются.

Опционально: Settings → Secrets → `DISCORD_WEBHOOK_URL` — сообщение в Discord при DOWN.

GitHub Pages: Settings → Pages → Source: GitHub Actions (workflow `pages.yml`).
