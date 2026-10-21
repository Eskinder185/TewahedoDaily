# Deployment and Rollback (AI FastAPI / VM401)

**Current readiness:** **BLOCKED** — FastAPI source not synchronized into the Cursor workspace. Do **not** deploy from this frontend repository.

---

## Pre-deployment checklist (after sync)

1. [ ] Private backend repo or export of `/opt/tewahedo-ai` opened as workspace.  
2. [ ] Diff reviewed against running container filesystem (`docker diff` / file checksums).  
3. [ ] No secrets committed; `.env` / key files gitignored.  
4. [ ] pytest suite green with mocks (no live GPU/Supabase/LiteLLM).  
5. [ ] Compose still has `127.0.0.1:8000:8000`.  
6. [ ] Explicit operator authorization to restart `api` service.  
7. [ ] Frontend smoke plan ready (Search Buddy, Bible, Hymns, Amharic voice).

---

## Backup (on VM401, before any change)

```bash
# Config + app tree archive (exclude large model caches if needed)
sudo tar -czf ~/backups/tewahedo-ai-$(date +%Y%m%d%H%M).tgz \
  --exclude='**/__pycache__' \
  --exclude='**/.cache' \
  -C /opt tewahedo-ai

# Record running image
docker inspect tewahedo-api --format '{{.Image}} {{.Config.Image}}' | tee ~/backups/tewahedo-api-image-$(date +%Y%m%d%H%M).txt

# Optional: commit-tag or save image
# docker commit tewahedo-api tewahedo-api:prechange-$(date +%Y%m%d%H%M)
```

---

## Safe deployment sequence (authorized operators only)

```bash
cd /opt/tewahedo-ai   # or deploy path after sync
# Apply reviewed changes
docker compose build api   # if Dockerfile changed
docker compose up -d api
docker compose ps
curl -sS http://127.0.0.1:8000/health
curl -sS https://ai.eskinder.dev/health
```

---

## Health checks and smoke tests

| Check | Expect |
|-------|--------|
| `GET http://127.0.0.1:8000/health` | 200 healthy |
| `GET https://ai.eskinder.dev/health` | 200 healthy |
| LAN `http://10.0.0.86:8000/health` | Connection refused |
| `POST /api/chat` small theology Q | 200, `type` ai or structured; `sources` when applicable |
| `POST /api/chat` body > 32 KB | 413 |
| Burst chat | 429 after client/global thresholds |
| Third concurrent AI (controlled) | 503 + Retry-After |
| Bible/Hymns/Calendar GETs | Existing JSON shapes |
| Amharic short transcribe | 200 text |
| Overlong audio | 413 |

---

## Rollback

```bash
# Restore previous image tag/digest recorded in backup
cd /opt/tewahedo-ai
# Example:
# docker tag tewahedo-api:prechange-YYYYMMDDHHMM tewahedo-api:cpu-v1
docker compose up -d api
curl -sS http://127.0.0.1:8000/health
# If app files were edited on disk, restore tarball:
# sudo tar -xzf ~/backups/tewahedo-ai-YYYYMMDDHHMM.tgz -C /opt
```

---

## Known limitations

- In-memory rate limits reset on container restart.  
- Single Uvicorn worker → semaphore/rate state is process-local (acceptable today; document if workers increase).  
- Edge (Cloudflare) and app limits are complementary, not identical.  
- Cancelling an async wait does not kill an in-flight ASR worker thread — document isolation if abuse continues.

---

## Sync procedure into Cursor (recommended)

1. Operator exports `/opt/tewahedo-ai` (scrub secrets).  
2. Clone/open as `tewahedo-ai` workspace.  
3. Re-run security engagement Phases B–F against that repo.  
4. Keep this frontend repo for UI-only changes; link backend via private Git remote.
