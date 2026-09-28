# Admin CMS setup

## Repository findings and scope

The app uses React 19, Vite, TypeScript, React Router data routing (for unsaved-navigation blocking), lazy pages,
CSS modules, and shared theme tokens in `src/styles/tokens.css`. Public routes
are defined in `src/App.tsx`; content loaders are in `src/lib/`.

Mezmur/werb live in `src/data/chants/*.json` and `classified/*.json`. The existing
importer writes the separate `chants`, `chant_categories`, and
`chant_secondary_categories` catalog. `chantRepository.ts` reads published chants
and falls back to bundled JSON. Prayers/Psalms, Synaxarium, liturgical rules,
feasts, and calendar data are currently JSON bundles and TypeScript content.
Images and source PDFs are under `public/`.

The new CMS tables are additive. They do not feed the public pages yet. No data
was imported, renamed, or deleted. Publication in `mezmur` does NOT update the
legacy `chants` catalog. Plan an explicit mapping/import and public-reader
cutover later. Bundled JSON is public and must never contain CMS drafts.

Cloudflare Pages uses `npm run build`, output `dist`, base `/`, and
`public/_redirects` for direct SPA links including `/admin/login`. No Wrangler
configuration or Pages Functions exist. The repository also has an existing
GitHub Pages workflow; it was preserved and is separate from Cloudflare.

## Supabase and migrations

Use a development Supabase project first. Apply SQL in this order using the SQL
Editor, or your established Supabase CLI migration process:

1. `supabase/migrations/20260902000000_create_chant_library.sql` (existing catalog)
2. `supabase/migrations/20260928000000_cms_foundation.sql`
3. `supabase/migrations/20260928000100_cms_storage.sql`
4. `supabase/migrations/20260928000200_mezmur_management.sql`

Each new migration is transactional and intended to run once. If the existing
catalog migration was applied manually, reconcile CLI migration history before
using `supabase db push`. Do not rerun or reset a production database blindly.
The private helper schema `cms_private` must NOT be added to exposed API schemas.
Keep the `public` schema exposed for the tables and membership RPC.

All 12 requested tables are included, with UUID keys, foreign keys where
applicable, indexes, timestamps, enums, grants, and RLS. Saints, feasts, prayers,
and articles share editorial fields and have basic text/domain fields.
Polymorphic revision/report references intentionally have no foreign key so
history can survive content deletion. Revisions automatically record inserts,
updates, and the last snapshot on deletion; clients cannot forge or rewrite them.
The Auth email-change trigger keeps provisioned profile email in sync.

## Environment and Cloudflare

Copy `.env.example` to `.env.local` and set:

```dotenv
VITE_SUPABASE_URL=https://YOUR_PROJECT.supabase.co
VITE_SUPABASE_ANON_KEY=YOUR_BROWSER_SAFE_ANON_OR_PUBLISHABLE_KEY
```

The existing `VITE_SUPABASE_PUBLISHABLE_KEY` is a compatibility fallback. The
requested `VITE_SUPABASE_ANON_KEY` takes precedence. These values are public and
bundled at build time. Set them in Cloudflare Pages build environment variables
for the intended environment, then redeploy. Use Node 22 or later.

NEVER put service-role/secret keys in any `VITE_` variable or frontend source.
`SUPABASE_SECRET_KEY` is used only by the existing local importer. Backend keys
for future Pages Functions must be server-side secrets, separate from Vite.

Without Supabase configuration the public fallback works and login displays a
configuration message. With configuration but no migrations, access fails closed.

## Auth and first super admin

1. Enable email/password authentication. Disable public signup and anonymous
   sign-ins for an invitation-only CMS. Configure password/rate-limit settings
   in Supabase Auth. No registration or recovery UI is included in this phase.
2. Set the Auth Site URL to `https://tewahedodaily.pages.dev`. Allow only your
   intended production and localhost redirect URLs for future invite/recovery
   flows; avoid broad preview-domain wildcards.
