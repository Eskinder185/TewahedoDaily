# Tewahedo Daily

A React and TypeScript companion for Ethiopian Orthodox prayer, chant practice,
and the Church calendar.

This repository is a monorepo:

| Path | Role |
| --- | --- |
| `src/`, `public/`, `functions/` | Frontend + Cloudflare Pages Functions |
| `backend/` | FastAPI Search Buddy / CMS / RAG service (maintained AI backend) |

## Development update — November 3, 2026

### Implemented locally and verified

- **Mezmur classification and publishing:** strengthened canonical taxonomy,
  classification/error handling, editor and bulk-review flows, source-backed
  publishing guards, and the distinction between published Mezmur lyrics and
  lyric-derived Finish the Mezmur content. Unsupported quiz publication remains
  blocked rather than implying a database capability that has not been verified.
- **Mezmur and Bible search:** added lyric-aware Mezmur results with matched
  excerpts and highlighting, bounded fallback search, restricted-lyric
  protection, Unicode/Ethiopic normalization, and URL-backed search state.
  Bible search now supports sentence queries, structured references, ranked
  word matching, edition-aware results, and source-text excerpts.
- **Calendar, Synaxarium, and Mezmur:** connected calendar and event navigation
  with source-backed Synaxarium and Mezmur relationships, preserved media
  fallbacks, and kept publication and private-media gates in place.
- **Navigation and browser history:** added URL state and Back/Forward
  restoration for Mezmur, Calendar, Bible, prayer, Church Library, Play, and
  relevant CMS filters, with keyed scroll restoration and direct-link support.
- **Game Night and Faith Challenges:** organized the twelve games into five
  shared modes, added the Game Night shared-screen guide and Custom/Join
  boundaries, exposed static content and Bible campaign drafts in the existing
  Studio, and added a tested anti-repetition foundation. These are not mixed
  multiplayer, cross-game runtime deduplication, or universal server-backed
  publishing.
- **Security safeguards:** removed browser-authorized solo completion syncing,
  added local Game Night reward-receipt handling and reviewed reward SQL
  proposals, tightened localized answer projection and CMS auth recovery
  checks, and prepared a plan-only staging harness. Staging execution is
  blocked pending an approved disposable environment and effective permission
  checks.

### Testing, status, and limitations

Focused browser, unit, authorization-structure, TypeScript, targeted ESLint,
backend, and production-build checks passed as recorded in the dated AI
reports. One Mezmur API-search check and one shared Bible-search check remain
environmental/live-service failures; a legacy search regression also remains
unresolved. An intermittent mobile history-scroll timeout was reproduced once
and passed on rerun. Full-repository lint is still not clean.

This update describes current local work, including uncommitted changes in the
working tree; it does not represent a commit, push, merge, staging execution,
production deployment, hosted Supabase/RLS verification, or live backend
rollout. Remaining limitations include native Amharic review, deployed
permission/concurrency checks, private Game Night question provisioning,
unsupported local-only game adapters, and the reported GitHub Actions
deployment failure.

## Development update — November 2, 2026

### Completed and locally verified

- **Mezmur and CMS:** improved Mezmur administration, bulk review/classification,
  language and taxonomy handling, public visibility checks, and editor
  reliability; related CMS and responsive UI audits were recorded.
- **Bible, Calendar, and Synaxarium:** completed local source/data audits,
  calendar-card and media relationship review, and Bible/Synaxarium content
  checks while preserving source-backed fallbacks.
- **Play and UI:** retained the Bible Timeline challenge and its responsive,
  bilingual interaction improvements; local Play, mobile, night-mode, and
  performance checks were recorded.

### Work in progress and local-only changes

Further Mezmur, Bible, Calendar, Synaxarium, Play, CMS, and UI integration work
remains uncommitted. Proposed migrations, imports, structured Library content,
and security/staging verification are local review artifacts only; no hosted
database or production change is implied.

### Known issues

Full-repository lint is not clean, and a reported GitHub Actions deployment
failure remains undiagnosed. Local checks do not establish that uncommitted
changes were committed, pushed, or deployed.

Pages/static hosting must build **only** the frontend (`npm run build` → `dist/`).
Never publish `backend/`, secrets, or the private five-book `content-review`
package. See [backend/README.md](backend/README.md) and
[migration-reports/MONOREPO_MIGRATION.md](migration-reports/MONOREPO_MIGRATION.md).

## Local development

Requirements: Node.js 22 or newer.

```bash
npm install
npm run dev
```

Backend (optional, separate process):

```bash
npm run test:backend
npm run dev:backend
```

