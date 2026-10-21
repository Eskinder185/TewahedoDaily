# Manual Infrastructure Actions

Actions that **cannot** be completed from the frontend Git repository alone. Priority ordered.

---

## P0 — Synchronize authoritative FastAPI source (blocker)

**Why:** Security repair and pytest require the real `/opt/tewahedo-ai` tree, including VM401-only fixes.

**Suggested steps (operator on VM401):**

```bash
# On VM401 — create a non-destructive archive (do not delete live tree)
sudo tar --exclude='./.git' -czf /tmp/tewahedo-ai-$(date +%Y%m%d).tgz -C /opt tewahedo-ai
# Or: initialize git in a copy and push to a private backend repo
sudo cp -a /opt/tewahedo-ai /opt/tewahedo-ai-export-$(date +%Y%m%d)
cd /opt/tewahedo-ai-export-$(date +%Y%m%d)
# Review for secrets before any push (env files, key mounts, .env)
find . -name '*.env' -o -name '*secret*' -o -name '*credential*'
```

Then open that tree as the Cursor workspace root (or add as a second root). **Do not** copy an incomplete invent-ed FastAPI app from the frontend repo onto VM401.

**Validate:** Local tree contains `app/main.py`, Compose, Dockerfile, tests.  
**Rollback:** N/A (read-only export).

---

## P0 — Preserve Docker localhost bind

**Inspect:** Compose `ports:` must remain `127.0.0.1:8000:8000`.  
**Why:** Prevents LAN/WAN bypass of Cloudflare Tunnel.  
**Validate:** From another LAN host, `curl http://10.0.0.86:8000/health` fails; from VM `curl http://127.0.0.1:8000/health` succeeds.  
**Rollback:** Re-apply localhost bind; never publish `8000:8000` unbound.

---

## P1 — Cloudflare Tunnel / WAF / Access

| Setting | Recommendation | Impact on mobile | Validate | Rollback |
|---------|----------------|------------------|----------|----------|
| Tunnel ingress | Only `ai.eskinder.dev` → `http://localhost:8000` | None if unchanged | `cloudflared tunnel ingress validate` | Restore prior `config.yml` |
| WAF rate limit | Edge limits for `/api/chat` and `/api/transcribe` (complement in-app limits) | Occasional 429 under abuse | Trigger mild burst from test IP | Disable rule |
| CF-Connecting-IP trust | App must treat header as trusted **only** because traffic is tunnel-only + localhost bind | Fair per-user limits | Confirm no public bind; probe forged header still blocked at edge when applicable | Revert app IP logic |
| Security headers | Consider CF Managed Headers / Transform Rules | Usually transparent | securityheaders.com on hostname | Remove rule |
| `/docs` / `/redoc` | Restrict or disable in production | None for app users | GET `/docs` from public net | Re-enable for staging only |

**Do not** change Cloudflare from this agent session without authorization.

---

## P1 — Confirm / finish ASR duration patch on VM401

**Inspect:** Whether `MAX_TRANSCRIBE_SECONDS = 60` and sample-count reject exist in deployed `main`/ASR helpers.  
**Why:** Stated as not-yet-tested/deployed.  
**Validate:** Synthetic 61 s fixture → 413; 2 s fixture → 200 (staging).  
**Rollback:** Previous image tag `tewahedo-api:cpu-v1` (or prior digest).

---

## P1 — Secrets hygiene

**Inspect:** Compose mounts for LiteLLM + Cloudflare Access credentials; file permissions `0400` root/container user.  
**Why:** Prevent secret leakage into images/Git/logs.  
**Validate:** `docker inspect` mounts; no secrets in `docker history`; logs scrubbed.  
**Rollback:** Rotate keys if exposure suspected.

---

## P2 — LiteLLM / shared Gemma capacity

**Inspect:** Gateway per-key or per-app rate limits; queue timeouts.  
**Why:** In-app global 60/min does not protect other apps sharing `home-ai`.  
**Validate:** Separate project keys; 429 from gateway under abuse.  
**Rollback:** Prior LiteLLM config.

---

## P2 — Monitoring & backups

- Alert on 429/503 rates for chat/transcribe.  
- Disk watch for ASR temp files.  
- Nightly backup of `/opt/tewahedo-ai` config (excluding secrets content into plaintext Git).  
- Document image digest for rollback.

---

## Explicitly out of scope for unattended agents

- Editing Cloudflare dashboard policies  
- Restarting `tewahedo-api`  
- Changing Proxmox firewall  
- Pushing to GitHub  
- Deploying Redis without approval
