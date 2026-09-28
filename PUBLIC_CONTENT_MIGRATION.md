# Public content migration and discovery

## Results from this checkout

The importer was dry-run against the source files, then all eligible payloads were imported into an isolated PostgreSQL database and imported again to verify idempotency. **No hosted Supabase import or deployment has been performed:** this workspace has no configured server credentials.

| Result | Count |
| --- | ---: |
| Rows inspected in the two source packs | 271 |
| Werb rows excluded from the Mezmur import | 15 |
| Repeated source ID, last row retained | 1 |
| Unique Mezmur source IDs | 255 |
| Shared-video candidates held for review | 10 |
| Eligible Mezmur successfully tested locally | 245 |
| Mapped categories | 25 |
| Distinct topic/occasion tags | 277 |
| Attributed singers in the sources | 0 |

Eligible records include 166 Amharic and 79 English entries; one Amharic entry also carries a Ge’ez language marker. Nine have lyrics but no video. None of these source packs supplies audio files or thumbnails; valid YouTube links supply thumbnail URLs. The audio player becomes available for content with an uploaded/linked audio file.

The source files and classification files remain unchanged. Base files provide content; matching classified rows provide taxonomy metadata only, avoiding stale classifications overwriting lyrics. Original category/classification metadata and unhandled fields are retained in `legacy_metadata`. Unknown fields, invalid media, content discrepancies, missing attribution, and review flags are recorded in timestamped `migration-reports/mezmur-*.json` files. These reports contain IDs and diagnostic metadata, not credentials.

200 eligible records reference category translations containing literal question-mark placeholders. The importer uses the catalog's English name and leaves the invalid Amharic category name unset; it does not alter Amharic lyrics. Four records retain classification review flags: `estifanos-semeat`, `barkeni-aba-yaqob`, `nolawi-tiguh`, and `sew-le-sew`. No singer identities are inferred or invented.

The ten held source IDs are:

- `beselam-niee`
- `beselam-ni-mariyam`
- `iyaqem-we-hana`
- `enat-alegn-yemitabbs-enba`
- `ye-fikir-enat-ye-selam`
- `hawaryaw-menekuse`
- `nana-amanuel-na-medhanite`
- `nu-be-egziabher-des-yibelen`
- `on-the-cross-i-witnessed-his-love`
- `we-will-praise-the-trinity`

Review each against the retained source ID named in the report. The last two include English translations sharing an Amharic recording; editors should reconcile translations before merging. Held entries are not silently merged, published, or assigned redirect aliases. Their old detail URLs will need editorial resolution before a complete public cutover. Eligible entries preserve the existing slug convention, the `dink-adirgolignal` override, and source-ID aliases.

## Safe rollout

1. Keep `VITE_PUBLIC_MEZMUR_SOURCE=legacy` during preparation if production already has Supabase browser variables. This retains the existing public experience. With Supabase configured and no legacy override, the new public library is active.
2. Apply `supabase/migrations/20260928000400_public_discovery.sql` **after all earlier migrations**. It adds import identifiers/metadata, occasion tags, discovery/search RPCs, indexes, and favorites with owner-only RLS. Use your normal Supabase migration workflow.
3. Run `npm run supabase:plan-mezmur`. Review the latest report and correct source issues as appropriate. The default command never connects to a database.
4. Set server-only `SUPABASE_URL` and `SUPABASE_SERVICE_ROLE_KEY` (or existing `SUPABASE_SECRET_KEY`) in ignored `.env.local` or the command environment. Never use `VITE_` for these keys.
5. Run `npm run supabase:import-mezmur -- --apply` to insert **drafts**, or `npm run supabase:import-mezmur -- --apply --publish-existing` to explicitly import already-public source material as published. Review the dry-run report before choosing publication. This importer does not process community submissions.
6. Review the resulting report, verify public queries, resolve held items, and check actual media on the hosted project. Then set `VITE_PUBLIC_MEZMUR_SOURCE=supabase` (or remove the override) and rebuild/deploy Pages.

Each record's taxonomy, content, and tag links are inserted atomically by a **service-role-only** RPC. A database advisory lock serializes imports. Existing source keys, slugs, equivalent YouTube videos, or matching title/Amharic-title combinations are skipped, never overwritten. An existing draft stays a draft on rerun—even with `--publish-existing`; use the editor's normal review process to publish it. Errors roll back that record, are logged, and make the CLI exit nonzero. Earlier successfully imported records remain safe to retry.

Import publication timestamps represent the import date because the source has no original publication dates. Audit records use a null actor for server imports; `legacy_key` and metadata identify provenance. Classifications and singers can subsequently be corrected in the CMS. The importer will not replace those corrections on rerun.

## Public routes and data