3. Create the first confirmed email/password user in Supabase Authentication >
   Users. Copy that user's UUID. Account creation alone grants NO CMS access.
4. In the trusted Supabase SQL Editor, provision that UUID:

```sql
insert into public.profiles (id, email, display_name, role)
select id, email, 'Site administrator', 'super_admin'::public.cms_role
from auth.users
where id = 'REPLACE_WITH_AUTH_USER_UUID'::uuid
on conflict (id) do update set role = excluded.role, email = excluded.email;
```

Verify exactly one row was affected. Never expose bootstrap SQL through a public
endpoint. Sign in at `/admin/login`. `/admin` opens the dashboard.

`AuthProvider`, `useAuth`, `hasCmsRole`, and `RequireCmsRole` in `src/lib/auth/`
provide session restoration, credential login, sign-out, profile retrieval,
loading/error states, and reusable route protection. Auth state changes and
window focus recheck the database profile. Wrap future routes in
`RequireCmsRole allowed={['super_admin', 'admin']}` as appropriate. Guards are UX;
RLS checks current database membership on every request, including after demotion.

Session tokens use Supabase's browser persistence/refresh. Avoid untrusted HTML
rendering. Supabase Auth admin APIs for inviting/deleting users belong in a
future trusted backend, never a browser service-role client.

## Membership management

Provision an existing Auth user, change a role, or revoke CMS membership using
the signed-in browser client's RPC (or equivalent authenticated API):

```ts
await supabase.rpc('set_cms_member', {
  target_user_id: userId,
  new_role: 'contributor', // editor, admin, super_admin; null revokes access
})
```

Admin can provision/manage contributors and editors, including revocation.
Only super admin can manage admins/super admins. Direct role/email/id updates
are not granted to browsers. The RPC serializes role changes and prevents
removing the last super admin. Trusted SQL/Auth administrators can bypass these
rules, so restrict project access. A nullable role represents revoked membership,
not a fifth CMS role. No role is read from user-controlled signup metadata.
Users may edit their own display name/avatar; profile emails are never public.

## RLS behavior

| Actor | Content | Taxonomy/media | Members |
| --- | --- | --- | --- |
| Public/unassigned Auth user | Published rows only | Public taxonomy; media tied to published content | No CMS access |
| Contributor | Create drafts; edit own drafts; submit draft to pending_review; read own submissions | Existing taxonomy; published media | Own profile only |
| Editor | Read/edit/review all content; publish pending_review; reject/archive or return work to draft | Read taxonomy and draft media; assign existing tags | Own profile only |
| Admin | Full content management, including deletion/publication | Manage categories, singers, tags, media | Contributors/editors only |
| Super admin | Full CMS management | Full management | All roles |

Editor approval is the `pending_review` -> `published` transition. There is no
separate approved status. Contributors cannot edit pending/rejected/published
rows until staff return them to draft. Creator/creation timestamp are immutable,
modifier timestamps/IDs are server controlled, and contributors cannot set
publication metadata. Editors/admins can read revision history. Even super admins
cannot rewrite audit history through the browser.

`content_reports` stores correction messages, target type/ID, optional email,
and open/resolved/dismissed status. Only review staff can read/update reports;
admins may delete. Anonymous direct inserts are intentionally disabled. Before
adding a public correction form, implement a server endpoint that verifies the
target is published, validates inputs, checks CAPTCHA and rate limits, then
inserts with a server-only credential. That endpoint/form is not part of this
foundation. Do not enable an unrestricted anonymous insert policy.

## Storage

The storage migration creates six PRIVATE buckets:

- `mezmur-images`: 10 MiB, JPEG/PNG/WebP
- `mezmur-audio`: 50 MiB, MPEG/MP4/Ogg/WAV audio
- `saints`, `feasts`, `articles`: 10 MiB, JPEG/PNG/WebP
- `general-media`: 10 MiB, JPEG/PNG/WebP/PDF

