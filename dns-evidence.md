# DNS filter evidence

Checked at: 2026-11-14T04:25Z against `94.140.14.14`

| Host | Role | Answer |
|---|---|---|
| `doubleclick.net` | block | `;; communications error to 94.140.14.14#53: timed out 0.0.0.0 ` |
| `google-analytics.com` | block | `0.0.0.0 ` |
| `pagead2.googlesyndication.com` | block | `0.0.0.0 ` |
| `google.com` | allow | `142.251.41.142` |
| `cloudflare.com` | allow | `104.16.133.229` |

Result: **OK** — публичный AdGuard DNS режет рекламные имена и пускает обычные.
