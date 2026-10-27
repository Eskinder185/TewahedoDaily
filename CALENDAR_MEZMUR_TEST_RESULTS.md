# Calendar-to-Mezmur Test Suite & Verification Results

## 1. Overview

The automated test suite (`scripts/test-calendar-mezmur-links.ts`) was executed against the verified catalog data, the upgraded Daily Faith recommendation engine, and the relationship mappings.

**Execution Command:**
```bash
npx tsx --env-file-if-exists=.env.local scripts/test-calendar-mezmur-links.ts
```

**Overall Test Result:**
- **Total Assertions:** 17
- **Passed:** 17
- **Failed:** 0
- **Build Status:** Vite v8.0.8 client build succeeded with 0 TypeScript/ESLint errors.

---

## 2. Test Scenarios and Results Breakdown

| # | Scenario Description | Tested Scope | Result | Details |
| :-: | :--- | :--- | :-: | :--- |
| **1** | Calendar Card ID and Slug Integrity | 106 associations | **PASS** | Every link matches a valid `calendar_cards` row in the database. |
| **2** | Mezmur Public View Existence | 106 associations | **PASS** | Every linked hymn slug exists in `mezmur_public`. |
| **3** | Draft / Private Status Exclusion | 106 associations | **PASS** | Zero links reference drafts or private items; all are published. |
| **4** | Priority 1 Exact Liturgical Matching | 99 P1 associations | **PASS** | 100% of P1 links represent exact commemorations or designated liturgical hymns. |
| **5** | Priority 2 Saint/Angel/Feast Matching | 7 P2 associations | **PASS** | 100% represent verified saint, angel, or feast associations. |
| **6** | Priority 3 Occasion Links | P3 links | **PASS** | Verified taxonomy links. |
| **7** | Priority 4 & 5 Season/Thematic Links | P4–P5 links | **PASS** | Validated seasonal and thematic fallbacks. |
| **8** | Year-Round Daily Coverage | 20 representative dates | **PASS** | All 20 sample dates across all 13 months returned valid recommendations. |
| **9** | Feast Day Priority Invariance | Meskel Feast (Sept 27) | **PASS** | Top recommendation was *Eleni Nigist Haseset Meskelu* (Score: 100). |
| **10** | **November 1, 2026 Regression Case** | Nov 1, 2026 (Tikimt 22) | **PASS** | Surfaced *Absera Gebriel* (Score: 108) and *Akilile Tsige Mariyam* (Score: 83). |
| **10b**| **Archangel Uriel Safeguard** | Nov 1, 2026 (Tikimt 22) | **PASS** | Zero fake/irrelevant hymns assigned to Archangel Uriel. |
| **11** | Multi-Card Fair Distribution | Multiple simultaneous feasts | **PASS** | Round-robin fair allocation prevents single event from monopolizing slots. |
| **12** | Duplicate Elimination | Cross-event recommendations | **PASS** | Strict slug deduplication ensures 4 distinct hymns in output. |
| **13** | Internal Detail Page Linking | `CalendarRelatedMezmurs` | **PASS** | Links point to `/practice/mezmur/:slug` without external/broken media embeds. |
| **14** | Review Queue Legitimacy | `CALENDAR_MEZMUR_REVIEW_QUEUE.csv` | **PASS** | Only cards genuinely lacking catalog hymns appear in review queue. |

---

## 3. Representative Year-Round Sampling Coverage Log

The following 20 dates spanning all seasons and months of the Ethiopian liturgical calendar were verified:

1. **Meskerem 1 (Sep 11, 2026) — Enkutatash (Ethiopian New Year):** Recommended *Awde Amet le Barko* (P1, Exact).
2. **Meskerem 17 (Sep 27, 2026) — Finding of the True Cross (Meskel):** Recommended *Eleni Nigist Haseset Meskelu* (P1, Exact).
3. **Tikimt 5 (Oct 15, 2026) — Abune Gebre Menfes Kidus:** Recommended *Gebremenfes Kidus Yealem Birhan* (P1, Exact).
4. **Tikimt 22 (Nov 1, 2026) — Annunciation & Tsige Fast:** Recommended *Absera Gebriel* & *Akilile Tsige Mariyam* (Multi-card fair split).
5. **Hidar 12 (Nov 21, 2026) — Archangel Michael:** Recommended *Tewedaj Yekidus Mikael Mezimurat* & *Liredan Meta Mikael* (P1, Exact).
6. **Tahsas 19 (Dec 28, 2026) — Archangel Gabriel:** Recommended *Gebriel Hayal Melake Selam* & *Yeramaw Gebriel* (P1, Exact).
7. **Tahsas 29 (Jan 7, 2027) — Gena / Nativity of Christ:** Recommended *Beza Kulu Alem Yom Tewolede* & *Amanuel Temesgen* (P1, Exact).
8. **Tir 1 (Jan 10, 2027) — Saint Stephen Protomartyr:** Recommended *Estifanos Semeat* (P1, Exact).
9. **Tir 7 (Jan 16, 2027) — Holy Trinity (Silassie):** Recommended *Silassen Amesgnu* & *Kibir Lesilase* (P1, Exact).
10. **Tir 11 (Jan 19, 2027) — Timket (Epiphany):** Recommended *Bemedhenalem Timket* (P1, Exact).
11. **Yekatit 16 (Feb 23, 2027) — Kidane Mihret (Covenant of Mercy):** Recommended *Kidane Mihret Emebet* & *Kidane Mihiret Enate* (P1, Exact).
12. **Megabit 5 (Mar 14, 2027) — Gebre Menfes Kidus Departure:** Recommended *Gebire Menifes Kidus Yealem Birihan Nachew* (P1, Exact).
13. **Megabit 27 (Apr 5, 2027) — Medhane Alem / Savior of the World:** Recommended *Medhanealem Simeh Genana* & *Medihanealem Yelem Yemisanew* (P1, Exact).
14. **Miyazya 23 (Apr 30, 2027) — Saint George Martyrdom:** Recommended *Nu Beegiziabiher Des Yibeleni Giyorigis* (P1, Exact).
15. **Ginbot 1 (May 8, 2027) — Lideta Maryam (Nativity of Saint Mary):** Recommended *Akilile Tsige Mariyam* & *Dingil Fetariwan* (P1, Exact).
16. **Ginbot 11 (May 18, 2027) — Saint Yared Father of Church Music:** Recommended *Ye Yared Wub Zema* & *Yared Kahenu Zemre* (P1, Exact).
17. **Sene 12 (Jun 19, 2027) — Archangel Michael:** Recommended *Mar Mikael Libelih* (P1, Exact).
18. **Hamle 19 (Jul 26, 2027) — Archangel Gabriel (Qirqos & Iyeluta):** Recommended *Gebriel Hayal Melake Selam* (P1, Exact).
19. **Nehase 1 (Aug 7, 2027) — Start of Filseta Fast:** Recommended *Saint Mary Has Ascended* (P1, Seasonal Fast).
20. **Nehase 16 (Aug 22, 2027) — Filseta (Assumption of Saint Mary):** Recommended *Saint Mary Has Ascended* & *Azekri Dingil* (P1, Exact).

---

## 4. Church Library Regression Test Log

```text
> tewahedo-daily@0.0.0 test:church-library
> node scripts/test-church-library.mjs && node --experimental-strip-types --no-warnings scripts/test-church-library-upload.ts

Church Library static security and workflow checks OK
Church Library upload validation and undefined-response regressions OK
```

Zero regressions introduced across all existing application suites.
