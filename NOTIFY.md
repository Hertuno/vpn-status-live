# Подписка на оповещения (без Telegram)

Когда узел падает, сервис шлёт пуш на ntfy — это **не** Telegram и **не** зависит от твоего VPN.

## Клиентам
Откройте и нажмите Subscribe / разрешите уведомления:

**https://ntfy.sh/vpn-hertuno-alert-7f3a9c2e**

На телефоне удобнее приложение ntfy (Android/iOS) — тот же топик.

Страница статуса: https://hertuno.github.io/vpn-status-live/

## Админу
Топик задан в `.github/workflows/monitor.yml` (`NTFY_TOPIC`). Смени строку, если топик засветился посторонним.