The app works with its bundled JSON data by default. No cloud account is needed
for local development.

## Public CMS content and migration

With Supabase configured, `/practice` and Mezmur detail pages use published CMS
content with pagination, multilingual search, discovery filters, persistent audio,
and signed-in favorites. `/search` searches published Mezmur, saints, prayers,
feasts, and articles. The footer provides role-aware Admin access.

Follow [PUBLIC_CONTENT_MIGRATION.md](PUBLIC_CONTENT_MIGRATION.md) before switching
an existing deployment. Run `npm run supabase:plan-mezmur` to generate a safe
dry-run report. The new importer leaves source JSON and existing editorial records
untouched. Supabase mode never falls back to JSON on errors or empty results.
Use `VITE_PUBLIC_MEZMUR_SOURCE=legacy` temporarily while preparing the database.

## Legacy Supabase chant catalog

The older chant catalog remains available for Werb and explicit legacy mode.
That older loader can fall back to bundled JSON. It is separate from the new CMS
Mezmur importer and should not be used to publish new CMS Mezmur.

1. Create a Supabase project.
2. Apply
   [`supabase/migrations/20260902000000_create_chant_library.sql`](supabase/migrations/20260902000000_create_chant_library.sql)
   with the Supabase CLI or SQL editor.
3. Copy `.env.example` to `.env.local`.
4. Add the project URL and browser-safe publishable key:

   ```dotenv
   VITE_SUPABASE_URL=https://tgvhpibzzkqxkcumrivh.supabase.co
   VITE_SUPABASE_PUBLISHABLE_KEY=your_browser_safe_publishable_or_anon_key
   ```

5. For the one-time/local import only, also add the non-Vite variables below.
   Never expose the secret key through a `VITE_` variable or frontend hosting
   configuration.

   ```dotenv
   SUPABASE_URL=https://your-project.supabase.co
   SUPABASE_SECRET_KEY=sb_secret_replace_me
   ```

6. Validate and import the chant files:

   ```bash
   npm run supabase:check-data
   npm run supabase:import-chants
   ```

The importer merges the original chant files with the corresponding files in
`src/data/chants/classified/`. Classified rows win, while richer practice fields
from the originals are retained. Imports are idempotent upserts; category links
for imported chants are refreshed on each run.

The browser receives only the publishable key. The migration grants public
read-only access to active categories and published chants and enforces it with
Row Level Security. All writes require a trusted server or CLI environment.

## Editorial content platform

The React/Vite site shares Supabase Auth, typed data services, and Postgres RLS
with its admin CMS. Saints, feasts, prayers, and articles now use the shared
editor at `/admin/{type}`, `/admin/{type}/new`, and `/admin/{type}/:id/edit`.
Public libraries are `/saints`, `/feasts`, `/prayer-library`, and `/teachings`;
published details use `/content/:kind/:slug`. Existing prayer collections and
calendar pages remain available.

Admins manage private uploads at `/admin/media` and dated homepage selections
at `/admin/daily`. The homepage combines daily selections, latest published
teachings, library links, and community contributions. Daily scheduling uses
Gregorian dates in Addis Ababa time and can later accept an automated provider.

Apply all SQL migrations in filename order, including
`20260928000500_content_platform.sql`, before deploying this version. No hosted
database migration or deployment is performed by the code changes alone.

See [ADMIN_CMS_SETUP.md](ADMIN_CMS_SETUP.md) for roles, publishing, media,
daily content, environment variables, and Cloudflare deployment;
[COMMUNITY_SUBMISSIONS_SETUP.md](COMMUNITY_SUBMISSIONS_SETUP.md) for reviewed
submissions and Turnstile; and [PUBLIC_CONTENT_MIGRATION.md](PUBLIC_CONTENT_MIGRATION.md)
for the safe, logged Mezmur import. Local JSON content is retained.

```bash
npm run test:platform         # mocked browser workflows for the broader CMS
npm run test:cms:auth
npm run test:cms:admin
npm run test:community
npm run test:public
```

## Build and import commands

```bash
npm run build                 # type-check and create a production build
npm run lint                  # run ESLint
npm run supabase:check-data   # validate/count local import data (no network)
npm run supabase:import-chants
```

## Main data flow

- `src/lib/supabase/client.ts` creates the optional typed browser client.
- `src/lib/practice/chantRepository.ts` loads paginated Supabase rows and maps
  them to the existing practice UI model.
- `src/hooks/useChantLibrary.ts` exposes the async catalog to list and detail
  pages.
- `src/data/chants/` remains the offline and development fallback.
