# Mezmur lyric search and Bible verse-sentence search (2026-11-03)

No SQL executed, no migration applied, no live database or production service contacted, nothing staged, committed, pushed or deployed. All search tests use mocked APIs and fixture text.

## 1. Behaviour before and after

| | Before | After |
|---|---|---|
| Mezmur, API healthy | `GET /api/hymns/search` order shown; card text was the first 240 characters of a description or lyric (`preview`) | Same API order (authoritative). Each card shows the **matched lyric passage** with the matching words highlighted; a lyric match opens `/hymns/mezmur/:slug?q=…` and the lyrics viewer highlights and scrolls to the match |
| Mezmur, API down or empty | Title/keyword match only, after downloading the **entire** published catalog to the browser; no lyrics | Bounded public-projection search: at most two filtered requests of at most 60 rows, over titles, keywords and all lyric fields; verified and ranked locally |
| Mezmur + language filter | Always title-only catalog scan, bypassed the API | Same lyric-aware path (API first, then fallback), filtered by language; at most 50 matches, paged 24 at a time |
| Mezmur ranking | API scoring only | Unchanged for the API. Fallback uses the same classes: exact title, title phrase, lyric phrase, partial/keyword |
| Backend prefilter | Normalized query matched against raw stored text, so Ethiopic variant letters (ሠ/ሰ, ሐ/ሀ, …) missed; token recovery searched only `lyrics_amharic`; `restricted` hymns' lyrics could be matched and previewed | Variant letters become single-character wildcards; token recovery searches every lyric column; `restricted` hymns match by title only and never expose lyrics (mirrors `public.mezmur_public`) |
| Bible text search | One `ILIKE '%whole phrase%'`, no ordering before an arbitrary 40-row limit; a comma, extra space or Ethiopic punctuation broke the match; highlight only the literal full query | Bounded retrieval (at most 120 verses: every distinctive word, at most 3, must occur), then word-level verification and ranking: exact phrase first, then share of words matched, then edition/book order. Excerpts are verbatim slices of the stored verse centred on the match, with word-aligned highlights |
| Bible sentence vs reference | `Mark my words 5` parsed as book `Mark my words`, chapter 5, and ended in "no book matched" | A multi-word "book" that matches no book is searched as verse text. Real references (`John 3:16`, `1 John 4:8`, `ዮሐንስ 3:16`) are unchanged |
| Bible API hits | Rendered as returned, even if irrelevant | A `bible_search` hit is shown only if its own text contains the query words (highlighted); otherwise the local verse search answers |
| Bible URL state | Search lived in component state | `?q=` in the URL: direct links, refresh, Back/Forward restore the query and results |

Matching rules (one shared module, `src/lib/search/textMatch.ts`, used by both pages): Unicode NFKC, case and diacritic folding, whitespace and Ethiopic punctuation as separators, Ethiopic variant families (same families as the backend), and three conservative Latin transliteration rules (apostrophes, doubled letters, `ph`/`f`, `ck`/`k`). `q` and `k` are deliberately **not** merged. English function words never match on their own. A phrase must be consecutive; otherwise at least 60% of the meaningful words (minimum two) must occur close together. Nothing is translated, transliterated or invented: every excerpt is a slice of one stored field and the label comes from that field's own edition.

## 2. Verified examples (from the tests; fixture data)

Mezmur (`test-lyric-verse-search-browser.mjs`, `test-lyric-verse-search.ts`)
- `Peace` → exact-title hymn first; the hymn whose English lyric contains it second, excerpt `Peace be with you. The Lord be with you all.` with `Peace` highlighted.
- `እግዚአብሔር  ከእናንተ ጋር።` (extra space, Ethiopic full stop) → that hymn; the lyrics viewer highlights `እግዚአብሔር` in place (CSS Custom Highlight API).
- `ሰላም ለናንተ ይሁን` (typed ሰ, stored ሠ) → found via `_ላም` wildcard; excerpt highlights `ሠላም ለናንተ ይሁን` exactly as stored.
- `Egziabher  kenante` → the stored transliteration; `  the   lord  be with   you ` → the English lyric.
- Draft hymn returned by a deliberately leaky view/API: never shown. Restricted hymn: found by title, no excerpt. `zzqx nothing here`, one-letter and empty queries: calm empty state, no error.

