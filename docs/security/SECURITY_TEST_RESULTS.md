# Security Test Results

**Session:** 2026-10-17  
**Scope runnable without FastAPI source:** discovery probes + confirmation of missing backend artifacts.

## Commands executed (actual)

### 1. Local backend markers

```text
app/main.py -> False
Dockerfile -> False
docker-compose.yml -> False
docker-compose.yaml -> False
requirements.txt -> False
pyproject.toml -> False
Pipfile -> False
```

### 2. Production health (read-only)

```bash
curl.exe -sS -w "HTTP %{http_code}" --max-time 15 "https://ai.eskinder.dev/health"
```

**Result:**

```json
{"service":"tewahedo-ai","status":"healthy"}
HTTP 200
```

### 3. FastAPI unit / integration suite

| Suite | Result |
|-------|--------|
| pytest request-body 32 KB | **Not run** — no FastAPI source |
| pytest rate limiting | **Not run** — no FastAPI source |
| pytest AI concurrency / mocked LiteLLM | **Not run** — no FastAPI source |
| pytest `/api/transcribe` duration / MIME | **Not run** — no FastAPI source |
| Live dual-request AI saturation | **Not run** — blocked; would stress shared GPU |
| Live 413 / 429 against production | **Not run** — avoid unapproved load on shared model |

### 4. Frontend regression (this session)

Not re-executed as part of the security engagement after the sync gate tripped. Prior conversation had passing Search Buddy / theology helper tests; those do **not** validate FastAPI security middleware.

## Failures

None for executed probes. **Engagement blocked** before backend test authoring.

## Skipped (require synced `/opt/tewahedo-ai` + mocks)

- All items in engagement §10 (request safety, rate limiting, AI generation, STT, regression schemas).
- Dependency vulnerability scan of FastAPI image packages.
- Docker Compose/security review of mounted secrets.

## Tests that require production verification (after sync + authorized deploy)

1. Localhost-only `:8000` still refuses LAN.  
2. Chat body > 32 KB → HTTP 413.  
3. Chat 21st request/min/client → HTTP 429.  
4. Third concurrent AI call → HTTP 503 + `Retry-After`.  
5. Transcribe > 60 s decoded audio → reject.  
6. Search Buddy Bible / Hymns / Calendar / Amharic voice still succeed.  
7. Theological AI answer still returns structured `sources` without leaking secrets.
