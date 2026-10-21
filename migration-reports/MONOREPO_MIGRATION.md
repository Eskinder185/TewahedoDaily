# Monorepo migration report — AI backend into TewahedoDaily

**Date:** 2026-10-19  
**Action:** Copy maintained `tewahedo-ai` application into `TewahedoDaily/backend/`  
**Git root for combined project:** `C:/Users/eskew/github/TewahedoDaily` only  
**Original backend preserved:** `C:/Users/eskew/github/tewahedo-ai` (not moved, not deleted, `.git` not copied)  
**Push / deploy / VM401:** not performed

## Summary

The FastAPI Search Buddy / CMS / RAG backend now lives at `backend/` inside the
existing TewahedoDaily Git repository. The unapproved five-book `content-review`
package stays in the original `tewahedo-ai` tree for private evaluation.
Cloudflare/GitHub Pages continue to publish **only** `dist/` from the frontend
build.

## Copied into `backend/` (104 files)

Top-level items:

| Item | Notes |
| --- | --- |
| `app/` | `main.py`, `security.py`, `chat_intelligence.py`, `editorial/`, `book_rag_research/`, `rag_eval/` |
| `tests/` | Full pytest suite + `conftest.py` |
| `scripts/` | RAG research / eval helpers |
| `docs/` | security, search-buddy, editorial-books, books, book-rag-research |
| `data/.gitkeep` | Placeholder only |
| `requirements-dev.txt` | Local test deps |
| `requirements-rag-eval.txt` | Optional private eval deps |
| `pytest.ini` | Unchanged testpaths relative to `backend/` |
| `Dockerfile.optimized` | Build context = `backend/`; now `COPY app/` |
| `docker-compose.yml` | Paths relative to `backend/`; bind `127.0.0.1:8000` |
| `.env.example` | Placeholders only |
| `.gitignore` | Backend-local ignores |
| `matching_tests.py`, `test_ethio_asr.py` | Root helper scripts from source repo |
| `README.md` | Monorepo backend instructions (new) |

Security, CMS JWT fail-closed auth, Search Buddy, editorial gates, and grounded
RAG improvements were copied intact.

## Explicitly excluded

| Exclusion | Reason |
| --- | --- |
| `.git/` | Combined project must use only TewahedoDaily Git |
| `.env` / `.env.*` (except `.env.example`) | Secrets |
| `content-review/` (~71 files) | Unapproved five-book package — private eval only |
| `content-review.zip` | Same |
| `__pycache__/`, `*.pyc`, `.pytest_cache/` | Temp / bytecode |
| `data/rag_eval_reports/` | Generated eval artifacts |
| `*.npy`, model weight caches, `.rag-eval*` | Heavy / regenerable |
| `*.sqlite3`, `*.db`, approval overlays | Runtime private state |

Original package remains at:

- `C:\Users\eskew\github\tewahedo-ai\content-review`
- `C:\Users\eskew\github\tewahedo-ai\content-review.zip`

## Modified configurations

| File | Change |
| --- | --- |
| `backend/app/editorial/paths.py` | Backend package root; discovers sibling `../tewahedo-ai/content-review` when local package absent; env overrides still win |
| `backend/.env.example` | Documents private package paths / sibling discovery |
| `backend/docker-compose.yml` | Explicit `build.context: .` under `backend/` |
| `backend/Dockerfile.optimized` | Comment + `COPY app/ /app/` for image builds from `backend/` |
| `backend/tests/test_book_integration.py` | Skip cleanly if package catalog missing |
| `backend/docs/editorial-books/PACKAGE_PLACEMENT.md` | Monorepo placement policy |
| `package.json` | `dev:backend`, `test:backend`, `lint:backend` |
| `.gitignore` | Backend secrets, caches, private package patterns |
| `.cfignore` | **New** — ignore `backend/`, private data for Pages uploads |
| `public/_routes.json` | Exclude `/backend/*`, `/server/*` |
| `.github/workflows/deploy.yml` | Guard step refuses `dist/backend` or `main.py` leaks |
| `README.md` | Monorepo layout + backend commands |

## Pages / Cloudflare boundary

