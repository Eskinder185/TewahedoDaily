# TewahedoDaily AI backend

Python FastAPI service for Search Buddy, CMS-gated editorial books, security
controls, and private RAG evaluation. This folder is the maintained application
copy of the former standalone `tewahedo-ai` repository.

## Layout

| Path | Purpose |
| --- | --- |
| `app/` | FastAPI app (`main.py`), security, chat intelligence, editorial, RAG |
| `tests/` | Pytest suite |
| `scripts/` | Local RAG / research helpers |
| `docs/` | Security, Search Buddy, editorial, and RAG research notes |
| `data/` | Runtime placeholders only (gitignored approvals / SQLite) |

## Private five-book package

The unapproved `content-review` document package is **not** stored in this
monorepo. Keep it in a private location (for example the original
`tewahedo-ai` checkout) and set:

```bash
CONTENT_REVIEW_ROOT=.../content-review
CONTENT_REVIEW_ZIP=.../content-review.zip
```

Do not mount that package under the Vite `public/` directory or Cloudflare Pages.

## Local development

```bash
cd backend
python -m venv .venv
# Windows: .venv\Scripts\activate
pip install -r requirements-dev.txt
copy .env.example .env   # then fill non-secret local values only
python -m pytest
uvicorn main:app --app-dir app --host 127.0.0.1 --port 8000
```

From the monorepo root:

```bash
npm run test:backend
npm run dev:backend
```

## Docker

```bash
cd backend
docker compose build
docker compose up -d
```

Compose binds `127.0.0.1:8000` only. Secrets are expected at
`/etc/tewahedo-ai` → `/run/secrets/tewahedo-ai:ro` on the host that runs the
container. This monorepo change does not deploy or restart VM401.

## Frontend boundary

Cloudflare/GitHub Pages builds must use the frontend `npm run build` output
(`dist/` only). Backend Python, docs, and private data must never be published
as static assets.