Existing buckets with these IDs become private and receive these limits. Inspect
any existing usage before applying to a populated project. SVG/HTML are excluded.
For Mezmur, editors and contributors have scoped upload permissions described below. Only admins/super admins overwrite, move, or delete. Editors can preview.
Public reads are allowed only when the object path names published CMS content:

```text
<content_type>/<content_uuid>/<filename>
mezmur/aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa/cover.webp
```

Content type is one of mezmur, saints, feasts, prayers, articles. Use unique,
versioned filenames. For buckets other than mezmur-images/mezmur-audio, every object under a published record's prefix is readable;
never put unpublished alternates in that prefix. Stage such files under a
separate unpublished content record or an unrecognized prefix until ready.
Use `supabase.storage.from(bucket).download(path)` or short-lived signed URLs,
NOT `getPublicUrl` (buckets are private). Signed URLs already issued remain valid
until expiry; unpublishing prevents new anonymous reads/signatures. The existing
public site still uses its original images; CMS media integration is deferred.

Restrictive storage boundaries prevent broader permissive policies from granting
access to these buckets, while leaving unrelated bucket policies in place.
Audit project-level existing policies and run the security suite before rollout.

## Verification

```powershell
npm.cmd run build
npm.cmd run lint
node scripts/cms-auth-smoke.mjs
# With a disposable Supabase database after migrations:
psql $env:CMS_TEST_DATABASE_URL -v ON_ERROR_STOP=1 -f supabase/tests/cms_security.sql
```

The SQL test creates rollback-only fixtures and verifies role escalation denial,
contributor isolation, publication workflow, immutable authorship, revisions,
private reports, and media publication visibility. Use a disposable database;
test UUIDs and the last-super-admin assertion assume no other CMS members.

During implementation, both migrations and the SQL suite passed on isolated
PostgreSQL 17 with minimal Supabase Auth/Storage schema stubs. This validates
Postgres grants/RLS/triggers, not hosted Auth, PostgREST, or Storage HTTP behavior.
Run again on a real Supabase development project before production deployment.
The production build passed; existing large calendar/prayer chunk warnings remain.
Full-project lint has 35 pre-existing errors in untouched public-site code; CMS
files are checked separately. No unrelated public components were refactored.
The mocked browser Auth test passes login failure/success, session restoration,
profile-fetch failure/retry, sign-out, and unassigned-user denial. Public-route
browser checks passed home, practice, mezmur detail, calendar, about, prayer hub,
and a prayer collection, plus the unconfigured login and protected-route redirect.

No hosted project was changed. Remaining work: apply migrations/configure Auth,
verify hosted login/storage end to end, add the future rate-limited reports
endpoint, and deliberately migrate/connect legacy content during the separate public-migration phase.

