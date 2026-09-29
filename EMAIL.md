# Почта при падении

Два пути. Достаточно **одного**.

## A. Через ntfy (проще, без своего SMTP)

1. Зайди на https://ntfy.sh → Account → подтверди свой email.
2. Создай Access token в аккаунте.
3. В репо → Settings → Secrets and variables → Actions:

| Secret | Значение |
|---|---|
| `NTFY_TOKEN` | токен из ntfy Account |
| `NTFY_EMAIL` | тот же подтверждённый ящик |

4. Actions → **Test notify channels** → Run workflow — должно прийти письмо + пуш.

На бесплатном ntfy.sh лимит ~5 писем в день с одного IP — для редких падений узлов хватает.

## B. Свой SMTP (много получателей)

| Secret | Пример |
|---|---|
| `SMTP_SERVER` | `smtp.yandex.ru` / `smtp.gmail.com` |
| `SMTP_PORT` | `587` или `465` |
| `SMTP_USERNAME` | логин |
| `SMTP_PASSWORD` | пароль приложения |
| `MAIL_FROM` | тот же ящик |
| `MAIL_TO` | получатели через запятую |

Пуши ntfy уже работают без секретов: https://ntfy.sh/vpn-hertuno-alert-7f3a9c2e
