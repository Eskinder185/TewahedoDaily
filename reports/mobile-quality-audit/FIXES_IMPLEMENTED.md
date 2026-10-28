# Fixes implemented

| Area | Change | Why |
| --- | --- | --- |
| Mobile account navigation | Always render Account in the drawer | Lets signed-out users reach the existing account entry page. |
| Lazy loading state | Use active semantic color tokens and a stable compact container | Improves loading-state legibility and reduces visual jump. |
| Route prefetch | Add canonical Hymns/Account/Library mappings; remove home automatic prefetch | Keeps intent prefetch while avoiding eager route downloads. |
| Calendar card data | Shared five-minute cache plus in-flight deduplication; force refresh preserved | Avoids duplicate public card fetches without stale admin-visible refresh behavior. |
| Build chunks | Split `pdfjs-dist` and `mammoth` into document-only chunks | Removes document parsers from the generic initial vendor chunk. |
| Regression coverage | Added `test:mobile-shell` Playwright command | Protects drawer Account access and phone-width overflow. |

No production data, Supabase schema, RLS, content, URLs, or authentication behavior was changed.
