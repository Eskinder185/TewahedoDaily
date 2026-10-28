# Mezmur taxonomy & browsing improvements

**Scope:** code-side browsing, alias and search changes. Nothing was written to Supabase, no canonical taxonomy record was added, renamed or removed, and nothing was deployed.

**Evidence used for "live" state:** the snapshot of `public.mezmur_sections_import` in `mezmur-research/data/existing_tewahedodaily_snapshot.json` (56 sections, 2026-10-24), plus the migrations. Neither this session's workspace nor your computer's sandbox can reach your Supabase project (its network allowlist blocks it). Run `supabase/VERIFY_MEZMUR_TAXONOMY_SLUGS_READ_ONLY.sql` (SELECT only) to confirm against the live database.

## 1. Browsing improvements implemented

1. **Every canonical category and occasion is now discoverable.** New code module: `src/lib/publicContent/browseTaxonomy.ts`.
   - **Missing sections:** where the live table has no section for a canonical category or occasion, a code-defined section is added to an *existing* group.
   - **Only when needed:** it appears only if the group has no live section for the same entity, and only when it contains published Mezmurs.
   - **Database rows win:** as soon as a database row exists, the code section steps aside.
   - The same definitions answer the section page, so the URL `/hymns/browse/<group>/<section>` works.
2. **Group counts include the requested entries.**
   - `jesus-christ` now includes Salvation.
   - `angels-saints` now includes John the Baptist and Annual Saint Feast.
   - `repentance-fasting` now includes Tsome Nebiyat and Tsome Hawariat.
3. **Legacy slugs count.** Link rows written with older spellings now resolve to the live identifier:

   | Legacy spelling | Live identifier |
   |---|---|
   | `new-year-enkutatash` | `new-year` |
   | `funeral-memorial` | `funeral` |
   | `general-anytime` | `general` |
   | `kidus-estifanos` | `kidus-estifanos-saint-stephen` |
   | `qedus-giorgis` | `kidus-giorgis` |
   | `lent` | `abiy-tsom` |

4. **Manual sections show their linked songs.** Sections whose `source_entity_type` is `manual` previously showed only hand-picked links. They now also show Mezmurs linked to the entity named in `source_entity_slug`:
   - `general-mezmur` → `general`
   - `repentance-holy-week` → `holy-week`
   - `general-fasting` → `lent`
   - `saint-george` → `qedus-giorgis`
   - `holidays-annunciation` → `annunciation`

   Review this behaviour change: "General / Anytime" will list every song linked to General.
5. **CSV importer bug fixed** (`mezmurCsvImport.ts`). The importer slugified labels, so "New Year / Enkutatash" became `new-year-enkutatash`, "Funeral / Memorial" became `funeral-memorial`, and "General / Anytime" became `general-anytime`. The database RPC rejects those slugs, and the importer silently swallowed the error. It now writes the identifiers that exist.
6. **Search.**
   - **Spellings of "Saint":** Kidus, Qidus, Qeddus, Kudus and Kidist all read as "Saint", so "Qidus Mikael" finds Kidus Michael.
   - **Saint and archangel titles added:**
     - ሊቀ ሰማዕታት / "chief of martyrs" (George)
     - መልአከ ብሥራት / ገብርኤል ዜናዊ (Gabriel)
     - ፈታሔ ማኅፀን (Raphael)
     - "first martyr" (Stephen)
     - ማኅሌታይ (Yared; contextual only)
   - **Feast names added:** "Bisrate Gabriel" / ብሥራተ ገብርኤል (search only).
   - **Exact names only:** search and filter resolution use exact names, titles and transliterations only. Contextual clues (ጽዮን, ንዒ, ጻድቅ, ዮሐንስ alone, "glory", "sin") no longer resolve to a category.
   - **Feast names that are everyday words** (ጥምቀት, ትንሣኤ) are exact search terms. As lyric evidence they still need context.
7. **Dictionary corrections.**
   - Saint Stephen now uses the live slug `kidus-estifanos-saint-stephen`.
   - Each entry's `browseSections` reflects the live snapshot plus the code sections.
   - Overlapping matches are resolved deterministically: longest span first, then exact before ambiguous.

## 2. Updated browse-group mappings

How each requested item is reached. "Live" means a row in `mezmur_sections_import`; "Code" means a fallback section in `browseTaxonomy.ts`, which `supabase/PROPOSED_HYMN_BROWSE_CANONICAL_SECTIONS.sql` would turn into a row.