Bible
- `John 3:16` → structured card with the stored WEB text. `for God so loved the world` → `John 3:16`, English · WEB, link `/bible/john/3?edition=web#verse-16`, words highlighted, excerpt verbatim.
- `in the begin` → Genesis 1:1; `God is love` → 1 John 4:8 (exact phrase) before John 3:16 (words).
- `በመጀመሪያ እግዚአብሔር ሰማይንና ምድርን ፈጠረ።`, the same with `፣` and extra spaces, and `እግዚአብሔር ሰማይ` → Genesis 1:1, **Amharic edition only**, link `?edition=am#verse-1`, no English-edition result mixed in.
- `God is love 4` → 1 John 4:8 as text (mutation-checked: with the guard disabled this test fails).
- Search backend returning 503, or returning an irrelevant hit: the local verse search still answers and the irrelevant text is never displayed.

## 3. Evidence (PASS / FAIL / UNKNOWN)

| Check | Result |
|---|---|
| `npx tsc -b` | PASS (exit 0) |
| Targeted ESLint (13 files) | PASS (exit 0) |
| `npm run build` | PASS |
| `scripts/test-lyric-verse-search.ts` (matcher, excerpts, ILIKE helpers, ranking, bounded fallback, API decoration) | PASS |
| `scripts/test-lyric-verse-search-browser.mjs` real components at 360, 390 and 1280 px (33 checks, no horizontal overflow, no page errors) | PASS |
| `backend/tests/test_hymn_search_lyrics.py` (6) and full backend suite | PASS (223 passed, 7 skipped) |
| Bible regressions: `test:bible-search`, `bible-page-chat-refs`, `amharic-bible-routing`, `bible-catalog-presentation`, `test-bible-name-language-browser`, `test-navigation-history` (21) | PASS |
| `test:mezmur-api-search` | FAIL, environmental: the live API currently returns 0 results for the Amharic title it checks (reproduced with a direct `searchHymns` call before any of this code runs), so the page correctly falls back and the test expects `api` |
| `test:shared-bible-search` | FAIL, pre-existing/live: the deployed Search Buddy returns `Open John 3:16` un-normalized |
| `test-search-regression.mjs` | FAIL, pre-existing: asserts `amharicOnly` in `PublicMezmurLibrary.tsx`; the committed file does not contain it either |
| Real PostgREST/RLS behaviour, real index performance, the deployed backend | UNKNOWN (not exercised; see section 5) |

## 4. Files

New: `src/lib/search/textMatch.ts`, `src/lib/search/mezmurLyricSearch.ts`, `src/lib/search/lyricHighlight.ts`, `src/components/search/HighlightedText.tsx`, `scripts/test-lyric-verse-search.ts`, `scripts/test-lyric-verse-search-browser.mjs`, `backend/tests/test_hymn_search_lyrics.py`, `docs/ai/proposed-migrations/20261104_lyric_search_trigram_indexes.sql` (proposal only), this document.

Modified: `src/lib/search/unifiedHymnSearch.ts`, `src/lib/search/sharedBibleSearch.ts`, `src/lib/search/types.ts` (optional `highlights`), `src/lib/bible/bibleSearch.ts`, `src/components/bible/BibleSearchBar.tsx`, `src/pages/PublicMezmurLibrary.tsx`, `src/pages/PublicMezmurDetail.tsx`, `src/pages/HymnPractice.module.css`, `src/index.css`, `backend/app/main.py`, `package.json` (one script).

## 5. Database and backend capabilities

