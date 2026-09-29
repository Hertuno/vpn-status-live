# Почта при падении (GitHub Secrets)

В репо https://github.com/Hertuno/vpn-status-live → Settings → Secrets and variables → Actions:

| Secret | Пример |
|---|---|
| `SMTP_SERVER` | `smtp.yandex.ru` / `smtp.gmail.com` |
| `SMTP_PORT` | `587` или `465` |
| `SMTP_USERNAME` | логин почты |
| `SMTP_PASSWORD` | пароль приложения |
| `MAIL_FROM` | тот же ящик |
| `MAIL_TO` | клиенты через запятую или твой ящик-рассыльщик |

После сохранения при DOWN/UP Action отправит письмо. Параллельно уже работает ntfy.
