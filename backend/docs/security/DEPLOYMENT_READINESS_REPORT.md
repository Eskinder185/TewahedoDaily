# Deployment Readiness Report

**Compared:** `ef900d2` (first local import commit) → `HEAD` (`6d46084`)  
**Date:** 2026-10-17  
**Scope:** Production-impacting code, Docker, dependencies, Scripture/theology/API compatibility  
**Actions taken:** Local review + `pytest` only. **No push, deploy, or VM401 changes.**

---

## 1. Diff summary (`ef900d2..HEAD`)

| Path | Change | Production impact |
|------|--------|-------------------|
| `app/main.py` | +12 lines: generic `@app.exception_handler(Exception)` → HTTP 500 JSON | **Yes** — error responses for unhandled exceptions |
| `app/security.py` | Body reader drains overflow chunks before raising 413 | **Yes** — `/api/chat` oversized body path |
| `tests/conftest.py` | Restore rate-limit caps after tests | **No** (test-only) |
| `requirements-dev.txt` | Pin `pydantic`, `numpy` for local pytest | **No** (dev-only; image uses `Dockerfile.optimized`) |
| `docs/security/*` | Report refresh + home-`.git` note | **No** |
| `docker-compose.yml` | **Unchanged** | Bind remains `127.0.0.1:8000:8000` |
| `Dockerfile.optimized` | **Unchanged** | Production image pins unchanged |

**Stat:** 8 files, +162 / −84. **No** changes to Scripture retrieval, theological prompt text, Supabase query builders, Amharic parsers, or response `type` contracts between these two commits.

---

## 2. Intentionality review (post-import changes)

### Request-body streaming / Starlette

- **Intentional.** Oversized streams now drain remaining chunks without buffering, then raise `BodyTooLarge` → HTTP 413.
- Cache still sets `request._body` and `request._receive` (documented; covered by tests).
- Invalid `Content-Length` still falls through to stream enforcement.
- **Risk residual:** Private Starlette attributes remain; acceptable with tests, but worth watching on Starlette upgrades.

### Rate-limit behavior / proxy trust

- **Unchanged between `ef900d2` and `HEAD`.** Already present at import:
  - Chat limit after `ChatRequest` validation (422 does not consume).
  - Separate chat vs transcribe limiters.
  - `CF-Connecting-IP` only when peer is trusted proxy (localhost / configured CIDR).
  - `X-Forwarded-For` / `X-Real-IP` ignored for identity.
- `conftest.py` only restores caps mutated by tests — not shipped to the container unless tests run there.

### HTTP exception handling

- **New at HEAD:** broad `Exception` handler returns `{"detail":"An unexpected server error occurred."}` with status 500.
- FastAPI still prefers more-specific handlers: verified locally that invalid JSON chat still returns **422**, `/health` **200**, debug **404**.
- **Residual risk:** Any code path that raised a bare `Exception` with a useful client message (if any) becomes a generic 500. Reviewed intent is to stop stack/text leakage; acceptable for production.

### AI semaphore acquire/release

- **Unchanged `ef900d2..HEAD`.** Pattern remains: `acquire_semaphore` → `try` LiteLLM call → `finally: release`.
- Model still `home-ai`, `max_tokens=4096`, `temperature=0.2`.
- JSON `choices` validation and empty-answer handling already in import commit.

### Ethio-ASR duration / concurrency / upload

- **Unchanged `ef900d2..HEAD`.** Import already had:
  - `MAX_TRANSCRIBE_SECONDS = 60` / 960 000 samples, flush attempt, `AudioTooLongError` → 413
  - Semaphore default 1, rate 10/30, 10 MB read cap, MIME/suffix checks, tempfile unlink in `finally`

### Dependencies / imports

- Production **Dockerfile** torch/fastapi/httpx/av/transformers pins **unchanged**.
- Dev-only pins added for reproducible pytest; do **not** require rebuilding the API image solely for those lines.

### Docker bind

- **`127.0.0.1:8000:8000` identical** at `ef900d2` and `HEAD`. Must not be widened on deploy.

---

