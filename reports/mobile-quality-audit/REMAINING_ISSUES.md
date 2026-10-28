# Remaining issues and recommended next steps

1. **Online data-backed QA:** Run the populated Calendar, hymn, Search Buddy, Church Library, and authenticated Account flows against a non-production test account in connected Chromium and WebKit.
2. **Comparable Core Web Vitals:** Add a pinned Lighthouse/CI workflow; no synthetic Lighthouse score is currently available.
3. **Calendar metadata payload:** Benchmark a smaller Home-specific projection before changing the existing public calendar catalog queries. Do not replace authoritative calendar data with incomplete client guesses.
4. **Real devices:** Verify iOS Safari keyboard/safe-area behavior and Android touch/scroll behavior on physical devices.
5. **External video failure state:** Exercise unavailable/rate-limited YouTube playback in a connected environment.

These are validation or measured-optimization follow-ups, not evidence of data integrity or privacy defects.
