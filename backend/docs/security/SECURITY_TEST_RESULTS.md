# Security Test Results

**Date:** 2026-10-17  
**Host:** Local Windows workspace `C:\Users\eskew\github\tewahedo-ai`  
**Command:**

```bash
python -m pip install -r requirements-dev.txt
python -m pytest tests -q --tb=short
```

## Result

```text
31 passed in 0.43s
```

(Re-run after body-drain + exception-handler tweaks; same count.)

## Coverage exercised

| Area | Tests | Status |
|------|-------|--------|
| Rate limiter per-client / global / max tracked / expiry | `test_security_unit.py` | Pass |
| CF-Connecting-IP trust / ignore XFF / invalid IP / missing peer | `test_security_unit.py` | Pass |
| Body limit + cache / oversized stream | `test_security_unit.py` | Pass |
| Health | `test_api_security.py` | Pass |
| Debug routes off (404) / on (no key leakage) | `test_api_security.py` | Pass |
| Chat 413 oversized body | `test_api_security.py` | Pass |
| Invalid JSON 422 does not consume chat quota | `test_api_security.py` | Pass |
| Chat per-client 429 + Retry-After | `test_api_security.py` | Pass |
| Chat success shape (`type=ai`, answer, sources) | `test_api_security.py` | Pass |
| Upstream malformed JSON / empty choices → 503 | `test_api_security.py` | Pass |
| AI semaphore saturation → 503 + Retry-After | `test_api_security.py` | Pass |
| CORS preflight | `test_api_security.py` | Pass |
| Transcribe MIME / empty / oversized / rate limit / 60s / tempfile cleanup | `test_api_security.py` | Pass |
| Decode sample-cap helper | `test_decode_duration.py` | Pass |

## Skipped / not run (missing infra)

| Test | Reason |
|------|--------|
| Live LiteLLM / Gemma inference | No gateway credentials / shared GPU in this session |
| Live dual-request AI saturation on production | Requires authorized load against VM401 |
| Live Supabase Bible/Hymns/Calendar regression | No `SUPABASE_*` secrets in local env (mocked in unit/API tests) |
| Real Ethio-ASR model load + PyAV decode of long audio | Heavyweight; duration path unit-tested with fakes |
| Docker image build / compose up | Not authorized; localhost bind reviewed as config only |
| Cloudflare WAF / tunnel dashboard checks | Manual |

## Notes

- Upstream LiteLLM and Supabase are **mocked** in API tests.  
- No production container was restarted.  
- No GitHub push performed.