## 3. Scripture / theology / Supabase / Amharic / contracts

`git diff ef900d2..HEAD -- app/main.py` contains **only** the exception-handler insertion (after CORS setup). No hunks touch:

- Theological system prompt  
- Scripture source assembly / `sources` return shape  
- `supabase_get` or REST query params  
- Bible / hymn / prayer / synaxarium / calendar parsers or route handlers  
- Amharic normalization / speech number helpers  

**Conclusion:** Post-import commits did **not** accidentally alter religious content or structured search contracts.

---

## 4. Pytest results (re-run for this review)

```text
Command: python -m pytest tests -q --tb=short
Result:  31 passed in 0.40s
Exit:    0
```

Additional smoke (same process): chat invalid JSON → **422**; `/health` → **200**; `/debug/supabase` → **404**.

---

## 5. Does `ef900d2` match current production?

**Cannot be confirmed from this workspace alone.**

Evidence that `ef900d2` is **not** a “pre-hardening pristine dump”:

- Import commit already includes `app/security.py`, gated debug routes, ASR 60s/concurrency/rate limits, LiteLLM JSON hardening, full `tests/`, and security docs.
- Operator narrative said VM401 already had body limit, chat rate limits, AI semaphore, and localhost bind; ASR 60s was “not-yet-tested/deployed” at one point — local import **does** include the 60s path.

Therefore:

| Claim | Status |
|-------|--------|
| `ef900d2` ≈ “files copied into this folder when transfer happened” | Plausible |
| `ef900d2` bit-identical to live `/opt/tewahedo-ai` on VM401 **right now** | **Unverified** |
| Fresh production snapshot comparison required before replace? | **Yes — required** |

### Required before replacing production

On VM401 (operator):

```bash
# Checksums of live tree (example)
sudo find /opt/tewahedo-ai/app -type f -name '*.py' -print0 | sort -z | xargs -0 sha256sum
# Compare to local:
# sha256sum app/main.py app/security.py
docker inspect tewahedo-api --format '{{.Image}} {{.Created}}'
```

Or copy a fresh tarball of `/opt/tewahedo-ai` and `diff -ru` against this repo. Resolve any drift (especially if production never received ASR 60s / `security.py` split) **before** `docker compose up`.

---

## 6. Issues that must be resolved before local → production replace

| Priority | Issue | Resolution |
|----------|-------|------------|
| **P0** | No cryptographic/diff proof local tree == live VM401 | Fresh snapshot or checksum compare |
| **P0** | Deploy only with explicit authorization + backup | Follow `DEPLOYMENT_AND_ROLLBACK.md` |
| **P0** | Keep `ENABLE_DEBUG_ROUTES=false` in prod `.env` | Verify env before recreate |
| **P0** | Preserve `127.0.0.1:8000:8000` | Inspect compose on VM after sync |
| **P1** | Live dual AI saturation + real ASR smoke not run here | Authorized post-deploy smoke |
| **P1** | In-memory rate limits / single worker assumptions | Document; optional Cloudflare WAF |
| **P2** | Workstation `C:\Users\eskew\.git` still accidental (if present) | Rename to `.git.bak-accidental` (ops hygiene; not a server blocker) |
| **P2** | Starlette `_body` / `_receive` coupling | Accept with tests; re-verify on framework bump |

**Not blockers for code review of `ef900d2..HEAD`:** theology/scripture/Amharic/API contract regressions (none in that range).

---

## 7. Deployment readiness verdict

| Question | Answer |
|----------|--------|
| Are `ef900d2..HEAD` production code changes intentional and small? | **Yes** |
| Did those commits alter Scripture/theology/Supabase/Amharic contracts? | **No** |
| Do security tests pass locally? | **Yes — 31/31** |
| Is this tree safe to **blindly** overwrite VM401? | **No** — need fresh production comparison |
| Ready for **authorized** staged deploy after snapshot diff? | **Conditionally yes** |

**Overall:** **CONDITIONAL GO** — merge/sync only after VM401 snapshot diff is clean (or intentional deltas are listed), backups exist, and an operator authorizes container recreate. This agent must not perform that deploy.
