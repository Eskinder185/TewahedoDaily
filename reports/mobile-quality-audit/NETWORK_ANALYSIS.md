# Network analysis

## Production baseline observed

The deployed homepage baseline at 390 × 844 recorded 95 requests and 688,889 browser-reported transferred bytes after `networkidle`, with five Supabase REST reads and two Storage image requests. See `PERFORMANCE_BASELINE.md` for method and caveats.

## Local changes

- Calendar-card consumers share a cache and in-flight request by civil day and requested limit.
- Explicit refreshes still retrieve fresh published cards.
- Home no longer performs unconditional route-module prefetching.
- PDF/DOCX parsers no longer reside in the initial generic vendor payload.

## Not changed

No Supabase query columns, RLS policies, API endpoints, hymn data, publication state, or cache headers were modified. The broad existing home calendar metadata reads need a separately benchmarked API/query reduction before changing their projections.
