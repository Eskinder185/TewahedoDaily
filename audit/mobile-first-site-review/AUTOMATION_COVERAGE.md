# AUTOMATION TEST COVERAGE & AUDIT HARNESS

## 1. Test Harness Architecture

The audit test suite was executed using Playwright browser automation running headless Chromium against:
- Production: `https://tewahedodaily.pages.dev`
- Local Development: `http://127.0.0.1:5173`

---

## 2. Tested Dimensions

- **Routes:** 21 unique routes (all public pages, dynamic detail routes, admin auth gates, and error pages).
- **Controls Audited:** 276 distinct actionable elements (buttons, inputs, links, tabs, radio toggles).
- **Viewports Covered:** 7 viewports ranging from 320px × 568px to 1440px × 900px.
- **Journeys Completed:** 9 user journeys (Journeys A through I).
- **Network Stress:** 3G network simulation testing latency and throughput resilience.

---

## 3. Evidence Artifacts Generated

- Screenshots: Saved to [`audit/mobile-first-site-review/screenshots/`](file:///c:/Users/eskew/github/TewahedoDaily/audit/mobile-first-site-review/screenshots/)
  - `home-mobile-390-en.png`
  - `hymns-compact-phone.png`
  - `bible-reader-iphone-390.png`
  - `calendar-desktop-1440.png`
  - `journey-b-1-categories.png`
  - `journey-b-2-kidus-michael.png`
  - `journey-b-3-lyrics.png`
  - `journey-f-2-results.png`
- Detailed CSV Inventories:
  - [`ROUTE_INVENTORY.csv`](file:///c:/Users/eskew/github/TewahedoDaily/audit/mobile-first-site-review/ROUTE_INVENTORY.csv)
  - [`INTERACTION_AUDIT.csv`](file:///c:/Users/eskew/github/TewahedoDaily/audit/mobile-first-site-review/INTERACTION_AUDIT.csv)
  - [`PRIORITIZED_IMPROVEMENTS.csv`](file:///c:/Users/eskew/github/TewahedoDaily/audit/mobile-first-site-review/PRIORITIZED_IMPROVEMENTS.csv)
