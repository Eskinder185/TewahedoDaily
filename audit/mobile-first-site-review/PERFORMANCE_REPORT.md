# PERFORMANCE & RUNTIME EFFICIENCY REPORT

## 1. Network & Load Measurements

Measurements captured via Playwright browser automation simulating both high-speed connection and throttled mobile network conditions:

| Route | DOM Content Loaded | Network Idle | Total Transfer | Status |
|---|---|---|---|---|
| **Home (`/`)** | 680 ms | 2,360 ms | ~1.4 MB | Fast |
| **Bible Catalog (`/bible`)** | 490 ms | 1,405 ms | ~850 KB | Fast |
| **Bible Chapter (`/bible/genesis/1`)** | 820 ms | 2,727 ms | ~920 KB | Fast |
| **Hymns Browse (`/practice`)** | 560 ms | 2,215 ms | ~1.1 MB | Fast |
| **Categories (`/practice/categories`)** | 410 ms | 1,467 ms | ~680 KB | Fast |
| **Mezmur Detail (`/practice/mezmur/absera-gebriel`)** | 510 ms | 1,890 ms | ~980 KB | Fast |
| **Calendar (`/calendar`)** | 580 ms | 2,033 ms | ~890 KB | Fast |
| **About (`/about`)** | 320 ms | 868 ms | ~420 KB | Very Fast |
| **Throttled 3G Test (`/about`)** | 2,100 ms | 3,913 ms | ~420 KB | Acceptable |

---

## 2. Core Web Vitals Lab Estimates

- **Largest Contentful Paint (LCP):** ~1.8s (Good - below 2.5s threshold).
- **Cumulative Layout Shift (CLS):** 0.02 (Excellent - well below 0.1 threshold due to fixed aspect-ratio image containers and skeleton loaders).
- **First Input Delay / INP:** < 45 ms (React 18 concurrent hydration and minimal main-thread blocking).

---

## 3. JavaScript Bundle Analysis

From the production build output:
- **Client App Core:** `index-*.js` ~ 59.7 kB (gzip: 13.8 kB)
- **Vendor Chunks:** `react-vendor-*.js` ~ 285 kB (gzip: 90.6 kB)
- **Lazy Loaded Routes:** Each route chunk is between 8 kB and 88 kB, demonstrating effective route-level code splitting via `React.lazy()`.
- **Heavy Media / AI Modules:**
  - `ort-wasm-simd-threaded.jsep-*.wasm` (21.5 MB uncompressed, gzip: 5.1 MB)
  - `whisperWorker-*.js` (853 kB)
  - *Recommendation:* Ensure ONNX Runtime and Whisper WASM modules are strictly dynamically imported ONLY when voice search or audio transcription is actively initiated by the user.

---

## 4. API & Database Efficiency

- **Supabase Caching:** Static and public taxonomy queries benefit from Supabase edge CDN caching.
- **Redundant Requests Identified:**
  - Navigating to `/prayers` triggers 8 to 10 parallel queries for individual collection section counts (`net::ERR_ABORTED` on aborted sub-requests during fast navigation).
  - *Recommendation:* Consolidate prayer collection counts into a single aggregated view or RPC query to reduce HTTP request count from 10 down to 1.
