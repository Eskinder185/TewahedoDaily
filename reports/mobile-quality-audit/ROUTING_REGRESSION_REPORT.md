# Routing regression report

## Checked

- Signed-out mobile drawer → Account route at 320, 360, 375, 390, 412, and 430 px.
- Account opens at `/account` and retains the existing auth-entry behavior.
- Route prefetch supports canonical `/hymns`, Account, and Library routes without using ambiguous legacy paths.
- Existing public hymn route assertions remain in `scripts/test-mobile-account-hymns-navigation.mjs`.
- Calendar compact reader links retain selected date and language mode in the focused dashboard regression test.

## Result

No URL, redirect, or data mapping was changed. The Account route was made reachable in the signed-out drawer; canonical hymn/detail links remain untouched.

## Browser history

A local Calendar navigation check selected consecutive dates and used browser Back; the URL and selected date heading returned together. No speculative Calendar history code change was retained.
