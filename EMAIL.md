# Почта при падении

## A. FormSubmit (уже в мониторе, без Secrets)

Письма уходят на **hertuno@yandex.ru** через FormSubmit при DOWN/UP.

**Один раз:** после первого теста открой ящик Яндекса → письмо FormSubmit → Activate.
Потом: Actions → **Test notify channels** → Run workflow.

Сменить ящик: Secret `FORMSUBMIT_EMAIL` = другой адрес (тоже нужно Activate).

## B. Через ntfy

| Secret | Значение |
|---|---|
| `NTFY_TOKEN` | токен ntfy Account |
| `NTFY_EMAIL` | подтверждённый ящик |

## C. Свой SMTP (много получателей)

| Secret | Пример |
|---|---|
| `SMTP_SERVER` | `smtp.yandex.ru` |
| `SMTP_PORT` | `587` или `465` |
| `SMTP_USERNAME` | логин |
| `SMTP_PASSWORD` | пароль приложения |
| `MAIL_FROM` | тот же ящик |
| `MAIL_TO` | получатели через запятую |

Пуши ntfy уже работают: https://ntfy.sh/vpn-hertuno-alert-7f3a9c2e
