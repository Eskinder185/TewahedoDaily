# Security Fixes

**Status:** **None applied to the FastAPI backend in this session.**

## Why

The Cursor workspace (`TewahedoDaily` frontend repository) does not contain the FastAPI application that runs as `tewahedo-api` on VM401. Inventing `app/main.py`, Dockerfiles, or middleware here would violate the engagement rule against speculative recreation and would risk overwriting newer production code later.

## Files modified for backend security

| File | Change |
|------|--------|
| *(none — FastAPI)* | — |

## Documentation added (process / discovery only)

| File | Purpose |
|------|---------|
| `docs/security/SECURITY_AUDIT_REPORT.md` | Discovery + findings + blocker |
| `docs/security/SECURITY_FIXES.md` | This file |
| `docs/security/SECURITY_TEST_RESULTS.md` | Actual commands/results |
| `docs/security/MANUAL_INFRASTRUCTURE_ACTIONS.md` | Operator actions |
| `docs/security/DEPLOYMENT_AND_ROLLBACK.md` | Sync + future deploy plan |

## Unrelated local working-tree changes (not security fixes)

The Git working tree already contains uncommitted frontend/theology Search Buddy work (e.g. `AiAnswerBody`, `formatAiAnswer`, theology prompt patch helpers under `server/tewahedo_ai/`). Those are **not** FastAPI security hardening and were not treated as part of this security engagement’s repair phase.

## Before / after (backend security behavior)

| Control | Before (this session) | After (this session) |
|---------|----------------------|----------------------|
| Body limit / rate limit / AI semaphore / ASR duration | Unknown locally; operator reports present or pending on VM401 | **Unchanged** — not modified |
| Localhost Docker bind | Operator reports `127.0.0.1:8000:8000` | **Unchanged** — not undone |

## Compatibility notes

No API contracts were changed. Frontend Search Buddy / Bible / Hymns / Calendar / voice clients remain as in the current tree.