- `/practice`: paginated CMS Mezmur discovery; `/practice/mezmur/:slug`: published detail with alias lookup and canonical metadata.
- `/practice/werb`: retained Werb/guided practice experience. In Supabase Mezmur mode it does not list the legacy Mezmur catalog.
- `/search`: global search across published `mezmur`, `saints`, `prayers`, `feasts`, and `articles`, with type labels and pagination.
- `/content/:kind/:slug`: public CMS saint/prayer/feast/article detail. Existing static prayer/calendar routes remain intact. Their JSON content is not automatically copied into CMS tables or included in CMS global search by this migration.
- `/account`: existing-user Supabase sign-in and sign-out, without requiring a CMS role.
- `/favorites`: private, paginated favorites for signed-in users. Account registration/password recovery remain outside this phase; existing Auth users can use favorites even without a profile or CMS role.

The shared footer includes a subtle Admin Login link when logged out and Admin Dashboard for contributor/editor/admin/super-admin profiles. It stays hidden while auth restores and for ordinary signed-in users (including missing/null profiles or an unrecognized `user` role). It uses the existing Supabase Auth provider and profile lookup; protected routes and RLS still enforce access.

Reusable services live in `src/lib/publicContent/service.ts`, with shared async loading/error handling. Public RPCs use **security invoker**, obey existing RLS, and explicitly filter `status='published'`, even when the caller is an editor or admin. Favorites require `user_id=auth.uid()` and published content on insert; one user cannot read/change another user's favorites. No public query reads submission contact details. See the [Supabase RLS guide](https://supabase.com/docs/guides/database/postgres/row-level-security).

Supabase mode never falls back to JSON because a query fails or returns no rows. This prevents archived or unpublished hymns from reappearing through an old bundled catalog. Without Supabase configuration, or with the explicit legacy setting, the previous public experience is still available. Treat legacy mode as a temporary whole-catalog rollout switch, not as enforcement of CMS editorial status.

## Discovery, playback, and SEO

Mezmur search covers titles (including Amharic/Oromo), lyrics, transliteration, singer names, and tags. Language, singer, category, occasion, featured, recent publication, and alphabetical controls live in shareable URL parameters. Occasion tags use `tags.kind='occasion'`; import maps holidays, usage, and seasons to that kind. Newly created CMS tags default to topic; set their kind in Supabase when maintaining new occasion taxonomy.

Queries return 24 cards per page with deterministic ordering and counts; cards omit full lyrics. Detail pages load one record. Favorites use one bounded RPC rather than one detail request per favorite. Published date/category/singer and trigram indexes support discovery. Multilingual substring matching avoids assuming an English text-search stemmer. Global body search is server-side with bounded results; monitor query plans and consider a maintained search index if the other content tables grow substantially.

Images are lazy-loaded. Storage media remains private and resolves through signed URLs (one-hour lifetime); Retry refreshes an expired audio link. YouTube embeds load only on request. The reusable audio provider persists across **public SPA navigation**, offers native play/pause/seek/duration plus volume, and previous/next for the visible page's audio playlist. Closing the player, reloading the document, or entering the separate admin layout ends playback. Mobile operating systems may control volume themselves. Starting YouTube on a detail page stops the global audio track.

Detail pages include semantic headings, multilingual lyric toggles, optional consented contributor credit, CMS-ID correction links, page title/description, canonical URL, and Open Graph metadata. Metadata is updated client-side, consistent with the existing Vite SPA. Server-rendered social previews/sitemaps would be a separate enhancement; crawlers that do not run JavaScript may still see the base HTML metadata.

## Verification commands

```sh
npm run build
npm run lint:public
npm run lint:cms
npm run lint:community
npm run test:public
npm run test:cms:auth
npm run test:cms:admin
npm run test:community
```

For a disposable migrated PostgreSQL/Supabase instance, run all `supabase/tests/*.sql` with `psql -v ON_ERROR_STOP=1`. `public_discovery.sql` covers anonymous/staff publication boundaries, lyric/title/singer/tag search, combined filters, alias lookup, global types, and cross-user favorites denial.

To test the full source import without changing persistent content, generate SQL with `node scripts/test-mezmur-import.mjs --emit-sql <temporary-path.sql>` and run it against a **disposable, empty, migrated database**. It imports every eligible record, retries all records with changed titles to prove no overwrites, checks publication and pagination, and rolls back the fixtures. Generated SQL includes public lyrics; do not confuse it with a production migration.

Hosted credentials and a production deployment are still required for end-to-end verification of the actual Supabase project. The repository's unrelated pre-existing lint errors are not resolved by this public-content phase.

Local verification completed: production build; public/CMS/community scoped lint; all four SQL security/workflow suites; full 245-record import and repeat-import assertions; public discovery/audio/favorites/Admin-link browser checks; existing CMS sign-in/editor and community tests. All eligible slugs were compared with the existing public loader, with zero differences. Full-project lint retains 35 pre-existing errors and four warnings in unrelated components.
