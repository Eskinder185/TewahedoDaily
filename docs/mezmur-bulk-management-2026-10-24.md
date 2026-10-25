# Mezmur Bulk Management repair — 2026-10-24

## Root cause

### `[object Object]` production repair

A read-only request against the configured production Supabase project reproduced the page-load
failure precisely: `GET public.categories?select=slug,status` returned PostgreSQL **42703** with
`column categories.status does not exist`. The target schema supports `categories.slug`, but not
the later optional status field. The query now selects only `slug`; the corrected request returned
HTTP 200 in the same read-only probe. No schema migration is required for inventory loading.

The visible `[object Object]` text was a second defect: `MezmurBulkManagement.tsx` called
`String(cause)` on Supabase's structured PostgREST error object. The shared CMS formatter now
supports Error, PostgREST/Auth/Storage-shaped errors, fetch failures, primitives, null, and unknown
objects; it includes safe codes and named operations, redacts common credential forms, and never
renders arbitrary object coercions. Each paginated query now reports its exact table and row range.

The administrator-facing blocker was architectural: the Bulk Management page used the
optional FastAPI dashboard/jobs endpoints as its inventory source. Because those routes are
not present on the deployed `ai.eskinder.dev` OpenAPI document, a 404 prevented the page from
showing records that already exist in Supabase. The canonical records are in
`public.mezmur_data_import`; AI is not required to read, classify manually, or publish them.

The repaired page now obtains an exact canonical snapshot from authenticated Supabase reads.
Every table is read in 500-row ranges until the final partial page, so the implementation does
not stop at 100 or 1,000 rows. Counts and filters are derived from that complete, RLS-filtered
snapshot. The UI never uses a singer label or slug as a mutation identifier: publication and
manual category assignment use `mezmur_data_import.import_id` UUIDs.

The checked-in production entry point is `backend/app/main.py`; `backend/Dockerfile.optimized`
starts it with `uvicorn main:app` from `/app`. The exact imported application exposes 42
OpenAPI paths locally, including all Mezmur Bulk and Church Library routes.

The earlier `len(main.app.routes) == 24` observation was misleading. FastAPI 0.143.2 stores
included routers as lazy `_IncludedRouter` entries; inspecting only the top-level objects'
`.path` values omits the routes that OpenAPI and request dispatch expand correctly. A
`TestClient(main.app).get('/openapi.json')` assertion now guards the real application object.

The production OpenAPI at `https://ai.eskinder.dev/openapi.json` still advertises none of the
eight Mezmur Bulk routes and neither Church Library route. DNS is Cloudflare-fronted, so the
remote host directory, origin, container identity, and bind mount cannot be determined from
the public endpoint. The evidence shows that the origin is running a different/outdated app
or bind-mounted source tree; it is not a frontend base-URL or local FastAPI registration bug.

## Local implementation

- `backend/app/main.py` mounts the editorial, Church Library, and Mezmur Bulk routers on the
  single exported `app` object.
- `backend/app/editorial/mezmur_bulk.py` provides complete pagination, persisted progress,
  exact/unique Zemari matching, conservative Latin transliteration matching, original-language
  lyric classification through the configured server-side gateway, taxonomy validation,
  per-record failures, resumable upserts, and atomic queued-job claiming.
- `backend/app/editorial/mezmur_bulk_router.py` provides authenticated create/list/detail,
  suggestions, cancel/resume, Admin/Super Admin apply, and Super Admin publish endpoints.
  Apply and publish forward the caller's JWT to protected database RPCs. Conditional state
  transitions prevent resume/cancel races.
- `src/lib/cms/mezmurBulkService.ts` reads the canonical Mezmur inventory, category/occasion
  links, Zemaris, jobs, and suggestions directly from Supabase. Only AI job creation and
  control use FastAPI. A missing AI route displays the required nonblocking notice.
- `src/pages/admin/MezmurBulkManagement.tsx` displays database-backed metrics and job history,
  search and relationship filters, 50-row pagination, current-page/all-matching selection,
  additive manual category assignment, durable progress/failures, review/apply controls, CSV
  export, and explicit publication confirmation. A ref prevents React development effects from
  starting duplicate initial requests.
- `supabase/migrations/20261024230000_mezmur_bulk_management.sql` is the reviewed base schema,
  RLS, apply RPC, and bounded publish RPC. It never modifies publication during analysis and
  adds links only when absent.
- `supabase/migrations/20261024250000_mezmur_bulk_job_idempotency.sql` is the new forward-only
  authenticated job-creation RPC. A transaction advisory lock makes equivalent active-job
  submissions idempotent.
- `supabase/migrations/20261024260000_mezmur_bulk_supabase_operations.sql` adds only
  `bulk_add_mezmur_category(uuid[], text)`. It resolves and locks each active canonical record
  by `import_id`, validates the existing taxonomy, preserves current links, is limited to 100
  UUIDs per call, and requires Admin or Super Admin. Bulk publication continues to use the
  protected `bulk_publish_mezmur_imports(uuid[])` RPC and requires Super Admin.

The ordinary Mezmur list now resolves category links instead of rendering an unmapped
`category_id`, and missing/zero/invalid timestamps render as **Not recorded** rather than the
Unix epoch. Admin lyrics still come from the canonical staff table. Public lyrics remain sourced
from `public.mezmur_public`, whose rights-aware view exposes full text only when publication
authorization is recorded; media/source-only records retain the existing non-republication
message.

The six intentionally removed Mezmur fields are absent. Existing manual Zemari/category/
occasion/section relationships are preserved. Unknown rights are neither inferred nor changed.

## API contract

