# Search quality: Mezmur Library, Bible, Search Buddy (2026-11-12)

Branch `feat/search-quality`. All live probing used the public anon client or public pages (read-only). No SQL was run
against production and no data was changed. The one database change is a **proposal** (`docs/ai/proposals/`).

## 1. Observed problems: what was reproduced and the verified cause

| # | Report | Result | Verified cause / finding |
|---|---|---|---|
| 1 | Bible text queries show "unavailable" | **Not reproduced.** English and Amharic text queries returned verses on the live DB and live site. | Likely transient backend/timeouts; the client already falls back to local verse search. Left unchanged. |
| 2 | Ethiopic-numeral references fail | **Reproduced, fixed.** | `parseBibleReference` accepted ASCII digits only. New `ethiopicNumerals.ts`; the parser works on a search representation. |
| 3 | Small transliteration change makes a hymn vanish | **Reproduced, fixed.** 9 of 13 drifted-title queries missed. | Retrieval used strict `ilike`. New skeleton-based similar-spelling tier. A second cause: the title index read hit PostgREST's 1,000-row cap (2,550 published hymns), so it now pages. |
| 4 | Search Buddy missed a lyric the Library found | **Reproduced, fixed.** | Buddy never queried the lyric specialist, and the wrapper text ("find the hymn with the words…") was searched literally. |
| 5 | Duplicate representations of one hymn | **Partly reproduced, fixed.** | `/hymns/mezmur/x`, `/practice/mezmur/x` and lyric hits are the same hymn but had different dedupe keys. They now merge on slug and keep the excerpt. (The two links inside one card, title and "Open →", are by design.) |
| 6 | Teaching question: sourced answer below unrelated records | **Reproduced, improved.** | Hymn sections, synaxarium and artist records matched generic words. Question mode ranks library, article and guide sources first. Records need a title hit. |
| 7 | Hymn page showed an internal UUID error | **Not reproduced** on live. | The UI rendered raw `error.message`. A sanitizer now sits at the hymn page, Library, Search Buddy and voice. |

Other findings, not fixed:
- Live schema drift: `mezmur_public.has_stored_lyrics` and `get_public_mezmur_lyrics` are absent (repo migrations were not applied).
- `zemaris_with_counts` returns **401** for the anon role on the Library page (the zemari section fails silently). Needs a DB grant; **blocker: needs an owner decision.**
- Deployed `/api/hymns/search` returns nothing for exact titles; the client falls back to the public projection. `test:search-buddy-routing` fails against the deployed backend (also fails at the original commit).

## 2. Architecture
Typed and voice input already share one path (`MezmurVoiceSearch` feeds `onTranscript` into the same search functions).
- `src/lib/search/ethiopicNumerals.ts`: numeral and punctuation parsing (search representation only).
- `src/lib/search/translitSkeleton.ts`: documented, conservative skeleton rules (ch/ts/tz, k/q, w/v, silent h, vowels dropped).
- `src/lib/search/queryRequest.ts`: removes request wrappers; reports whether a lyric, title or scripture was asked for.
- `mezmurLyricSearch.ts`: strict tiers (title-exact, title-phrase, lyric-phrase, partial), then a **similar-spelling** tier only when no phrase/title match exists. Items carry the tier and a verified excerpt with highlight ranges.
- `searchSite.ts` / `searchCore.ts`: specialist source, canonical hymn dedupe, question-mode ranking, lyric requests lead with hymns.
- `bibleSearch.ts` / `resolveBibleQuery.ts`: exact verse destinations (`#verse-N`, edition when selectable); local resolution now carries a display `reference` (and `1 John` no longer becomes `1`).
- `src/lib/errors/publicError.ts`: technical text never reaches readers.
- UI: result cards show why a hymn matched (translated en/am) and highlight verified words.

## 3. Text-search language coverage (verified on live published content)
| Language / script | Mezmur titles | Mezmur lyrics | Bible |
|---|---|---|---|
| Amharic (Ethiopic) | yes | yes | yes (references, Ethiopic numerals, text) |
| English | titles/English titles | where `lyrics_english` exists | yes |
| Latin transliteration | yes + similar spelling | yes | n/a |
| Geʽez, Oromo | fields searched when present | fields searched when present; no eval queries | Not claimed (no imported edition was verified) |
| Tigrinya | no verified dedicated field/edition | not claimed | not claimed |