- Nothing in the application requires a migration; search works on the existing public view and tables.
- Existing support: `bible_verses_text_trgm_idx` is defined in `20261028100000_bible_verse_text_search_index.sql`; whether it is applied live is **UNKNOWN**. No trigram index exists for `mezmur_data_import`; `20261104_lyric_search_trigram_indexes.sql` proposes five (read-only checks included, `CREATE INDEX CONCURRENTLY`, per-index rollback). It is a performance aid only.
- `backend/app/main.py` changes (restricted-lyric gating, variant wildcards, wider token recovery) need a backend deployment. The frontend works without it, but until it ships the API still ranks and previews `restricted` hymns by the old rule. The browser excerpts are safe regardless, because they come only from `mezmur_public`.
- Not proposed (design decision): a generated normalized search column to make the database prefilter variant-complete for Latin transliteration.

## 6. Remaining limitations

- The database prefilter is exact-substring for Latin text; a transliteration spelled differently from the stored one (for example `Selaam` against stored `Selam`) is only found if the other query words reach the row. Ethiopic variants are covered.
- Fallback results are capped at 60 candidates per request and 50 results; a very common single word returns an arbitrary bounded subset (ranked correctly within it).
- Word matching is prefix-based, not morphological; Amharic words with long prefixes (for example `በእግዚአብሔር`) do not match the bare stem.
- Excerpts and highlights depend on stored punctuation; they never reflow text. The CSS Custom Highlight API is needed for in-viewer highlighting (current Chromium/Safari/Firefox); older browsers still scroll nothing and show the results-card highlight.
- The reader page does not highlight the matched verse words, only scrolls to the verse via the existing `#verse-N` hash.
- Ge'ez and Oromo lyrics are searched and excerpted when stored and public; there is no Latin-to-Ge'ez transliteration.

## 7. Selective commit dependency report

**Read before committing.** Commit `9e86607` ("fix(bible): improve verified English and Amharic book names") was made while this work was in progress and already contains my in-progress `src/lib/bible/bibleSearch.ts`:
1. It imports `../search/textMatch`, which is **untracked**, so `HEAD` does not build until `src/lib/search/textMatch.ts` is committed.
2. It contains the sentence-guard line with the value `>= 99` (a temporary mutation I used to prove the test fails without the guard), which disables the guard. The working tree has the correct `>= 3`; it is the single uncommitted change to that file. Commit it.

Suggested grouping (each group builds on the previous ones):
1. Bible search: `src/lib/search/textMatch.ts`, `src/components/search/HighlightedText.tsx`, `src/lib/search/types.ts`, `src/lib/search/sharedBibleSearch.ts`, `src/components/bible/BibleSearchBar.tsx`, plus the one-line `src/lib/bible/bibleSearch.ts` fix (`>= 99` back to `>= 3`).
2. `src/lib/search/mezmurLyricSearch.ts`, `lyricHighlight.ts`, `unifiedHymnSearch.ts`, `PublicMezmurLibrary.tsx`, `PublicMezmurDetail.tsx`, `HymnPractice.module.css`, `src/index.css` (Mezmur search: needs `textMatch.ts` and `HighlightedText.tsx`; `mezmurLyricSearch.ts` imports `src/lib/mezmur/mezmurLanguage.ts`, already tracked).
3. `backend/app/main.py` + `backend/tests/test_hymn_search_lyrics.py` (independent; separate deployment).
4. Tests and scripts: `scripts/test-lyric-verse-search*.{ts,mjs}`, `package.json` (shared with other uncommitted work: stage that hunk only).
5. Docs and the SQL proposal.

Files that also contain other uncommitted work and need hunk-level staging: `package.json`, `src/pages/PublicMezmurLibrary.tsx`, `src/index.css`. `PublicMezmurLibrary.tsx` and `BibleSearchBar.tsx` rely on the new CSS/components above; do not commit them without group 1/2 files.
