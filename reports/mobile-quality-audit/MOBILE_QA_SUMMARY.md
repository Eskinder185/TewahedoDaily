# Mobile QA summary — 2026-10-27

## Scope

Local production build plus deployed-production baseline observation. The review used Chromium emulation, not physical devices. No authenticated account was used and no production data was changed.

## Tested

- Public mobile shell at 320, 360, 375, 390, 412, and 430 px widths.
- Account entry through the signed-out mobile drawer.
- Calendar compact-reading harness at 375, 390, and 1280 px (from the existing focused regression test).
- Existing mobile smoke route suite and local Calendar back-navigation check.
- English and Amharic mobile shell rendering; reduced-motion setting.

## Confirmed fixes

1. Signed-out mobile navigation now includes **Account**, leading to the existing account/sign-in entry page.
2. Route loading feedback uses defined theme tokens and reserves a compact viewport-safe loading area.
3. Calendar-card requests now share an in-flight/day cache across Calendar consumers.
4. Home no longer prefetches all primary route modules merely after its event request completes.
5. PDF and DOCX parser libraries are isolated from the generic initial vendor chunk.

## Results

- `npm run test:mobile-shell` passed at all six phone widths.
- No horizontal overflow occurred in the Home or Account shells in those checks.
- Compact Calendar reading/Mezmur controls retain independent expansion state, language mode, and reduced-motion behavior in their focused test harness.
- Production baseline had zero browser console errors in the unauthenticated homepage audit.

## Limitations

- No real-device, Safari/WebKit, or authenticated-user test was available.
- Lighthouse is not installed, so no Lighthouse score is claimed.
- Local sandbox networking prevented live Supabase-backed populated-state testing; this is not reported as a production failure.