Interface language (en/am), query script, content language, edition, and voice language are separate settings.

## 4. Voice (what is and is not verified)
One shared implementation: start, permission, listen, stop, transcribe, review, search. It has a session counter against stale results, abort on cancel/unmount, a 15 s limit, a review notice, and the sanitized errors.
- English: browser SpeechRecognition where the browser provides it. **Not tested with real audio.**
- Amharic: server `POST /api/transcribe`. The route exists (an empty POST returns 422). **Accuracy is unverified; no real-audio fixtures exist.**
- Tigrinya, Oromo, Geʽez voice: not offered, not verified.
- `test:voice-search` fails on an unrelated home-page assertion (also at the original commit). `test:voice-whisper` passes (mocked, so it does not prove recognition accuracy).

## 5. Evaluation (92 queries from published content; expected slugs recorded before tuning; every 5th query held out)
Hymn results only. "found" means the expected hymn appears in the top 20.

| System | Before: top1 / found | After: top1 / found | Held-out after: top1 / found |
|---|---|---|---|
| Mezmur Library specialist | 72 / 78 | 86 / **92** | 17 / 18 |
| Search Buddy | 44 / 51 | 87 / **92** | 17 / 18 |
| Title catalog (Fuse; not lyric-aware by design) | 52 / 54 | unchanged | |

By kind, specialist after: spelling drift 13/13, lyric requests 8/8, transliterated lyrics 18/18, Amharic lyrics 14/14, titles 34/34.
Latency (p50): specialist about 160 ms; Search Buddy about 1.2 s (the whole site is queried). Failures: 0.
Limits: the drift queries are synthetic spelling changes (some multi-edit); recall on real user typos may differ. Tuning happened on the same snapshot the set came from; the held-out split guards against over-fitting but is small (18).
Files: `scripts/search-eval/` (`build-queries.mjs`, `run.ts`, `results/*.json`).

## 6. Representative live journeys (Playwright, 375/390/430 px, no overflow)
- Library `?q=igziaber siraw` finds the Egziabher Siraw hymn(s).
- Library `?q=find the hymn with the words aba abune teklehaymanot` lists matching hymns.
- Bible `ዮሐንስ ፫፥፲፮` shows John 3:16, and "Open in Bible" lands on `/bible/john/3#verse-16`.
- Search Buddy lyric request: the first card is "Mezmur · Lyric match" with matched words highlighted; the mic button has an accessible name.

## 7. Remaining gaps
- "how do I pray the Psalms": two synaxarium records still appear near the top (their titles contain "pray").
- No Tigrinya/Oromo/Geʽez eval queries; no real-audio voice fixtures; no device matrix for voice.
- `zemaris_with_counts` 401; schema drift; deployed `/api/hymns/search` returns empty for exact titles.
- Unrelated failing checks not touched: `test:search-regression` (stale source grep), `test:shared-bible-search` ("Open John 3:16" normalization expectation), `test:voice-search`, lint error in `bibleStudyService.ts`.

## 8. Status
`tsc -b`, `vite build`, ESLint on the touched areas all pass. New tests: `test:ethiopic-references`, `test:search-skeleton-request` (skeleton, request, dedupe, question ranking), `test:public-error`, `test:ethiopic-references:live`, `test:search-journeys` (needs `npm run dev`). Updated: `test:bible-search` (verse route now has the anchor). Passing: `test:bible-search`, `test:bible-page-chat-refs`, `test:amharic-bible-routing`, `test:lyric-verse-search`, `test:search-site`, `test:unified-search`, `test:search-catalog-status`.
**Migration:** not applied. `docs/ai/proposals/search-quality-ranked-mezmur-search.sql` (pg_trgm indexes + ranked `search_public_mezmur`) was applied twice (idempotent) to a throwaway PostgreSQL 17 and passed its assertions using synthetic rows: restricted lyrics, drafts and deleted rows never match. Not yet run against real data volume or the live schema.
**Deploy:** nothing deployed.

## 9. Rollback
All changes are app code on `feat/search-quality`: revert the PR (or `git revert` the commits listed in the PR). No database state changed; if the proposal is later applied, the drop statements are at the bottom of the SQL file.
