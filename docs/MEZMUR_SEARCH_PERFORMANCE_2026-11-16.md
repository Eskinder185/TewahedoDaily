# Mezmur search performance — 2026-11-16

Environment: Node 22.18.0 on the same workstation, using the checked-in `reports/mezmur-quality-audit/PUBLIC_MEZMUR_SNAPSHOT.json` dataset (1,728 published records). Reproduce with `npx tsx scripts/benchmark-mezmur-search.ts`.

These are deterministic local payload/CPU measurements, not live Supabase timings. They exclude network latency, browser paint time, and transferred image bytes.

| Measurement | Before | After |
|---|---:|---:|
| Catalog/search requests at 500 rows per response | 4 | 1 ranked page request |
| Search response model | 801,486 bytes | 10,954 bytes |
| Exact Latin title ranking CPU | 660.1 ms | 0.09 ms over 1 server-filtered candidate |
| Exact Ethiopic title ranking CPU | 663.5 ms | 0.07 ms over 1 server-filtered candidate |
| Ethiopic lyric-fragment ranking CPU | 697.6 ms | 0.08 ms over 1 server-filtered candidate |

The “before” path models downloading and ranking the full public catalog in the browser. The “after” path models the new indexed RPC returning one 24-row ranked page; PostgreSQL execution time must be measured with `EXPLAIN (ANALYZE, BUFFERS)` after the migration is applied to a staging database.

Image-reference inventory in the same dataset: 1,447 image references, 1,354 unique references, and 93 repeated references. Search cards remain lazy-loaded, use responsive YouTube thumbnail `srcset`, and use the existing URL-resolution promise cache so repeated references are not re-resolved. No claim is made about actual image transfer bytes because no live CDN/browser transfer was measured.

The new database path:

- filters and ranks on the rights-filtered `mezmur_public` projection;
- ranks exact titles, title prefixes/partials, alternate titles, Zemari, category, occasion, lyrics, then keywords;
- returns a human-readable `match_field` and bounded lyric preview;
- pages with a total count and a maximum page size of 50;
- adds partial trigram indexes for published, non-deleted title, lyric, and metadata expressions plus relationship lookup indexes;
- uses a 30-second, 40-entry client cache and AbortSignal cancellation;
- falls back to the existing API/public search when the migration is not yet available.

Pagination correctness beyond the Data API’s common 1,000-row cap is covered with a 2,305-row regression fixture. Deep RPC pagination currently uses offset pagination to preserve page-number URLs and browser history; keyset pagination remains a future option if very deep result sets become common.
