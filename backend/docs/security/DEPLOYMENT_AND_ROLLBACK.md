# Deployment and Rollback (local → VM401)

**Status:** Ready for **operator-authorized** staging/production deploy after diff review.  
**This agent did not deploy.**

## Pre-deploy

```bash
# On operator workstation: review diff vs live
# On VM401:
sudo tar -czf ~/backups/tewahedo-ai-$(date +%Y%m%d%H%M).tgz -C /opt tewahedo-ai
docker inspect tewahedo-api --format '{{.Image}} {{.Config.Image}}'
```

## Deploy (authorized)

```bash
cd /opt/tewahedo-ai
# copy reviewed app/security.py + app/main.py (+ tests optional)
# confirm compose ports: "127.0.0.1:8000:8000"
docker compose up -d api   # or restart if image unchanged and code is bind-mounted
curl -sS http://127.0.0.1:8000/health
curl -sS https://ai.eskinder.dev/health
```

Note: compose bind-mounts `./app:/app`, so updating files on the host and restarting the container is often enough.

## Smoke

| Check | Expect |
|-------|--------|
| Health | 200 |
| LAN `:8000` | refused |
| `/debug/supabase` | 404 |
| Chat >32KB | 413 |
| Chat burst | 429 + Retry-After |
| Theology chat | `type=ai` + sources when applicable |
| Transcribe short | 200 |
| Transcribe abuse burst | 429/503 |

## Rollback

```bash
# Restore prior app files from tarball, then:
docker compose up -d api
curl -sS http://127.0.0.1:8000/health
```
