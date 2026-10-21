# Manual Infrastructure Checklist (Prioritized)

## P0 — Workstation: rename accidental home Git dir (if still present)

Agent sandbox could not rename `C:\Users\eskew\.git` (Access denied / RX ACL). If it still exists, rename outside the sandbox:

```powershell
Rename-Item -LiteralPath 'C:\Users\eskew\.git' -NewName '.git.bak-accidental'
```

Keep the backup; do not delete until both `TewahedoDaily` and `tewahedo-ai` repos still work.

## P0 — Before production deploy

1. **Sync this tree to VM401 carefully** (diff against `/opt/tewahedo-ai`; do not blind overwrite).  
2. **Confirm** `docker-compose.yml` still has `127.0.0.1:8000:8000`.  
3. **Keep** `ENABLE_DEBUG_ROUTES` unset/false in production `.env`.  
4. **Verify** secrets mount `/etc/tewahedo-ai → /run/secrets/tewahedo-ai:ro` permissions.  
5. **Authorize** container recreate only after backup (see `DEPLOYMENT_AND_ROLLBACK.md`).

## P1 — Cloudflare / edge

| Action | Why | Validate | Rollback |
|--------|-----|----------|----------|
| WAF rate limit on `/api/chat` and `/api/transcribe` | Complements in-memory limits | Mild burst → 429 at edge | Disable rule |
| Confirm tunnel-only ingress | IP trust assumes localhost peer | LAN `:8000` refused | Restore tunnel config |
| Optionally hide `/docs` if exposed | Info disclosure | GET `/docs` from public | Re-enable staging only |

## P1 — Post-deploy smoke (authorized)

- `curl http://127.0.0.1:8000/health` → 200  
- `curl https://ai.eskinder.dev/health` → 200  
- Chat oversize → 413  
- Chat burst → 429  
- Short Amharic webm → 200  
- Debug routes → 404  
- Search Buddy: Bible, Hymns, Calendar, theology + `sources`

## P2 — Capacity / ops

- LiteLLM per-app key limits for shared `home-ai`  
- Alert on 429/503 rates  
- Disk watch for ASR temp files  
- Consider process isolation if ASR abuse continues (cancel ≠ kill thread)  
- Optional Redis rate limit if workers > 1 ever

## Do not do without authorization

- Push to GitHub  
- Restart production Docker  
- Edit Cloudflare policies from CI/agent  
- Publish port 8000 on `0.0.0.0`
