# Community submissions

This phase adds community contributions without migrating the existing public catalog. Apply Parts 1/2 first: see [ADMIN_CMS_SETUP.md](ADMIN_CMS_SETUP.md).

## Routes and workflow

- `/submit-mezmur`: anonymous Mezmur form, linked in the public footer.
- `/suggest-correction`: reached through **Suggest a Correction** on public Mezmur detail pages; carries the legacy catalog key, title, and source page. Future CMS detail pages can pass `content_id` instead of `legacy_key`, plus `title` and `page` query parameters.
- `POST /api/submissions`: Cloudflare Pages Function; returns only a readable reference such as `TD-2026-00128` and a retry flag.
- `/admin/submissions`: searchable, paginated, status/type-filtered reviewer queue and status totals.
- `/admin/submissions/:id`: private details, duplicate suggestions, review decisions, notes, and draft conversion.

New → Start Review → verify/correct sources → Approve → Create Mezmur From Submission → standard draft editor → Submit for Review → Publish. Approval alone never publishes. Conversion locks the submission, creates exactly one draft, records the relationship, and marks it converted in one transaction. Retrying conversion opens the same draft. Editors choose official singers/categories/tags and correct lyrics, translations, images, and audio in the existing editor. Original suggestions remain accessible through its submission link.

The database requires a community-origin draft to enter `pending_review` before publication, including for admins. It preserves the origin on updates. This is an editorial state gate, not a two-distinct-reviewers rule. Existing revision history continues to capture Mezmur changes.

Request Changes, Reject, and Mark Duplicate require explanatory private notes. Request Changes records a decision; it does **not** email anyone or provide a public resubmission portal. Corrections are reviewed here and applied manually to the related CMS editor or legacy catalog through its existing workflow. They never modify public content automatically.

## Supabase migration

Apply `supabase/migrations/20260928000300_community_submissions.sql` after the earlier migrations, using Supabase CLI migrations or the SQL editor. It creates the table/enums, readable reference sequence, private rate-limit/receipt tables, reviewer RPCs, duplicate matching, and draft-origin guard. Enable `pg_trgm` in the `extensions` schema; the migration creates it if absent. If your project already installed it in another schema, have your database administrator reconcile that schema before running this migration.

The enum supports prayer, saint, feast, article, and other for future work; the public endpoint currently accepts only Mezmur and corrections. Extra correction fields preserve target context, correction type, proposed text, explanation, and source citation. `contributor_credit` and `source_submission_id` are added to Mezmur.

Do not add an anonymous INSERT policy to `community_submissions`. Anonymous visitors submit through the verified endpoint; direct database INSERT is deliberately denied because it would bypass Turnstile and limits. Only `service_role` may call `receive_community_submission`. Browser roles cannot read receipts, hashes, or rate-limit records. Anonymous users cannot read submissions or emails, update decisions, or convert content. Authenticated visitors without a CMS role and contributors see no submissions under RLS. Editors/admins/super admins can read them and call explicitly role-checked review/conversion RPCs; direct browser writes to the table are denied.

The server RPC allowlists fields and forces `submitted`, ignoring forged status/admin metadata. Reviewer identity and timestamps come from the authenticated session/database. Optimistic timestamps prevent stale review decisions. Conversion copies content fields only; it never copies contributor email or private notes. Optional public credit copies only the name, only with recorded consent and an editor's explicit choice. The current public catalog does not yet render this credit; future integration must render only `contributor_credit`, never query submissions.

## Cloudflare Pages and Turnstile

1. Create a managed Turnstile widget in Cloudflare, allowing the production hostname (and a separate development/preview hostname if needed).
2. Add **build environment** `VITE_TURNSTILE_SITE_KEY` with the public site key, alongside existing `VITE_SUPABASE_URL` and `VITE_SUPABASE_ANON_KEY`. Rebuild after changing it.
3. Configure these **Pages Functions runtime secrets/variables** for the intended environment:
   - `SUPABASE_URL`: project URL.
   - `SUPABASE_SERVICE_ROLE_KEY`: server-only service-role JWT or Supabase secret API key.
   - `TURNSTILE_SECRET_KEY`: widget secret.
   - `SUBMISSION_IP_HASH_SECRET`: random secret with at least 32 bytes of entropy, distinct from other secrets.
   - `SITE_URL`: exact canonical origin, e.g. `https://tewahedodaily.pages.dev` (no pathname).
