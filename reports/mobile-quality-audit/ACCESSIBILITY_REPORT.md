# Accessibility and localization audit

## Scope and method

This review used local Chromium mobile emulation at 390 × 844 with keyboard and reduced-motion settings, source inspection, and existing Playwright coverage. It is not a claim of full WCAG conformance or real-device/Safari testing. The local sandbox blocked public Supabase requests (`net::ERR_NETWORK_ACCESS_DENIED`), so data-backed Calendar content could not be assessed after loading.

## Confirmed strengths

- The application has a visible-on-focus skip link targeting `#main`, and `main` is programmatically focusable.
- The mobile navigation drawer is a labelled modal dialog, traps Tab navigation, closes with Escape/backdrop, restores focus to its trigger, and makes background regions inert while open.
- Global `:focus-visible` styling, a 48 px mobile `--tap-min`, safe-area padding, and a reduced-motion override are present.
- Calendar reading and Mezmur disclosure controls expose `aria-expanded` and `aria-controls`; the new compact controls remain independently operable.
- The English/Amharic switch changes `html[lang]` from `en` to `am`, changes visible UI labels, and did not create horizontal overflow at 390 px in the local browser. Ethiopic language CSS selects Ethiopic-capable font fallbacks, increases line height, and permits safe wrapping.
- Local mobile smoke checks found no horizontal overflow on the loaded route shells at 390 px. The Calendar shell also had no overflow at 390 × 844.

## Findings

### P2 — Calendar notification help affordance is smaller than the project touch-target standard

At 390 px the Calendar header renders the notification-help `<summary>` as a bare `?`. It was visibly much smaller than the 48 px mobile target applied to buttons. It has an accessible label, but it is harder to use by touch.

**Safe fix:** give the help summary a minimum 44–48 px square inline-flex target and preserve its existing label/details semantics.

### P2 — Data-backed mobile states require an online test environment

The local Calendar rendered its loading state after the network sandbox denied all backing requests. This is expected in this environment, but it means Bible-reading cards, Synaxarium content, failure recovery, and language-specific live content still need an online Chromium/WebKit pass before asserting end-to-end accessibility.

## Evidence captured

- `mobile-calendar-baseline.png` and `mobile-home-drawer-baseline.png` were already present in this audit directory.
- This audit additionally captured `mobile-quality-audit-calendar-mobile.png` and `mobile-quality-audit-home-amharic-mobile.png` at repository root `reports/`; these should be moved into this directory by the coordinating report step if retained.
- The language toggle produced `html[lang="am"]`, Amharic control labels, and zero measured horizontal overflow at 390 px.
- Calendar navigation was exercised from `2026-10-20` to `2026-10-21` and then through browser Back. The URL and the selected-date heading both correctly returned to October 20 in this local check.
- Keyboard testing at 390 px confirmed that opening the mobile drawer moves focus to `Close menu`, Escape closes it, and focus returns to `Open menu`.

## Retest checklist after the routing fix

1. Select three consecutive dates, then use Back and Forward; verify heading, query string, selected detail, and Bible reader return link agree each time.
2. Keyboard-test skip link, drawer focus loop, Escape close, Calendar date controls, language toggle, and compact show-all controls.
3. Repeat at 320, 375, 390, 430, and 200% text zoom in both English and Amharic.
4. Run an online Chromium and WebKit pass for populated Calendar readings and failure states.
