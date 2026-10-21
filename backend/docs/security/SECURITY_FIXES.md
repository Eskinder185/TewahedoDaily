# Security Fixes — Code Change Summary

**Repository:** `tewahedo-ai` (local)  
**Production VM401:** not modified

## Files

| File | Change |
|------|--------|
| `app/security.py` | Rate limiters (chat + transcribe), trusted CF IP, body limit with drain, semaphore helper, debug flag |
| `app/main.py` | Wire middleware/handlers; debug routes gated; AI JSON validation; ASR duration/concurrency/rate limits; generic 500 handler |
| `tests/**` | Unit + API security suite (mocked upstream) |
| `pytest.ini`, `requirements-dev.txt`, `.env.example` | Local test harness |
| `docs/security/*` | Audit / deploy / manual ops docs |
| `docker-compose.yml` | **Unchanged bind** `127.0.0.1:8000:8000` |

## Before → after (behavior)

| Control | Before (VM401 baseline described) | After (this tree) |
|---------|-----------------------------------|-------------------|
| Chat body | 32 KB via `request._body` | Streamed cap + drain + `_body`/`_receive` cache |
| Chat rate limit | Middleware (422 consumed quota) | After `ChatRequest` validation |
| Client IP | CF header loosely trusted | Only when peer is localhost/trusted CIDR |
| XFF / X-Real-IP | Risk | Ignored for rate-limit identity |
| AI concurrency | Semaphore 2 | Same + shared helper + validated LiteLLM JSON |
| Debug `/debug/supabase`, `/api/bible/test` | Public | 404 unless `ENABLE_DEBUG_ROUTES=true` |
| Transcribe duration | Patch pending | `AudioTooLongError` at 960k samples / 60s |
| Transcribe concurrency | Unbounded | Semaphore default 1 |
| Transcribe rate | None | 10/min client, 30/min global |
| Unhandled errors | Possible detail leak | Generic HTTP 500 JSON |

## Compatibility

- Model alias `home-ai`, `max_tokens=4096`, `temperature=0.2` unchanged.  
- Theological system prompt and Scripture `sources` assembly preserved.  
- Structured search routes and response shapes preserved.  
- CORS allowlist unchanged (pages.dev + local Vite).

## Residual (not code-fixed here)

- In-memory rate limits (restart clears; multi-worker would split).  
- ASR worker threads not killed on client cancel.  
- Edge Cloudflare rate limits / WAF (manual).  
- Accidental `C:\Users\eskew\.git` still present (rename blocked by sandbox ACL earlier).
