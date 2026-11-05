# Mezmur version review

## Source and outputs

Run `npm run audit:mezmur-versions` from the repository root. The read-only detector uses `reports/mezmur-lyric-cleanup/mezmur_cleaned_classified.csv`, the stable 2,531-row retained export. It identifies rows by `import_id`: only 757 rows have a nonempty `mezmur_id`, and the latter is not a safe family key. The source CSV is never rewritten.

Outputs are in `artifacts/mezmur-version-audit/<first 12 characters of source SHA-256>/`:

- `source-manifest.json`: source hash, all 2,531 import IDs/slugs and SHA-256 hashes for each original lyric field.
- `batch-001.json` through `batch-013.json`: resumable 200-left-row batches with proposed pairs, evidence, and verbatim source rows for offline review. A matching source hash, detector revision and row range cause an existing batch to be reused.
- `audit-index.json`: all proposal summaries and proposed families without copied lyric text.
- `audit-report.md`: counts and limitations for the specific source snapshot.

Run `npm run verify:mezmur-version-audit` to re-hash every original lyric field and compare every copied proposal row to the source. The current run compared 1,056 candidate pairs, produced 509 proposals and 121 **proposed** families. The 509 proposals include 88 exact text duplicates, one whitespace-normalized duplicate, eight spelling variants, two alternate stanza structures, 21 different renditions, four extended/shortened versions, 166 possible relations and 219 distinct hymns with a title connection.

## Detection rules

`src/lib/mezmur/versionDetection.ts` reuses `src/lib/language` for Unicode-safe title and lyric folding and the existing Ethiopic transliterator for low-risk Latin/Amharic title candidate blocking. The engine blocks candidates by matching titles, exact/whitespace-normalized lyric text and rare lyric lines. It compares original text before normalized text. Line comparison uses corpus frequency, stanza overlap, longer-body coverage, shorter-body containment, order and repetition counts. A common refrain or one shared verse cannot establish a family. Cross-language lyric text is never declared identical solely from similar titles. Distinct wording remains in each original row.

These are deterministic suggestions, not automatic merges or theological classifications. Exact hashes describe original text equality in a selected lyric field. A very short exact text can still be reported as an exact text match, but it is excluded from family grouping until there is enough body evidence. The detector compares a row's first populated lyric field in the order Amharic, Ge'ez, English, transliteration, Oromo; other original fields are preserved and hashed in the manifest. Missing, restricted or mislabeled source lyrics can limit similarity findings. Near matches without a rare shared line or title block can be missed; this is a deliberate precision and performance tradeoff.

## CMS review

An editor, admin or super admin can open `/admin/hymns/mezmur/versions` and select one generated `batch-*.json` file. The page shows original IDs, titles, classifications, singer, rights status, side-by-side source lyrics, line-level differences, proposed relationship, confidence and evidence. Confirm, reject and defer decisions can include a corrected relationship and note.

Decisions are scoped by staff profile ID and source hash in browser storage. Export the JSON before switching browser or device; no Supabase table or shared approval state is written. This local review state is not an authorization boundary for publication. Deletion, merging, and public promotion are unavailable from this page.

## Public confirmed versions

`src/data/confirmedMezmurFamilies.ts` is intentionally empty. The read-only adapter collapses only entries in that separately approved manifest in Mezmur search results, keeps the highest-ranked original card, and exposes direct links to other still-published originals on the detail page. Offline decisions and proposed families never enter the public adapter automatically. Populating the manifest requires a separate editorial/rights approval and code review; no such promotion occurred in this task.

## Checks

Run `npm run test:mezmur-versions`, `npm run verify:mezmur-version-audit`, `npx tsc --noEmit -p tsconfig.app.json`, targeted ESLint, and `npm run build`. The detector test covers exact text, spacing, Ethiopic spelling, repeated/reordered lines, extension, changed wording, mixed-language title links, common refrains, title collisions and the empty public manifest.