4. Deploy from the repository root using Cloudflare Pages Git integration, build `npm run build`, output `dist`, or Wrangler Pages deployment with the root `functions/` directory present. A static-only upload of `dist` is insufficient. `public/_routes.json` limits Functions invocation to `/api/*`, preserving normal static/SPA delivery.
5. Set a separate canonical `SITE_URL` and matching widget hostname for previews, or leave submissions disabled there. Requests through alternate domains fail closed; use the canonical domain or configure its environment accordingly.

Never prefix runtime secrets with `VITE_`, put them in browser code, commit them, or expose them through a public config endpoint. The Function requires all bindings and fails closed if absent. The service key is privileged: keep it restricted to this server runtime.

For local full-stack testing, copy `.dev.vars.example` to ignored `.dev.vars`, set real development values and an exact local `SITE_URL`, build, then run `npx wrangler pages dev dist` from the repository root. Vite dev/preview alone does not execute Pages Functions. Use a development Turnstile widget appropriate for your host. The handler checks verification `hostname` and `action=community_submission` in addition to success; test fixtures must reproduce these fields. Never disable verification in production. See [Cloudflare server-side validation](https://developers.cloudflare.com/turnstile/get-started/server-side-validation/) and [Pages Functions bindings](https://developers.cloudflare.com/pages/functions/bindings/).

## Abuse prevention and privacy

- Server-side type/length/minimum validation, bounded 384 KiB JSON body, honeypot, same-origin checks, and Cloudflare-provided client IP.
- Server-side Turnstile verification, including hostname and action; expired/reused/invalid tokens cannot save. The form resets verification after each attempt and preserves entered text on failure.
- Only HTTPS YouTube video URLs are accepted and canonicalized. Source citations may be text or HTTPS links. No submitted URL is fetched. Correction targets must be published CMS records, published imported Mezmur, or known bundled fallback entries.
- Five new verified submissions per HMAC-hashed IP per hour, enforced atomically in Postgres. Exact payload retries from that IP within 24 hours return the same receipt. Shared networks share this quota. No raw IP is stored in the database (Cloudflare verification receives it).
- Private hash/receipt rows older than 24 hours are removed on subsequent submissions. For strict wall-clock retention during inactivity, schedule equivalent cleanup with Supabase Cron. Choose a retention/deletion policy for contributor contact data before launch; submissions themselves are retained until an authorized database operator removes them.
- Similar titles, Amharic titles, singer/title combinations, and equivalent YouTube videos are warnings only, across CMS content, submissions, and imported legacy chants. Bundled-only fallback songs must be imported to participate in duplicate matching. No similarity result automatically rejects a submission.
- For higher traffic/attacks, configure a Cloudflare WAF rate-limiting rule for `POST /api/submissions` in addition to Turnstile and the database quota. The database quota applies after successful verification; it does not replace perimeter request limiting.

## Verification

- `npm run build`
- `npm run lint:cms` and `npm run lint:community`
- `npm run test:community` (real handler with mocked upstreams plus real browser components with mocked Auth/Turnstile/Supabase).
- Existing `npm run test:cms:auth` and `npm run test:cms:admin` regression checks.
- Run `psql -v ON_ERROR_STOP=1 -f supabase/tests/community_submissions.sql` on a **disposable migrated Supabase/local database**, alongside existing SQL security/workflow tests. Fixtures roll back; sequences can retain gaps. This tests actual grants, RLS, private contact access, forced submitted status, replay/rate limits, conversion, duplicate matching, and final-review gating.

Before production launch, verify the deployed widget and endpoint with a non-production submission, exercise editor review/conversion, and confirm public direct REST access is denied. Local mocked browser tests cannot validate your deployed Cloudflare bindings, real widget credentials, or hosted Supabase grants.

Local verification completed: production build, Wrangler Pages Function compilation, scoped CMS/community lint, endpoint/browser suites, existing auth/editor suites, all three SQL security/workflow suites on isolated PostgreSQL, and the existing 10-route mobile suite at four phone widths. Full-project lint still reports 35 pre-existing errors and four warnings in unrelated public components. Trigram fuzzy matching depends on the database locale's character classification; exact title/Amharic matches have an explicit fallback.
