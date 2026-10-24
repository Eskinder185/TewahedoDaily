# Interactive hymn lyrics

The public hymn detail route keeps the existing practice player, YouTube/audio behavior,
favorites, and browse taxonomy. `HymnLyricsExperience` replaces the old reader in the
player's primary reading column.

## Content flow

`mezmur_data_import` remains the active source of truth. The migration
`20261023120000_hymn_interactive_lyrics.sql` adds structured lyrics, source/rights fields,
an external source URL, a verification timestamp, and editorially verified related content.
Rights status remains available for provenance and attribution, but it does not gate Copy,
Share, PDF, Slides, or Live. Every hymn with locally displayed lyrics can use all five tools.
Share sends the canonical page title and URL rather than embedding the lyrics.

Structured lyrics are an array of objects with `kind`, `label`, and either `lines` or
`text`. Existing plain-text lyrics remain backward compatible: blank-line blocks become
ordered verses, while explicit Verse/Chorus/Refrain/Bridge, ቁጥር, አዝማች, and መልስ labels
are preserved. No missing translation or transliteration is generated.

`related_content` accepts only reviewed records such as:

```json
{
  "target_type": "prayer",
  "label": "Evening prayer",
  "href": "/pray/evening",
  "verified": true
}
```

The public UI rejects unverified entries, unknown target types, and non-local paths.

## Exports and presentation

- Copy preserves line breaks and can append source attribution.
- Share uses Web Share and falls back to copying the canonical URL.
- PDF opens a UTF-8, print-optimized A4 document using Ethiopic-aware font fallbacks;
  the browser's Print dialog provides Save as PDF.
- Slides provide configurable 2–8 line segmentation and a landscape PDF fallback.
- Live mode supports arrow navigation, Escape, font scaling, dark/parchment themes,
  fullscreen, touch-sized controls, and screen-reader labels.

PPTX is intentionally not emitted: the repository has no presentation-file dependency,
and the print/PDF deck preserves Amharic text without adding a second export framework.

## Verification

Run:

```text
npm run test:hymn-lyrics
npm run test:hymn-browse
npm run test:locale-unify
npm run test:content-relations
npm run build
npm run capture:hymn-lyrics
```

The screenshot smoke test intercepts the Supabase REST call with a small owned QA fixture;
it does not publish or copy third-party lyrics. It verifies 1440px and 390×844 layouts,
horizontal overflow, Copy, Share fallback, printable Amharic output, and Live arrow/Escape
navigation. Artifacts are written to `artifacts/hymn-lyrics/`.
