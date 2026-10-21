# TewahedoDaily AI Backend — Security Audit Report

**Date:** 2026-10-17  
**Workspace audited:** `C:\Users\eskew\github\TewahedoDaily` (frontend repo `Eskinder185/TewahedoDaily`)  
**Git HEAD:** `5923eb2` (`main` tracking `origin/main`)  
**Audit status:** **BLOCKED — authoritative FastAPI source not present locally**

---

## Executive summary

A complete FastAPI security audit, code repair, and pytest suite **cannot be executed in this Cursor workspace** because the production backend (`/opt/tewahedo-ai` on Ubuntu VM401) is **not** checked into this repository and was **not** found in any sibling local path.

Per the engagement rules:

> If backend changes are present only on VM401, STOP the write/deployment portion of the workflow until the updated backend can be synchronized safely.  
> If the local repository does not contain the FastAPI backend, do not recreate it from these descriptions.

**No production Docker, Cloudflare, DNS, secret, or VM401 files were modified.**

---

## Discovery findings

| Check | Result |
|--------|--------|
| `app/main.py` | **Absent** |
| `Dockerfile` / `docker-compose*.yml` | **Absent** |
| `requirements.txt` / `pyproject.toml` | **Absent** |
| Local path `/opt/tewahedo-ai` or `~/tewahedo-ai` | **Absent** |
| Sibling GitHub clone of FastAPI service | **Not found** under `C:\Users\eskew\github` |
| SSH host for VM401 in `~/.ssh/config` | **Not configured** (only `kali` → `10.0.0.171`) |
| What *is* under `server/` | Patch helpers only: Amharic routing + theology prompt modules (`server/tewahedo_ai/`) — **not** the FastAPI app |
| Cloudflare Pages Functions in this repo | `functions/api/submissions.ts` (community form) — separate from AI FastAPI |
| Live public health | `GET https://ai.eskinder.dev/health` → **HTTP 200** `{"service":"tewahedo-ai","status":"healthy"}` |

### Authoritative deployment source (as stated; not verified from local tree)

| Item | Stated location |
|------|------------------|
| Host | Ubuntu VM401 (Proxmox) |
| App root | `/opt/tewahedo-ai` |
| Entry | `/opt/tewahedo-ai/app/main.py` |
| Container | `tewahedo-api` / Compose service `api` / image `tewahedo-api:cpu-v1` |
| Bind | `127.0.0.1:8000:8000` (must not be undone) |
| Public | Cloudflare Tunnel → `https://ai.eskinder.dev` |

**Discrepancy:** This frontend repository documents AI URL via `VITE_TEWAHEDO_AI_API_URL` and consumes the API, but does **not** contain the deployed FastAPI source that implements those endpoints. Security work already completed on VM401 (body limit, rate limit, concurrency, localhost bind) is therefore **not inspectable or diffable** from this workspace.

---

## Endpoint map (consumer-side evidence only)

Inferred from the **frontend** client (`src/lib/search/**`, `src/lib/ai/**`), not from FastAPI route tables:

| Endpoint | Used by frontend | Auth from browser |
|----------|------------------|-------------------|
| `GET /health` | Health / readiness | None |
| `POST /api/chat` | Search Buddy, Bible resolve | Optional Bearer (Supabase session) via `withAuth` |
| `POST /api/transcribe` | Amharic voice | Optional Bearer |
| `GET /api/bible/search` | Structured Bible keyword search | Via AI client |
| `GET /api/hymns/search` | Mezmur search | Via AI client |
| `GET /api/prayers/search` | Prayer search | Via AI client |
| `GET /api/synaxarium/search` | Synaxarium | Via AI client |
| Calendar / prayers collection routes | Structured Search Buddy | Via AI client |
| `/debug/supabase`, `/api/bible/test` | **Not referenced** in frontend source | Unknown — must audit on VM401 |

**Cannot confirm** CORS, OpenAPI `/docs` exposure, debug-route presence, or error-body leakage without the FastAPI source or authorized remote inspection of `/opt/tewahedo-ai`.

---

## Findings classification

### Confirmed (this workspace)

| ID | Severity | Finding | Evidence | Fix status |
|----|----------|---------|----------|------------|
| SYNC-001 | **Critical (process)** | Authoritative backend source not available for audit/repair | No `main.py`/Docker/deps; VM401 not reachable via configured SSH | **Blocked** — sync required |
| SYNC-002 | High (process) | VM401 security fixes cannot be reviewed or regression-tested locally | Rate limit / 413 / semaphore code not in repo | **Blocked** |
| SYNC-003 | Medium (process) | Risk of overwriting newer VM401 code with older/incomplete local tree if someone invents a FastAPI app here | Explicit engagement rule | **Mitigated by STOP** |

### Reported by operator (VM401) — not independently code-reviewed here

| ID | Severity | Topic | Local verification |
|----|----------|-------|--------------------|
| NET-001 | High (fixed on VM) | Port bind `127.0.0.1:8000:8000` | Not verified from this host (no LAN/SSH to VM401) |
| CHAT-001 | High (fixed on VM) | 32 KB body limit + 413 | Code not present |
| CHAT-002 | High (fixed on VM) | Chat rate limits 20/min client, 60/min global | Code not present |
| CHAT-003 | Medium (fixed on VM) | `MAX_CONCURRENT_AI_REQUESTS = 2` | Code not present; live dual-saturation unverified |
| IP-001 | Medium | `CF-Connecting-IP` trust boundary | Forged-header Cloudflare 1000 noted by operator; incomplete proof |
| ASR-001 | High | Transcribe duration 60s patch | **Stated not yet tested/deployed** — presence unknown locally |

### Potential risks (cannot confirm without source)

| ID | Severity | Risk |
|----|----------|------|
| DBG-001 | High | `/debug/supabase` or `/api/bible/test` may leak internals if still public |
| ASR-002 | High | Concurrent ASR / unbounded decode / temp-file lifecycle |
| CHAT-004 | Medium | In-memory rate limits reset on restart; not shared across workers/apps |
| CHAT-005 | Medium | 422 validation may consume rate quota |
| CHAT-006 | Medium | Private `request._body` coupling |
| CORS-001 | Medium | Overly broad CORS if present |
| DOCS-001 | Low–Medium | OpenAPI `/docs` exposure on public hostname |
| SECRETS-001 | Critical if true | Privileged Supabase or LiteLLM secrets in logs/responses |

---

## Root cause of audit blockage

The AI FastAPI service is developed/deployed as a **separate tree on VM401**. This monorepo is the **frontend + Cloudflare Pages Functions + Supabase assets**, plus small **optional patch modules** meant to be copied into the FastAPI package (`PATCH_CHAT.md`, `PATCH_THEOLOGY.md`). Those modules do not implement request limiting, ASR, Docker, or route security.

---

## Remaining risks after this session

1. Production FastAPI security posture cannot be independently confirmed from Git.  
2. Further hardening (ASR duration, IP trust, Redis rate limits, debug-route removal) cannot be implemented safely without a synced source of truth.  
3. Uncommitted frontend theology/UI work exists in the working tree and must not be confused with backend security changes.

---

## Required sync before Phase C (Repair)

1. Export or clone `/opt/tewahedo-ai` from VM401 into a dedicated local repo (or add it as a Cursor workspace root) **without** overwriting VM401.  
2. Record deployed image tag, Compose SHA/file hash, and `main.py` checksum.  
3. Re-open this audit against that tree.  
4. Only then implement pytest + code fixes and prepare a reviewed deploy plan.
