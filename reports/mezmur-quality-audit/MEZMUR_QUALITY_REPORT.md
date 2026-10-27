# Mezmur quality audit

Generated: 2026-10-27T16:10:09.708Z

## Coverage

- Current public rows audited: **1728**
- Public rows with at least one exposed lyrics field: **1723**
- Public rows with a uniquely matching **historical** local import ID: **1152**
- Current private import-table, draft, taxonomy, occasion, and staff-only Zemari fields: **not read**. The public view intentionally does not expose them, and this audit did not bypass RLS.

The backup is [PUBLIC_MEZMUR_SNAPSHOT.json](PUBLIC_MEZMUR_SNAPSHOT.json); its SHA-256 and retrieval details are in [SNAPSHOT_MANIFEST.json](SNAPSHOT_MANIFEST.json). The public view does not expose current immutable `import_id` values, so report rows leave that field blank rather than guessing; `historical_import_id` is evidence from an older local snapshot only.

## Findings

| Check | Count | Interpretation |
| --- | ---: | --- |
| Confirmed exact duplicates | 26 | Same normalized title, lyrics, and YouTube recording only. |
| Possible duplicates / variants | 177 | Heuristic candidates; no merge or deletion is justified. |
| Duplicate normalized public slugs | 121 groups / 242 rows | Public route ambiguity candidates. |
| Public rows with no exposed lyrics | 5 | Publicly visible media/catalog stubs. |
| Public rows with no YouTube URL | 10 | Not necessarily incorrect; no video association is stored. |
| Public rows with no mezmur_id | 1145 | Must use identity-safe unique-slug fallback for visibility reporting. |
| Title/encoding anomalies | 0 | No title was auto-corrected. |
| Lyric formatting findings | 554 | Safe whitespace candidates and review-only anomalies are separated. |
| Encoding errors | 17 | Replacement/control characters; never reconstructed automatically. |
| Zemari attribution conflicts | 2 | Same recording associated with differing singer names. |
| Safe proposed changes | 0 | Only CR/LF, literal-newline, and trailing-whitespace normalizations. |

## Accuracy boundaries

This automated review does **not** assert theological correctness, Church approval, authorship, title correction, Zemari attribution, category/occasion correctness, or a recovered Geʽez/Amharic reading without an authoritative source. The public projection does not expose category and occasion relationships, and the audit therefore leaves their CSV review queue empty rather than inventing findings.

`/2/`, `/3/`, and similar markers are reported only as review items because they may be intentional repetition notation. No chorus, stanza, line, title, slug, video link, status, or relationship was changed.

## Recommended review order

1. Resolve entries in `ENCODING_ERRORS.csv` against an authoritative source.
2. Review `CONFIRMED_DUPLICATES.csv` and `POSSIBLE_DUPLICATES.csv`; preserve legitimate alternate recordings and language variants.
3. Verify shared-video singer conflicts in `ZEMARI_ATTRIBUTION_REVIEW.csv`.
4. Run a staff-authorized, read-only private-table audit before reviewing drafts, taxonomy, occasions, or full immutable `import_id` coverage.