References: [Supabase RLS](https://supabase.com/docs/guides/database/postgres/row-level-security),
[Storage access control](https://supabase.com/docs/guides/storage/security/access-control),
[Auth state events](https://supabase.com/docs/reference/javascript/auth-onauthstatechange).


## Part 2: Dashboard and Mezmur management

The Part 2 migration must be applied before using the dashboard. It adds taxonomy
archiving, protects used categories/singers/tags from deletion, introduces the
atomic `save_mezmur` RPC, and updates revisions and storage access. This section
supersedes the Part 1 storage/workflow notes above where explicitly changed.

### Routes and interface

- `/admin`: six summary cards, recent edits/publications across CMS content, and
  a review queue. Contributors see only rows permitted by their RLS policies.
- `/admin/mezmur`: server-side search, pagination (20/page), status/category/
  singer/featured filters, stable sorting, preview, duplication, archive, delete.
- `/admin/mezmur/new`: all requested title/lyrics/media/taxonomy/workflow fields.
- `/admin/mezmur/:id/edit`: edit, preview, version history, and draft restoration.
- `/admin/categories`, `/admin/singers`, `/admin/tags`: basic taxonomy management.
- Saints, feasts, prayers, articles, media, users, and settings sidebar links
  lead to clearly labeled future-phase placeholders. No community submission UI
  or other content editors were built.

The reusable sidebar/top bar use the existing ivory/navy/gold tokens and adapt to
mobile screens. Public page URLs and data loaders remain unchanged. The root
router now uses `createBrowserRouter` so `useBlocker` can protect editor links,
back/forward navigation, and other in-app navigation. Browser reload/close uses
`beforeunload`; logout separately warns about unsaved changes. Background Auth
refresh keeps in-progress form data mounted.

### Saving and permissions

`src/lib/cms/mezmurService.ts` is the typed service used by the UI. Saves pass
only editable fields plus tags to an invoker-rights Postgres RPC; each statement
still uses normal RLS. The RPC locks the record and checks `updated_at`, preventing
an old editor tab from silently overwriting newer changes. A failed tag/status
change rolls back the content and history as well. A stale-edit error retains
form input; copy any desired changes before reloading to merge them manually.

Contributors edit their own drafts and submit for review. Editors edit/review all
content and can publish from pending_review, reject, archive, or return content
to draft. Admins/super admins additionally delete, manage taxonomy, and load old
versions as drafts for review and saving. Publish/delete/management controls are
hidden from unauthorized roles; direct requests remain constrained by RLS.
Destructive list actions and unpublishing ask for confirmation.

Uploads are enabled after the first draft save so media always has a real parent
record. Editors/admins can upload Mezmur media; contributors can upload only to
their own draft's prefix. All uploads use new UUID filenames with `upsert: false`.
Only administrators retain general media overwrite/delete permissions. File
extension is derived from validated MIME type; size/type are checked in the UI
and bucket limits also enforce them on the server.

Mezmur fields store permanent `storage://bucket/mezmur/id/filename` references,
not expiring signed URLs. `mediaService.resolveMedia` creates five-minute signed
URLs for display. For Mezmur buckets, anonymous access now requires both a
published parent AND an exact reference from that parent's thumbnail/audio field.
Unattached/unsaved replacement uploads therefore remain private even while the
parent is published. Existing signed URLs remain valid until expiry.

Uploads and database saves are separate operations. Failed/discarded saves may
leave private unattached objects; no automatic cleanup deletes files that a
revision might need. Plan a reference-aware cleanup job before scaling uploads.
Duplicating creates a new draft with text/taxonomy/tags and resets featured/media;
upload separate files for that copy, so it never depends on the source record's
publication permissions. Removing media detaches it; it does not destroy history.

### Version history

Database triggers capture the previous content and tag IDs before each Mezmur
update/delete, with actor and date. New insert states are also recorded. A save
that changes status may generate two audit entries because fields/tags are saved
before the final transition within one transaction. History is never written by
the browser. The UI shows the latest 50 entries and fetches author display names
through a restricted RPC that does not expose profile email.

Admin restoration loads an editable previous snapshot as a draft; the user reviews
and saves it explicitly. Restoring never silently republishes. Old Part 1 versions
without tag snapshots preserve the current tag selection. If referenced taxonomy
was removed or media was deleted externally, resolve those references before saving.

### Public integration and remaining rollout

`getPublishedMezmur(slug)` and `listPublishedMezmur(page)` explicitly filter to
published rows, even when called with an authenticated client. Public pages can
adopt these later and resolve their storage references via the media service.
The legacy `chants` catalog and bundled content are NOT migrated or merged by this
phase; published CMS Mezmur will not appear on existing public pages until that
separate integration. Preserve language/practice fields and stable slugs when
planning that migration.

Apply the new migration to a development Supabase project, verify real Auth,
PostgREST RPC responses, and actual image/audio upload/playback, then deploy the
frontend with the existing browser-safe environment variables. No remote database,
user accounts, or Cloudflare deployment were modified by this implementation.

### Part 2 verification

```powershell
npm.cmd run build
node scripts/cms-auth-smoke.mjs
node scripts/cms-admin-smoke.mjs
npm.cmd run lint:cms
psql $env:CMS_TEST_DATABASE_URL -v ON_ERROR_STOP=1 -f supabase/tests/cms_security.sql -f supabase/tests/mezmur_workflow.sql
```

The browser scripts use mocked Supabase HTTP, not live accounts. They exercise
login, session restoration, role-specific UI, creation/editing, failed saves,
unsaved navigation, image/audio upload and failures, preview, review/publish,
version restoration, duplication/archive/delete, taxonomy, filters/pagination,
and mobile overflow. Set `CMS_SCREENSHOTS=1` to write ignored screenshots to
`test-results/`. They require Playwright Chromium installed.

SQL suites use real Postgres roles, grants, RLS, transactions, and triggers, and
roll fixtures back. Run against a disposable Supabase database after all migrations.
They were also validated locally on PostgreSQL 17 with Auth/Storage schema stubs;
that does not replace a final hosted Supabase HTTP smoke test. Full-project lint
still has 35 pre-existing errors in public-site components outside this scope;
the changed CMS/routing files pass lint. Existing large calendar/prayer bundle
warnings remain.


Final local checks also passed the production public-route smoke (including
Mezmur detail) and the existing mobile suite: 10 public routes at 375, 390, 412,
and 430 px. The final build and `npm run lint:cms` passed.

## Community contributions (Part 3)

See [COMMUNITY_SUBMISSIONS_SETUP.md](COMMUNITY_SUBMISSIONS_SETUP.md) for the community migration, Cloudflare runtime secrets, Turnstile, reviewer queue, and draft conversion workflow.

## Public migration and discovery (Part 4)

See [PUBLIC_CONTENT_MIGRATION.md](PUBLIC_CONTENT_MIGRATION.md) for migration `20260928000400_public_discovery.sql`, safe import commands, diagnostic reports, publication-only queries, discovery/search, favorites, and rollout sequencing. The shared public AuthProvider reuses the existing session/profile setup. Its footer shows Admin Login while logged out, Admin Dashboard for CMS members, and no admin link for ordinary signed-in users; route guards and RLS remain authoritative.

## Broader content platform (Part 5)

Apply `supabase/migrations/20260928000500_content_platform.sql` after all earlier
migrations, first on a staging project. It adds multilingual content fields,
related-content links, article teaching categories, daily schedules, shared
transactional editor RPCs, and tightened Storage rules. It does not import or
publish content. The migration has been applied to a disposable local PostgreSQL
17 database with Auth/Storage stubs; it has **not** been applied to your hosted project.

### Content editing and publishing

Use `/admin/saints`, `/admin/feasts`, `/admin/prayers`, and `/admin/articles`.
Each has a searchable, paginated list, create/edit, preview, review, publishing,
rejection, archiving, and version history. Body text is plain text, rendered
without HTML injection. Amharic, English, and Oromo have public language toggles;
prayers also support transliteration. Saints and feasts include Ethiopian
month/day and editorial date notes. Feasts include fasting information. Articles
have the six teaching categories and public category filtering. Related content
can link to published saints, feasts, prayers, articles, or Mezmur.

Contributors can create and edit their own drafts and submit them for review.
Editors can review and publish pending-review content. Admins and super admins
can manage all content and restore prior versions as drafts. Other signed-in
accounts have no CMS access. Every write passes RLS and existing workflow
triggers; the shared RPC uses caller permissions, checks stale revisions, and
stores previous states transactionally. Archiving replaces destructive deletion
in these four editors. Revision history shows the latest 50 states.

Public libraries use explicit `status = published` filters as well as RLS.
Relations and daily selections also explicitly exclude unpublished targets,
including when a CMS member views the public site. Search uses the existing
cross-content search service. Contributor emails remain confined to authorized
submission review and are not projected into public pages.

### Media

`/admin/media` is for admins and super admins. It supports paginated filename
search, MIME-family filters, previews, real upload progress, copy reference/URL,
and confirmed deletion. Editors and contributors upload within permitted content
editors after saving a draft. JPEG/PNG/WebP images are limited to 10 MiB by the
uploader, MP3/M4A/Ogg/WAV to 50 MiB; empty files and unsupported MIME types fail.
Bucket MIME/size restrictions also apply. The general-media bucket permits
50 MiB overall because it holds audio as well as images.

Store the permanent `storage://bucket/path` reference in CMS fields. Signed URLs
are only for temporary sharing (one hour) and must not be stored in content.
Mezmur previews now support references from the shared media library. External
HTTPS media is supported but its availability and deletion are outside this CMS.
Files are private: public signing/read access requires an exact attachment to
published content. An uploaded file does not become public just because its
folder belongs to a published item. Save the editor to attach uploads.

Deletion and overwriting are blocked in Storage RLS when a permanent reference
appears in current content or any saved revision, even if the content is archived.
Historical retention is deliberate; any later cleanup tool must account for
revision references. Signed URLs already issued remain usable until expiry.
Removing abandoned, unattached uploads is an admin action. No virus scanning or
media transcoding is included; MIME checks are not content inspection.

### Manual daily selections

Admins and super admins use `/admin/daily` to select a Gregorian date, published
Mezmur, saint, and feast, Bible references, a fasting indicator/notes, and a
homepage announcement. Save with “Publish this schedule” checked to expose it.
The homepage selects today's date in `Africa/Addis_Ababa`. Future published
schedules can be queried by date; leave confidential announcements unpublished
until release. This is a date-indexed editorial schedule, not a calendar algorithm.
Publishing a schedule cannot publish its selected content. Unpublished or archived
targets are omitted. The existing church calendar remains independent.

`dailyService.ts` separates schedule storage from rendering so a future verified
calendar provider can populate the same structure. Content selections and fasting
guidance require editorial verification. Submission analytics count this UTC
month's submissions and the pending queue; no visitor tracking was added.

### Deployment and verification

Use Cloudflare Pages with `npm run build` and output `dist`; preserve the existing
Pages Functions and `public/_routes.json`. Set the browser Supabase URL and
anon/publishable key from `.env.example`, plus the community endpoint's runtime
secrets and Turnstile configuration from its setup guide. Never prefix a service
role/secret key with `VITE_`. No new browser secret is needed for this phase.
Apply migrations before deploying the frontend and verify Supabase Auth allowed
redirect URLs for your production and preview domains.

```powershell
npm.cmd run build
npm.cmd run lint:cms
npm.cmd run lint:public
npm.cmd run lint:community
npm.cmd run test:platform
psql $env:CMS_TEST_DATABASE_URL -v ON_ERROR_STOP=1 -f supabase/tests/content_platform.sql
```

Run the other browser and SQL suites described above as regression checks.
Browser tests mock Supabase HTTP; the SQL tests exercise actual PostgreSQL RLS,
grants, and triggers with rollback fixtures. Before production launch, repeat
sign-in, publishing, uploads, community submission/review/conversion, and anonymous
draft denial against a staging Supabase project with real Turnstile keys.
The repository-wide lint baseline still contains 35 older errors; scoped CMS,
public-content, and community lint pass. Existing large calendar/prayer bundle
warnings remain. User/Settings admin screens remain placeholders from earlier
phases; role assignment remains the documented trusted database operation.

Local verification for this phase: production build; scoped CMS, public-content,
and community lint; Auth, Mezmur admin, community API/browser, public discovery,
and broader platform browser suites; all five SQL suites; and the production
mobile suite (10 routes at 375/390/412/430 px) passed. The broader platform suite
also checks eight new routes at 390 px, revision restoration, image/audio upload
errors, media filtering, and protected versus unused-file deletion. All seven
migrations were applied in order to a fresh local database. Full-site lint was
run and retained its 35-error/4-warning baseline.

