# Church Library processing API 404 repair

## Confirmed root cause

On 2026-10-24, the deployed `https://ai.eskinder.dev/openapi.json` was healthy
but contained zero `/api/church-library/*` paths. The local FastAPI entry point
registers `church_library_router`, so the live `tewahedo-api` container is
running an older application tree/image. Existing `/api/*` paths work through
the same public hostname, which rules out a generic reverse-proxy prefix error.

## Local route contract

- `GET /api/church-library/status` — authenticated capability and dependency probe
- `POST /api/church-library/books/{book_id}/process` — authenticated extraction/indexing
- `GET /api/church-library/books/{book_id}/status` — authenticated processing state
- `GET /api/church-library/books/{book_id}/results` — authenticated extracted passage preview
- `POST /api/church-library/books/{book_id}/retry` — authenticated safe retry
- `POST /api/church-library/search` — public retrieval, gated inside
  `search_church_library` to eligible books/current versions only

The original files stay in the private `church-library` Storage bucket. The
browser sends its Supabase user JWT to administrative processing routes. The
backend verifies that JWT and the corresponding `profiles.role`, then uses the
server-only service-role key for private Storage and indexing operations.

## Required server environment

```dotenv
SUPABASE_URL=https://PROJECT.supabase.co
SUPABASE_KEY=SERVER_ONLY_SERVICE_ROLE_KEY
SUPABASE_JWT_SECRET=PROJECT_JWT_SECRET
SUPABASE_JWT_AUD=authenticated
CHURCH_LIBRARY_BUCKET=church-library

# Optional; omit for keyword-only retrieval.
CHURCH_LIBRARY_EMBEDDING_MODEL=
CHURCH_LIBRARY_EMBEDDING_MULTILINGUAL_APPROVED=false
```

Never put `SUPABASE_KEY` or `SUPABASE_JWT_SECRET` in a `VITE_*` variable.

## Operator-approved deployment to VM401

Do not deploy until an operator approves and reviews the live diff.

```bash
# On VM401
sudo tar -czf ~/backups/tewahedo-ai-$(date +%Y%m%d%H%M).tgz -C /opt tewahedo-ai
cd /opt/tewahedo-ai

# Copy the reviewed backend/app tree, Dockerfile.optimized, and compose file.
# Preserve /etc/tewahedo-ai and the existing .env/secrets.

docker compose build api
docker compose up -d --no-deps api
docker compose logs --tail=100 api
```

The production image must include FastAPI, Uvicorn, HTTPX,
`python-multipart`, `pypdf`, and—only when semantic embeddings are configured—
the pinned CPU Torch/Transformers dependencies. DOCX and EPUB parsing use the
Python standard library and do not require LibreOffice or Calibre.

## Post-deployment verification

```bash
# VM-local routing
curl -fsS http://127.0.0.1:8000/health
curl -fsS http://127.0.0.1:8000/openapi.json | jq -r '.paths | keys[]' | grep church-library

# Public reverse proxy
curl -fsS https://ai.eskinder.dev/health
curl -fsS https://ai.eskinder.dev/openapi.json | jq -r '.paths | keys[]' | grep church-library

# Auth must fail closed without a staff session.
curl -i https://ai.eskinder.dev/api/church-library/status

# With a real staff access token, expect HTTP 200 and configured=true.
curl -fsS -H "Authorization: Bearer $STAFF_ACCESS_TOKEN" \
  https://ai.eskinder.dev/api/church-library/status | jq
```

Then use a non-public test book to verify upload, Process content, status,
preview, retry, and Search Buddy gating. Do not enable public retrieval until
the ingestion, rights, quotation, access-level, and ready-status gates are all
satisfied.

## Rollback

Restore the backed-up application tree or prior image, then run:

```bash
cd /opt/tewahedo-ai
docker compose up -d --no-deps api
```

No Supabase migration or production data change is part of this route repair.
