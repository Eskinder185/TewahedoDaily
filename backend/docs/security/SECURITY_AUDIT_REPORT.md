# Tewahedo AI Backend — Security Audit Report

**Date:** 2026-10-17  
**Source:** Local transfer of VM401 tree → `C:\Users\eskew\github\tewahedo-ai`  
**Verified artifacts:** `app/main.py`, `app/security.py`, `docker-compose.yml` (`127.0.0.1:8000:8000`), `Dockerfile.optimized`  
**Production:** Not modified, not redeployed  
**Automated tests:** **31 passed** (`pytest tests`)

---

## Findings

| ID | Severity | Finding | Evidence | Fix status |
|----|----------|---------|----------|------------|
| CHAT-BODY | High | Body limit needed robust streaming + cache | `protect_public_api` | **Fixed** — `read_body_with_limit` drains overflow; caches `_body`/`_receive` |
| CHAT-RL-422 | Medium | Rate limit consumed by 422 | Prior middleware order | **Fixed** — count inside `/api/chat` after validation |
| IP-TRUST | High | `CF-Connecting-IP` without peer check | `get_client_ip` | **Fixed** — trust only localhost/trusted CIDR when enabled |
| IP-XFF | Medium | Spoofed forwarding headers | Review | **Fixed** — XFF / X-Real-IP ignored for identity |
| AI-JSON | Medium | Unsafe `choices[0]` indexing | LiteLLM path | **Fixed** — shape checks + friendly 503 |
| AI-SEM | Medium | Concurrency saturation | Semaphore | **Preserved/hardened** via `acquire_semaphore` |
| DBG-OPEN | High | Debug/test routes public | `/debug/supabase`, `/api/bible/test` | **Fixed** — default off → 404 |
| ERR-LEAK | Medium | Exception text in API errors | Bible/search paths | **Fixed** for reviewed paths + generic 500 handler |
| ASR-DUR | High | Duration abuse | Decode path | **Fixed** — 60s / 960k samples + flush attempt |
| ASR-CONC | High | Unbounded ASR concurrency | `/api/transcribe` | **Fixed** — default 1 |
| ASR-RL | High | No STT rate limit | `/api/transcribe` | **Fixed** — 10/min client, 30/min global |
| ASR-MIME | Medium | MIME alone | Upload handler | **Fixed** — allowlist + suffix fallback |
| CORS | Low | Origins | CORSMiddleware | **OK** — pages.dev + local Vite |
| PORT | High (OK) | Host bind | compose | **Preserved** `127.0.0.1:8000:8000` |
| SECRETS | High (ops) | Gateway secrets | `/run/secrets/tewahedo-ai` | **OK pattern** — file mounts; not logged |
| RL-MEM | Medium (residual) | In-memory limits | design | **Documented** |
| ASR-THREAD | Medium (residual) | Cancel ≠ kill thread | `run_in_threadpool` | **Documented** |
| LIVE-DUAL | Medium (residual) | Live dual AI saturation | not run | **Manual** after authorized deploy |
| HOME-GIT | Low (local ops) | Accidental `C:\Users\eskew\.git` | Workspace history | **Pending user rename** (sandbox ACL blocked agent) |

---

## Root causes (selected)

1. Security controls lived inline without a tested module boundary.  
2. Rate limiting before validation punished malformed JSON.  
3. Cloudflare client IP was trusted whenever syntactically valid.  
4. Debug/test routes were always public.  
5. ASR lacked concurrency/rate/duration enforcement under load.

---

## Compatibility

Preserved: `home-ai`, `max_tokens=4096`, `temperature=0.2`, theological system prompt, Scripture `sources`, structured Bible/Hymns/Prayer/Synaxarium/Calendar routing, localhost Docker publish, CORS allowlist.

---

## Deployment readiness

**Ready for operator review / staging deploy — not auto-deployed.**  
Blockers for production: operator authorization; sync/review diff against live VM401; optional home `.git` cleanup on workstation; live smoke of dual AI + ASR after deploy.
