# Night mode accessibility audit

## Scope

This audit covers the shared Day/Night theme (`html[data-theme]`) and representative public routes: Home, Calendar, Bible, Church Library, and Prayers. Reader-specific palettes remain component-scoped and are not replaced by the global theme.

## Findings and fixes

- Several older CSS modules referenced compatibility variables such as `--color-surface`, `--color-surface-hover`, and `--color-border-subtle` that were not defined by the token system. Their fallbacks forced white cards and light text in Night mode.
- The public Church Library was the most visible instance: its search field and filter controls rendered with light fallback backgrounds, while muted text remained low contrast.
- Admin review cards and calendar review panels contained hardcoded light-only surfaces and text colors.
- Shared semantic aliases were added to `src/styles/tokens.css`, with values derived from the active theme. Status colors also have Night-mode variants.
- Public Church Library, admin review summary, calendar review, and review-tag styles now consume semantic tokens. No content, Supabase, reader, or publication behavior was changed.

## Verification

`npm run build` passed (TypeScript and Vite production build).

`npm run test:night-mode` passed. The probe starts a local Vite server and checks Day and Night at 390px, 768px, and 1440px across five routes. It verifies the theme attribute, rejects same-color text/background pairs, records the minimum computed foreground/background ratio observed by the probe, and captures screenshots.

Screenshots are in `audit/screenshots-night-mode/after/` (`day-*` and `night-*` for mobile, tablet, and desktop).

The probe's ratio is diagnostic rather than a full WCAG conformance proof: image backgrounds, alpha compositing, text size, and inherited backgrounds require human review. The captured representative screens show readable controls and text in both themes.

## Remaining review

Dynamic authenticated admin pages and data-dependent reader content should be checked with a signed-in session at the same three widths. Reader themes intentionally retain their own Day/Sepia/Night palettes. No production database or deployment action was performed.