- `GET /api/mezmur-bulk/dashboard`
- `GET|POST /api/mezmur-bulk/jobs`
- `GET /api/mezmur-bulk/jobs/{job_id}`
- `GET /api/mezmur-bulk/jobs/{job_id}/suggestions`
- `POST /api/mezmur-bulk/jobs/{job_id}/resume`
- `POST /api/mezmur-bulk/jobs/{job_id}/cancel`
- `POST /api/mezmur-bulk/jobs/{job_id}/suggestions/apply`
- `POST /api/mezmur-bulk/publish`

## Production database activation (manual)

Do not use `supabase db push`.

1. Run `supabase/mezmur-import/VERIFY_MEZMUR_BULK_MANAGEMENT_READ_ONLY.sql` in Supabase SQL
   Editor. It reports missing tables/RPCs, RLS state, and anonymous/authenticated execute grants.
2. If the three enrichment tables or the apply/publish RPCs are missing, review and run only
   `supabase/migrations/20261024230000_mezmur_bulk_management.sql`.
3. If `create_mezmur_enrichment_job` is missing, run only
   `supabase/migrations/20261024250000_mezmur_bulk_job_idempotency.sql`.
4. Run only `supabase/migrations/20261024270000_mezmur_bulk_schema_compatibility.sql` if the
   verifier reports `bulk_add_mezmur_category(uuid[],text)` missing, or if 260000 was previously
   installed. The forward-only replacement removes the invalid `categories.status` dependency
   and is safe in either state. It does not modify existing content.
5. Run the verifier again. Expect all tables/functions present, RLS `true`, anonymous execute
   denied, and authenticated execute granted.

The anonymous production probe confirms all three enrichment tables exist and are private.
Because the write RPCs are intentionally hidden from `anon`, their production presence remains
unverified until the SQL verifier is run by an authorized operator.

## Identify and deploy the actual backend (manual approval required)

Run these read-only commands on the origin host first:

```bash
docker inspect tewahedo-api --format '{{ index .Config.Labels "com.docker.compose.project.working_dir" }}'
docker inspect tewahedo-api --format '{{ range .Mounts }}{{ .Source }} -> {{ .Destination }}{{ println }}{{ end }}'
docker exec tewahedo-api python -c "import main; print(main.__file__); print('\n'.join(sorted(main.app.openapi()['paths'])))"
docker inspect tewahedo-api --format '{{.Image}} {{.Config.Image}}'
```

The first result is the real Compose directory. Verify it contains `backend/docker-compose.yml`
equivalent configuration and that the host path mounted to `/app` contains the repaired router.
Before changing anything, record `git rev-parse HEAD`, `git status --short`, the image ID, and a
copy/snapshot of the mounted `app` directory. Then, from that verified Compose directory:

```bash
docker tag tewahedo-api:cpu-v1 tewahedo-api:rollback-20261024
docker compose config
docker compose build api
docker compose up -d --no-deps api
docker compose exec api python -c "import main; print(main.__file__); print(len(main.app.openapi()['paths']))"
curl -fsS http://127.0.0.1:8000/openapi.json | python -m json.tool
```

This affects only the API service. It does not restart unrelated containers or Proxmox.

Post-deployment, run `npm run probe:mezmur-bulk-production`. All API rows must say `PASS`.
An unauthenticated direct request should return 401, not 404. Then sign in as staff and run a
small selected-ID analysis before using a full job or publication.

Rollback requires restoring both layers because `/app` is bind-mounted:

1. Restore the saved host `app` directory/revision.
2. Set the API image to `tewahedo-api:rollback-20261024` (or retag it as `cpu-v1`).
3. Run `docker compose up -d --no-deps api`.
4. Recheck local and public OpenAPI plus a known Search Buddy endpoint.

## Tests actually executed

- Full backend suite: **207 passed, 7 skipped**.
- Focused bulk/Church backend suite after final changes: **29 passed**; focused bulk suite:
  **15 passed**.
- TypeScript production build: **passed** (`vite` transformed 509 modules).
- Focused ESLint for the bulk service/page, Mezmur list/service, and timestamp helper: **passed**.
- Synthetic canonical snapshot test: **passed** with exactly **886 unique records**, paginated
  data assumptions, truthful eligibility counts, relationship counts, and invalid timestamp
  handling. This is a deterministic regression fixture, not a claim that production was read.
- Bulk static regression test: **passed**.
- Bulk desktop/mobile Playwright fixture: **passed** at 375px and 1024px.
- Church Library static/upload and desktop/mobile Playwright regressions: **passed**.
- Search Buddy fallback regression: **passed**.
- Live Search Buddy routing regression: **failed** because the current deployed API returned
  `unknown` instead of `bible_reference` for the Amharic John 2:3 case. This is an unresolved
  production result and was not suppressed.
- Production route/schema probe: all ten expected API paths **missing**; all three enrichment
  tables **present and private**; protected RPC presence requires the SQL verifier.

PostgreSQL 17 is installed and a local server answers on port 5432, but no local database
password is available and Docker Desktop is not running. Therefore the updated SQL integration
runner (`supabase/tests/run_mezmur_bulk_management.sql`) was prepared but not executed in this
session. It now installs all three bulk migrations twice and checks idempotent job creation, RLS/role
rejection, manual-link preservation, partial publish results, and protected publication.

The read-only production aggregate audit (`npm run audit:mezmur-bulk-production`) was also not
executed because this environment has no server-side Supabase read credential. The public anon
key cannot see staff Drafts by design. Therefore the reported live total of 886 remains the CMS
operator's confirmed count; it was not independently inferred or fabricated here.