- Vite build output: `dist/` only (`npm run build` exit 0).
- Deploy workflow uploads **only** `./dist`.
- Post-build guard fails if backend or `content-review` appears under `dist/`.
- `.cfignore` blocks `backend/` for accidental whole-tree Pages deploys.
- `dist` scan after build: **0** backend / `main.py` leaks.

## Git verification

| Check | Result |
| --- | --- |
| `git rev-parse --show-toplevel` (TewahedoDaily) | `C:/Users/eskew/github/TewahedoDaily` |
| `backend/.git` present? | **No** |
| Original `tewahedo-ai` still intact? | **Yes** |
| Commit / push performed? | **No** (scan only; commit left for operator) |

## Secret scan (pre-commit)

Scanned `backend/` source/docs/config plus monorepo config touches.

| Finding | Severity | Notes |
| --- | --- | --- |
| `backend/tests/test_cms_auth.py` `SECRET = "test-supabase-jwt-secret"` | Info | Fixture string for unit tests — not a live secret |
| Real `.env` under `backend/` | None found | |
| Private keys / `sk-` tokens / live JWT secrets in copied tree | None found | |
| Forbidden `content-review` under `backend/` | Absent | |

**Do not commit** root `.env`, `.env.local`, or any real `SUPABASE_JWT_SECRET` values.

## Test results

### Backend (`cd backend && python -m pytest`)

- **154 passed, 6 skipped** in ~19.5s  
- Also verified via `npm run test:backend` (exit 0)  
- Skips are optional Qdrant/corpus integration cases without `RAG_EVAL_ARTIFACTS`  
- Package-backed tests used sibling discovery → original `tewahedo-ai/content-review` (not copied)

### Frontend build

- `npm run build` — **exit 0** (Vite + PWA)

### Frontend scripts exercised (24)

| Result | Count | Scripts |
| --- | --- | --- |
| Passed | 18 | editorial-books-access, bible-catalog-presentation, hymn-browse, search-site, search-buddy-routing, calendar-intent-routing, search-buddy-theology-routing, theology-prompt, ai-answer-format, theology-answer-quality, recent-viewed, content-relations, voice-whisper, prayer-learning-theme, locale-unify, synaxarium-presentation, calendar-cards, post-update-audit |
| Failed | 6 | See below |

Failed frontend scripts (pre-existing / env — not monorepo-path regressions):

| Script | Observed cause |
| --- | --- |
| `test:public` | `ENOENT` missing `src/data/chants/amharic-chants.json` |
| `test:cms:auth` | Playwright timeout waiting for sign-in failure alert |
| `test:ai-client` | Assertion on `AI_TIMEOUTS_MS.chat` range |
| `test:voice-search` | Expected coaching string not found in source |
| `test:mobile-calendar-language` | `page.goto` failed — preview not on `127.0.0.1:4173` |
| `test:platform` | Playwright route assertion failure |

These do not indicate backend files leaking into the frontend bundle.

## Outstanding issues

1. **No Git commit yet** — run a final human review of `git status`, then commit only intended paths (never `.env` / `content-review`).
2. **Original `tewahedo-ai` checkout** remains the private eval home for the five-book package; operators should set `CONTENT_REVIEW_ROOT` explicitly in production-like envs rather than relying on sibling discovery.
3. **`server/tewahedo_ai/`** still exists in TewahedoDaily as an older partial patch tree — unrelated to this copy; consider a later cleanup PR (not deleted in this migration).
4. **Six frontend smoke scripts failed** in this environment (timeouts / preview). Re-run with required services or mark them CI-optional.
5. **Docker image build** was path-adjusted but not executed here (no deploy / VM401).
6. **Live Gemma / research Qdrant** not required for this migration; private RAG artifacts stay outside the monorepo.
7. Docs under `backend/docs/**` still mention historical `tewahedo-ai` paths in narrative reports — accurate as provenance; runtime paths use `backend/`.

## Operator checklist (local only)

```bash
cd C:\Users\eskew\github\TewahedoDaily
npm run test:backend
npm run build
# optional private eval:
# set CONTENT_REVIEW_ROOT=C:\Users\eskew\github\tewahedo-ai\content-review
npm run dev:backend
```

Do **not** push, deploy Pages, restart containers, or modify VM401 until explicitly authorized.