| Entry | Group | Section slug | Source |
|---|---|---|---|
| Holy Spirit | praise-general | holy-spirit | Live (already existed) |
| Prayer | praise-general | prayer | Live (already existed) |
| Kidus Yared | angels-saints | saint-yared | Live (already existed) |
| Abune Gebre Menfes Kidus | angels-saints | abune-gebre-menfes-kidus | Live (already existed) |
| **Salvation** | jesus-christ | christ-salvation | **Code** |
| **Yohannes Metmek / John the Baptist** | angels-saints | saint-john-the-baptist | **Code** |
| **Prophets** (found missing by the new test) | angels-saints | prophets | **Code** |
| **Tsome Nebiyat** | repentance-fasting | tsome-nebiyat | **Code** |
| **Tsome Hawariat** | repentance-fasting | tsome-hawariat | **Code** |
| **Annual Saint Feast** | angels-saints | annual-saint-feasts | **Code** |
| **Erget** (no live section) | holidays-feasts | holidays-erget | **Code** |
| **Baptism** (no live section) | sacraments-church-life | baptism | **Code** |
| **Funeral / Memorial** (no live section) | sacraments-church-life | funeral | **Code** |
| Abiy Tsom, Tsome Nineveh | repentance-fasting | general-fasting | Live (manual `lent`, now resolved) |
| Holy Week | holidays-feasts, repentance-fasting | holidays-holy-week, repentance-holy-week | Live (manual, now resolved) |
| General / General / Anytime | praise-general | general-mezmur | Live (manual `general`, now resolved) |

The audit's original Priority 1 list assumed six categories were missing. The live snapshot shows that four of them (Holy Spirit, Prayer, Kidus Yared, Abune Gebre Menfes Kidus) already had sections. The real gaps were Salvation, John the Baptist and Prophets, plus five occasions.

## 3. Canonical taxonomy verification

| Identifier | What the repo shows | Status |
|---|---|---|
| `abune-gebre-menfes-kidus` | Live section `abune-gebre-menfes-kidus` has source category `abune-gebre-menfes-kidus` | Exists as a section source; category row assumed, not confirmed |
| `yohannes-metmek-john-the-baptist` | No live section, and no migration creates a category with this slug | **Unconfirmed — may not exist.** Links to it would be rejected until a category row exists |
| `new-year` | Seeded in `mezmur_occasions`; live section `holidays-new-year` uses it | Exists. Older imports wrote `new-year-enkutatash`, which is now treated as equivalent |
| `funeral` | Seeded in the `mezmur_occasions` browse migration; no live section | Exists (seeded). `funeral-memorial` is now treated as equivalent |
| `salvation` | No migration creates it | **Unconfirmed — may not exist** |
| `kidus-estifanos-saint-stephen` | Live section source (the dictionary previously said `kidus-estifanos`) | Exists; dictionary corrected |

`VERIFY_MEZMUR_TAXONOMY_SLUGS_READ_ONLY.sql` checks all 25 + 24 identifiers and lists link rows that use slugs with no record.

## 4. Browse-only shortcuts

Recorded in `BROWSE_SHORTCUTS`. None is, or becomes, a canonical record.

| Value | Classified as | Maps to |
|---|---|---|
| repentance | Existing theological category (duplicate occasion row) | Repentance |
| praise | Existing theological category (duplicate occasion row) | Praise / Worship |
| bisrate-gabriel | Browse-only shortcut (proposed canonical occasion) | Kidus Gabriel, Virgin Mary |
| general-fasting | Browse-only shortcut | Abiy Tsom, Tsome Nineveh, Tsome Nebiyat, Tsome Hawariat |
| wednesday-friday | Browse-only shortcut | — (weekly fast) |
| marian-feasts | Browse-only shortcut | Filseta, Kidane Mihret, Lideta Maryam |
| church-worship | Browse-only shortcut | Communion |
| short-hymns | Form or audience filter | — |
| sunday-school | Form or audience filter | — |
| children-youth | Form or audience filter | — |
| holiday-wereb | Form or audience filter | — |

None of the 11 is a canonical *occasion* slug, so none duplicates the 24 occasions.

## 5. Proposed new groupings (not applied)

| Proposed group | Would contain | Notes |
|---|---|---|
| Holy Trinity & Holy Spirit | holy-trinity, holy-spirit (currently in praise-general), Pentecost | Clearer theological home; no new records needed |
| Church & Ethiopia | Communion, church-worship shortcut, hymns about ቤተክርስቲያን / ኢትዮጵያ / ተዋሕዶ | Theme often left unclassified today |
| Sunday / Sabbath | hymns about ሰንበት | Needs a new theme value; currently General or review |
| Marian seasons | Filseta, Kidane Mihret, Lideta Maryam, Bisrate Gabriel, Zemene Tsige | Extends the virgin-mary group |
| Saints & martyrs | martyrs, saints, apostles, named saints (Giorgis, Stephen, Arsema, Kirkos) | Could split the large angels-saints group into Angels / Saints & Martyrs |

## 6. Suggested new taxonomy entries (evaluated, not created)

