# Mobile UX findings

## Fixed

### P1 — Signed-out Account entry was absent from the mobile drawer

The existing `/account` route correctly provided the sign-in entry state, but the signed-out drawer only showed Sign in and Create account. This made the requested Account destination undiscoverable. The drawer now always includes Account; staff-only Admin remains conditional.

### P2 — Lazy route feedback used undefined design tokens

`PageLoadingFallback` referenced token names not defined by the active design system. It now uses semantic border, gold, and muted-text tokens, centers the status, and avoids a visually abrupt near-zero-height transition.

### P2 — Background route fetching was over-eager

The homepage loaded primary route modules once its calendar event request ended. That work now occurs only through existing pointer/focus/menu intent prefetches.

## Validated strengths

- Mobile drawer is keyboard-focus trapped, Escape-closeable, and restores focus to its trigger.
- The Account destination, Home shell, Calendar shell, and compact dashboard controls stay within the viewport in exercised widths.
- English-to-Amharic UI switching updates document language and wraps Ethiopic text safely in the tested shell.
- Reduced-motion mode is honored by shared token overrides and compact dashboard expansion.

## Follow-up

- Test populated Calendar, Search Buddy, and account profile states in a connected test environment and WebKit before calling the entire app device-complete.
