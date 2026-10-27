# TEWAHEDODAILY — SYSTEM UPGRADE INITIAL AUDIT REPORT
**Generated:** 2026-10-25T23:45:00-04:00  
**Repository:** `C:\Users\eskew\github\TewahedoDaily`  
**Target:** Full Spiritual Companion Upgrade (Mezmur, Bible, Calendar & Intelligence)

---

## 1. Executive Summary

This audit assesses the state of the TewahedoDaily platform across:
1. Mezmur audio playback, lyric parsing, and transliteration presentation.
2. Bible reading, multilingual parallel alignment, and personal study tools.
3. Ethiopian calendar mathematics (Gregorian ↔ Ethiopian bidirectional conversion).
4. Ecclesiastical Bahire Hasab calculation of movable feasts and fasts.
5. Daily faith context and intelligent Scripture/Mezmur recommendation engine.
6. Unified content relationships, CMS content health, and bilingual localization.

---

## 2. Existing Functional Features

- **App Architecture**: React 18, Vite, TypeScript, React Router 6, CSS Modules, and Supabase client integration.
- **Visual Identity**: Traditional Ethiopian Orthodox aesthetic in `src/styles/tokens.css` (ivory `#fbf9f4`, parchment `#f4eedb`, deep burgundy `#6a1a24`, imperial navy `#152238`, orthodox gold `#d4af37`).
- **Bible Reader Core**: `src/pages/BiblePage.tsx` and `src/lib/bible/` supports loading canonical and source books, chapters, and verses from Supabase with basic responsive typography and font scaling.
- **Hymn Lyrics Experience**: `src/components/hymns/HymnLyricsExperience.tsx` and `src/lib/hymns/lyrics.ts` has basic section heading detection (`CHORUS`, `VERSE`), reading modes, theme selection, and slide presentations.
- **Calendar Data Foundation**: `src/lib/ethiopianDate.ts` has a forward Gregorian-to-Ethiopian JDN calculation, and `src/lib/calendar/` maps fixed monthly commemorations and annual feast cards.
- **Prayer & Synaxarium**: `src/lib/prayers/` and `src/lib/synaxarium/` support daily commemorations, liturgical hours, and Synaxarium entries.
- **User Content Foundation**: `src/lib/userContent/guestStorage.ts` provides local storage for guest recent items and bookmarks.
- **Search Buddy**: Floating AI and structured search assistant routing between Bible, Hymns, and Calendar.

---

## 3. Deficiencies & Gaps Identified

### 3.1 Mezmur Experience
- **No True Three-Way Display**: Lacks unified toggling between Original Ethiopic, Latin Transliteration, and paired Side-by-Side (or stacked paired lines on mobile) synchronized by stanza.
- **No Persistent Hymn Player**: Mini-player was limited to chant practice sessions (`PracticeContinueDock`); navigating between pages drops hymn playback or restarts state.
- **No Playlist & Queue Engine**: Users cannot queue hymns, reorder playlists, or play in continuous sequence.
- **Repetition Notation Parsing**: Raw repetition markers (e.g., `(2×)`, `(4×)`, `፪`, `፬`) are not normalized for worship and sing-along display.

### 3.2 Bible Study Reader
- **Parallel Mode Is Unaligned**: Selecting `both` simply renders the entire English chapter text beneath the Amharic chapter rather than aligning verses side-by-side or in paired blocks.
- **Missing Study Features**: No bookmarking of individual verses, no multi-color highlights, no personal verse notes, and no study collection management.
- **No Cross-References**: Verses do not link to related Orthodox hymns, Church teachings, or liturgical readings.
- **No Verse Sharing/Copying**: Lacks one-click copy with canonical citation formatting.

### 3.3 Calendar Mathematics
- **No Reverse Conversion**: `ethiopianToGregorian` does not exist in `src/lib/ethiopianDate.ts`.
- **Missing Utility Functions**: `isEthiopianLeapYear`, `daysInEthiopianMonth`, `addEthiopianDays`, `getEthiopianWeekday`, and `formatEthiopianDate` are missing.
- **Timezone Drift Risk**: Calendar logic uses standard `Date` objects which shift day boundaries near UTC midnight.

### 3.4 Liturgical Calendar Intelligence
- **Hard-Coded Pascha Lookup Table**: `src/lib/churchCalendar/pascha.ts` imports a static lookup table `PASCHA_GREGORIAN_ISO` from `data/paschaGregorianTable.ts`, which breaks for future unlisted years.
- **Missing Bahire Hasab Engine**: No canonical computation of Amete Alem, Medeb, Wenber, Abektie, Metqe, Nineveh, Great Lent, Hosanna, Siklet, Fasika, Ascension, Pentecost, and Apostles' Fast.

### 3.5 Recommendation Engine
- **Empty Recommendations**: `src/services/dayChurchContext.ts` hardcodes `mezmurRecommendations = []`.
- **No 4-Tier Scripture Priority**: Does not distinguish Appointed Church Readings from Feast Scripture, Seasonal Passages, and Thematic Readings.
- **No Scoring or Explanations**: Recommendations lack transparent matching rationales.

---

## 4. Implementation Plan & Order

1. **Phase 1**: Advanced Mezmur Player (Parser, Three-way display, Persistent player, Playlists, Favorites).
2. **Phase 2**: True Bible Study Reader (Parallel verse alignment, Highlights, Notes, Bookmarks, Sharing, Related resources).
3. **Phase 3**: Mathematically Accurate Ethiopian Calendar Engine (Pure JDN bidirectional engine, Leap years, Timezone protection, Round-trip tests).
4. **Phase 4**: Liturgical Intelligence & Bahire Hasab (Movable feasts/fasts, Canonical rules, Future-proof calculations).
5. **Phase 5**: Daily Bible & Mezmur Recommendation Engine (DailyFaithContext, 4-tier Scripture matching, Multi-factor scoring).
6. **Phase 6**: Unified Content Relationship Architecture (Relational models connecting Hymns, Bible, Calendar, Saints, and Prayers).
7. **Phase 7**: Redesigned Daily Faith Experience (Homepage & Calendar responsive dashboard).
8. **Phase 8**: Full Bilingual Support (Amharic and English UI parity).
9. **Phase 9**: Performance, Accessibility, and Caching.
10. **Phase 10**: CMS Content Health Dashboard.
11. **Phase 11**: Comprehensive Test Suite (Unit, integration, and round-trip tests).
12. **Phase 12**: Database Safety Verification.
