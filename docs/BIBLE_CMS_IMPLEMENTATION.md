# Bible Manager implementation report

## Existing implementation reused

The public Bible reader and Search Buddy already use the same canonical chain:

`bible_editions → bible_source_books → bible_chapters → bible_sections / bible_verses`

- Public routes: `/bible`, `/bible/:bookSlug`, `/bible/:bookSlug/:chapter`
- Browser data access: `src/lib/bible/bibleQueries.ts`
- Exact reference and keyword retrieval: `src/lib/bible/bibleSearch.ts`
- Search Buddy server retrieval: `backend/app/main.py` (`bible_reference`, `bible_chapter`, `search_bible_text`)
- Canon and source-volume mapping: `bible_canonical_books` and `bible_source_books`

No competing Bible tables or second search corpus were added.

## Local implementation

- Added `/admin/bible` and the **Bible Manager** navigation entry for editor, admin, and super-admin roles.
- Added translation metadata for Amharic, English, Geʽez, and future languages without replacing another translation.
- Added staff-only chapter drafts, immutable publication revisions, restore-to-draft, import reports, and content links.
- Added guarded RPCs for draft save, publish, revision restore, translation creation/update, and imports.
- Added CSV, JSON, and USFM parsing with preview, duplicate detection, numbering-gap warnings, create-only/update-existing modes, progress, and per-chapter error reporting.
- Added dynamic public reader translation switching; the established `am` and `web` codes remain compatible while additional published edition codes are supported.
- Added a canonical Bible passage picker to the Calendar Card editor.
- Preserved Search Buddy's exact-reference-first behavior and verified-source citations. The existing backend continues querying only public Bible rows and does not generate quotations when retrieval fails.

## Publication and access rules

- Drafts live in `bible_chapter_drafts`; anonymous users have neither grants nor an RLS policy for this table.
- Public readers only see editions and source books with `is_public = true` and `publication_status = 'published'`.
- Publication requires an authenticated `editor`, `admin`, or `super_admin` profile.
- Publication requires non-empty verses, edition name/language/attribution, and one of: `owned`, `licensed`, `public_domain`, or `permission_granted`.
- `unknown` and `restricted` rights never become publishable automatically.
- Restore is limited to admin and super-admin and restores into a draft; it does not silently change public Scripture.
- Existing public editions are backfilled to the new `published` state, preserving current reader routes and content.

## Migration

Apply only:

`supabase/migrations/20261024210000_bible_cms_management.sql`

Because the linked project has divergent migration history, do **not** run unrestricted `supabase db push`.

Recommended controlled procedure:

1. Back up the linked database and confirm the earlier canonical Bible migrations are present.
2. Open the new migration, review it, and run that single file in a transaction through the Supabase SQL editor or your controlled migration runner.
3. Confirm PostgREST reports the schema reload notification.
4. Sign in as staff and open `/admin/bible`.
5. Save a chapter draft. In an anonymous browser, confirm the draft text is absent.
6. Confirm truthful edition attribution and rights metadata, then publish one non-production test chapter.
7. Confirm the public reader, exact reference lookup, calendar citation link, and Search Buddy citation.
8. Restore the previous revision to a draft, confirming the public text does not change until Publish is selected.

No production SQL, content mutation, deployment, commit, or push was performed by this implementation.

## Validation completed locally

- Production TypeScript/Vite build: passed.
- Changed-file ESLint: passed.
- Bible CMS parser/security regression test: passed.
- Bible Manager Playwright workflow at mobile/desktop and light/night modes: passed.
- Public Bible reader Playwright test (81-book catalog, drafts hidden, Amharic/English/Geʽez switching, duplicate verse labels, responsive layouts): passed.
- Search Buddy Scripture UI Playwright test: passed.
- Bible catalog presentation test: passed.
- Search Buddy backend intelligence tests: 14 passed.
- Isolated PostgreSQL migration/RLS test: passed for staff draft save, unknown-rights rejection, authorized publication, public visibility, and unauthorized write rejection.

Repository-wide ESLint remains blocked by 49 pre-existing React hook/compiler errors outside this Bible implementation. The changed Bible files pass ESLint. Two live search scripts also require configured network services and failed locally with `Network unavailable` / `fetch failed`; their offline UI and backend logic tests passed.