| Candidate | Evidence | Recommendation |
|---|---|---|
| **Bisrate Gabriel** (occasion) | Live browse already uses `annunciation` in two sections; lyrics with ብሥራት / "ገብርኤል … አበሠራት" | **Add** as a canonical occasion. Currently a shortcut. |
| **Zemene Tsige** (season) | ማኅሌተ ጽጌ and flight-to-Egypt hymns (ስደትሽ, በግብፅ በረሀ) | **Add** as an occasion if seasonal browsing is wanted |
| **Kidist Arsema** (category) | Live section `saint-arsema` and category slug `kidist-arsema` already exist outside the 25 | **Promote** to canonical, or map formally under Martyrs (current behaviour) |
| **Kidus Kirkos & Iyeluta** (category) | Own hymns (ቂርቆስ, ኢየሉጣ) | **Keep under Martyrs** for now; too few songs for a category |

## 7. Tests

| Check | Result |
|---|---|
| `npm run test` | **Not available:** `package.json` has no `test` script, so the suites below were run individually |
| `tsc -p tsconfig.app.json --noEmit` (your repo) | Pass, 0 errors |
| `tsc -b` + `vite build` (production build, Linux copy of the repo) | Pass |
| ESLint on all 13 changed / new source and script files | Pass |
| `test:mezmur-aliases` (alias dictionary, browse discoverability, URLs, shortcuts, identifiers, search, no-mutation) | **193 passed, 0 failed** |
| `test:hymn-browse-sections` (new integration test: real `hymnBrowse.ts` against a mock Supabase REST API with the 56 live sections) | **21 passed, 0 failed** |
| test:hymn-browse, test:mezmur-visibility, test:mezmur-publication, test:mezmur-publication-duplicate-safety, test:mezmur-title-lyrics, test:hymn-trash | Pass |
| test-mezmur-classification (25 scenarios), test:mezmur-bulk, test:zemari-import, test:zemari-matching, test:search-site, test:hymn-lyrics | Pass |
| test:mezmur-language | **Fail — pre-existing, unrelated.** `isMezmurLanguageFilter('all')` returns `true`; the test expects `false`. The file is committed and was not touched. |
| test:public (`test-mezmur-import.mjs`) | **Fail — pre-existing, unrelated.** It reads `src/data/chants/amharic-chants.json`, which no longer exists at that path. |
| Desktop / mobile browsing in a browser | **Not run.** No browser could be downloaded on your computer, and the live site's data source is unreachable from both environments. The integration test covers the data the group and section pages render; the card components and CSS were not changed. |

### Requested checks

| Requested check | Covered by |
|---|---|
| 1. All 25 categories discoverable | 25 alias tests and the integration test |
| 2. All 24 occasions available | 24 alias tests |
| 3. Shortcuts create no duplicates | Shortcut tests (still 25 / 24 entries; no shortcut uses a canonical occasion slug) |
| 4. Saint names and aliases resolve | 34 search cases, plus the earlier name tests |
| 5. Existing URLs work | Every live section keeps its URL and source slug; group map is a strict superset of the original |
| 6. Desktop and mobile browsing | **Not verified in a browser** |
| 7. No lyrics or statuses modified | The classifier does not mutate input; the proposed SQL only inserts into `mezmur_sections_import` (enforced by test); the integration test data is unchanged |

## 8. Files

| File | Change |
|---|---|
| `src/lib/publicContent/browseTaxonomy.ts` | **New:** group map and candidate-slug logic (moved unchanged from hymnBrowse.ts, then extended), legacy slug equivalents, fallback sections, browse shortcuts, `taxonomyLinkSlug` |
| `src/lib/publicContent/hymnBrowse.ts` | Re-exports the moved functions (same public API); adds fallback sections to `getSectionsForCollection` / `getHymnSection`; counts legacy slugs |
| `src/lib/publicContent/hymnSectionArtFallbacks.ts` | Card art for the new sections, using existing images |
| `src/lib/publicContent/taxonomy.ts` | Search and filter resolution use exact aliases only |
| `src/lib/cms/mezmurCsvImport.ts` | Writes live identifiers for category and occasion links |
| `src/lib/mezmur/taxonomyAliases.ts` | Stephen slug, browse sections, titles, feast names, search-only labels kept beside ambiguous evidence |
| `src/lib/mezmur/aliasMatcher.ts` | Kidus / Qidus → "saint"; exact vs contextual flag; deterministic overlap tie-break |
| `scripts/test-mezmur-taxonomy-aliases.ts` | Browse, identifier, shortcut, search and no-mutation tests added |
| `scripts/test-hymn-browse-canonical-sections.ts` | **New** integration test |
| `scripts/audit-mezmur-data-quality.ts` | **New** read-only data-quality audit |
| `supabase/PROPOSED_HYMN_BROWSE_CANONICAL_SECTIONS.sql` | **New, not applied:** idempotent inserts into `mezmur_sections_import` only |
| `supabase/VERIFY_MEZMUR_TAXONOMY_SLUGS_READ_ONLY.sql` | **New:** SELECT-only verification |
| `package.json` | Scripts added: `test:hymn-browse-sections`, `audit:mezmur-data-quality` (plus `test:mezmur-aliases` and `classify:mezmur-aliases` from the previous round) |
| `reports/mezmur-taxonomy-browse/`, `reports/mezmur-data-quality/` | **New:** these reports and CSVs |
