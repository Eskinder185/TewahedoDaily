# Performance after local optimizations — 2026-10-27

## Method

This is a local production-build artifact comparison, not a field Web Vitals measurement. Lighthouse was unavailable and no LCP/INP/CLS score is claimed.

## Build impact

| Artifact | Baseline build | Updated build |
| --- | ---: | ---: |
| Generic vendor (gzip) | 279.44 KB | 56.09 KB |
| Generic vendor (raw) | 953.51 KB | 215.01 KB |
| New lazy PDF parser chunk (gzip) | bundled in generic vendor | 129.50 KB |
| New lazy DOCX parser chunk (gzip) | bundled in generic vendor | 94.97 KB |

The parsers are now requested only by document-related routes rather than every public first load. The very large PDF worker and optional Whisper assets remain lazy.

## Request behavior improved

- The Calendar public-card loader now deduplicates simultaneous consumers and keeps a five-minute, per-civil-day cache.
- A visibility refresh deliberately bypasses that cache, preserving existing freshness behavior.
- Home no longer automatically starts all primary route imports after its event request; intent prefetch remains on pointer/focus and opening the navigation drawer.

## Remaining measurement work

Run a pinned Lighthouse version in CI or an approved connected environment with consistent mobile CPU/network throttling. Compare production before/after with cache disabled and report only those measured LCP, CLS, and INP values.
