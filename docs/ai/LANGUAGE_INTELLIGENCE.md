# Multilingual language intelligence

The search-only module is `src/lib/language/`. It uses the existing TypeScript text matcher, canonical Bible catalog, and reviewed calendar aliases. Stored lyrics, verses, titles and spellings remain unchanged.

## API

```ts
import {
  normalizeForSearch, normalizedSpans, identifyEntity,
  recognizeEntities, entitySearchVariants, matchContent,
} from '../src/lib/language/index.ts'

normalizeForSearch('ሠላም፡ ለእናንተ') // 'ሰላም ለእናንተ'
normalizeForSearch('ሠላም', { foldEthiopicVariants: false }) // 'ሠላም'
identifyEntity('Mikael') // canonical `archangel:michael`, confidence and method
identifyEntity('mikaelx', { fuzzy: true }) // single-edit Latin suggestion
recognizeEntities('ሚካኤል እና ገብርኤል') // mentions with original UTF-16 ranges
entitySearchVariants('Timket') // bounded, source-backed query alternatives
matchContent(verseOrLyric, query) // word-aligned match and original text ranges
```

`identifyEntity` resolves a complete name. Tied meanings carry `ambiguous: true`; consumers should show choices and must not silently classify or navigate. Fuzzy matching is opt-in and never expands a search automatically. `recognizeEntities` finds mentions only. A saint mentioned in a lyric is not evidence that the whole hymn belongs to that saint. Use the separate Mezmur taxonomy/editorial workflow for classification.

`entities.ts` carries stable typed IDs, English/Amharic/Ge'ez display names where the source has them, aliases, and a source path per entry. Bible books are derived from `canonAliases.ts`; the selected saints, archangels and feasts come from `entityAliases.ts`. Place and terminology entries come from existing calendar knowledge. We deliberately separate Mary, Filseta and Theotokos, and separate the Meskel feast from the cross as a concept. The Amharic word `መስቀል` is therefore ambiguous and has no automatic alias expansion. Add new entries only with a repository or editorial source and a distinction test.

## Search paths

- Mezmur uses the existing `/api/hymns/search` order and published `mezmur_public` projection. For a complete, unambiguous entity query, the fallback adds one bounded, filtered alias request (at most three requests, 60 candidates per request). API results retain their order; additional alias hits follow. Titles, keywords, the five public lyric fields, stored English translations and stored transliterations are searched. Rights-restricted lyric fields remain null in the public projection.
- Bible verse text still uses the indexed `bible_verses` query with at most 120 candidates, then `matchContent` verifies each verse and returns original offsets. Book/chapter/verse routing is unchanged. English and Amharic editions remain separate.
- `matchText` keeps a 16-word proximity window but now scans its hits with a sliding window. The shared React highlighter and lyric CSS Highlight API use original string offsets without rewriting the displayed text.

## Verification and limits

Run `npm run test:language-intelligence`, `npx tsx scripts/test-lyric-verse-search.ts`, and `npx tsc --noEmit -p tsconfig.app.json`. The language test compares the previous and current proximity-window algorithms on a 1,602-word lyric-shaped sample and prints both times. On the local verification run: **533.0 ms before, 3.8 ms now**. These are process timings, not a browser or production latency guarantee.

The dictionary is deliberately small and source-backed. It does not infer unrestricted transliterations of arbitrary Amharic lyrics; transliteration search uses stored transliteration fields or curated entity aliases. Unusual Ethiopic glyph variants, inflected or fused words, OCR errors, and unrelated names can require editorial aliases. The database candidate caps can omit a relevant result when many records match a broad term. Fuzzy matching only suggests long Latin entity names. No theological classification is inferred from mentions. Live Supabase search and backend API behavior were not verified because local service credentials were unavailable; the bounded query and ranking paths were checked with a fake public client.
