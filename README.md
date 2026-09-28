# Tewahedo Daily

A React and TypeScript companion for Ethiopian Orthodox prayer, chant practice,
and the Church calendar.

## Local development

Requirements: Node.js 22 or newer.

```bash
npm install
npm run dev
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
