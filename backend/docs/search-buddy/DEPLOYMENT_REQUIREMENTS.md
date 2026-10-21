# Search Buddy — Deployment Requirements

**Status:** Local fixes only. Do **not** treat this document as authorization to overwrite VM401 without an operator-led snapshot and sync plan.

## Safe deploy (recommended)

1. **Snapshot VM401** (Proxmox) and/or back up the running `tewahedo-ai` container filesystem / image tag.
2. Diff production against this repo; sync **only**:
   - `app/chat_intelligence.py` (new)
   - `app/main.py` (intelligence wiring + prompt)
   - `tests/test_chat_intelligence.py` (optional on server)
   - `docs/search-buddy/*` (optional)
3. Do **not** overwrite:
   - Secrets under `/run/secrets/tewahedo-ai`
   - Compose bind (`127.0.0.1:8000:8000`)
   - Security middleware / rate-limit settings unless intentionally promoting those commits
4. Restart **only** the FastAPI app container after backup — not the whole VM, not Ollama exposure changes.
5. Smoke-test through Cloudflare Access:
   - English when-baptism question
   - English why-Jordan question
   - One Amharic greeting / identity
   - One Five Mysteries question
   - Confirm `sources` still render on the TewahedoDaily frontend
6. Confirm security controls still active: body limit, rate limit, AI semaphore, debug routes off.

## Rollback

1. Restore previous container image or copy prior `main.py` (and remove `chat_intelligence.py` if rolling fully back).
2. Restart the app container.
3. Re-run the same smoke questions; confirm bilingual/security behavior matches the last known-good production snapshot.

## Compatibility

- **API contract:** Still returns AI answers with optional `sources` Scripture arrays. Frontend that already consumes FastAPI sources needs no change for language routing.
- **Model:** Remains `home-ai` via `https://gateway.eskinder.dev`. No model swap in this change set.
- **Frontend (TewahedoDaily):** No required change for language selection (server-driven). Optional UX: show “answer language” or a bilingual toggle that appends an explicit bilingual request phrase.

## Out of scope / forbidden without approval

- Pushing to GitHub from the agent session (operator decides)
- Exposing Ollama publicly
- Removing Cloudflare Access
- Changing embedding/Qdrant ingest of theological materials
- Editing the biblical text database
- Restarting VM401 wholesale “to pick up changes”

## Post-deploy validation checklist

- [ ] `pytest` green in the deployed tree (or CI equivalent)
- [ ] Live Amharic sample logged (quality judgment — human)
- [ ] English-only questions do not return Amharic blocks
- [ ] Baptism when-question opens with uncertainty / no invented clock time
- [ ] Rate limit / oversized body still rejected
