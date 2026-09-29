# Почта при падении

## A. FormSubmit (без SMTP) — активация из браузера

Письма из GitHub Actions на FormSubmit часто **не доходят**. Активируй форму так:

1. Открой https://hertuno.github.io/vpn-status-live/activate-mail.html
2. Нажми кнопку
3. Яндекс-почта (`hertuno@yandex.ru`) → Входящие **и Спам** → Activate

После Activate монитор шлёт письма при DOWN/UP на тот же ящик.

Сменить ящик: Secret `FORMSUBMIT_EMAIL` + та же активация с другого адреса (поменяй email в `activate-mail.html`).

## B. Свой SMTP Яндекс (надёжнее для продакшена)

1. Яндекс ID → Пароли приложений → создать пароль для «Почта»
2. Secrets в репо:

| Secret | Значение |
|---|---|
| `SMTP_SERVER` | `smtp.yandex.ru` |
| `SMTP_PORT` | `465` |
| `SMTP_USERNAME` | `hertuno@yandex.ru` |
| `SMTP_PASSWORD` | пароль приложения |
| `MAIL_FROM` | `hertuno@yandex.ru` |
| `MAIL_TO` | `hertuno@yandex.ru` (потом можно список клиентов) |

3. Actions → Test notify channels → Run

## C. ntfy + email

| Secret | Значение |
|---|---|
| `NTFY_TOKEN` | токен ntfy Account |
| `NTFY_EMAIL` | подтверждённый ящик |

Пуши без почты уже работают: https://ntfy.sh/vpn-hertuno-alert-7f3a9c2e
