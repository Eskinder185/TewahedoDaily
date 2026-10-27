# Calendar-to-Mezmur Relationship Audit & Architecture Report

## 1. Executive Summary

This audit establishes a data-driven, deterministic, offline-capable relationship mapping between every Ethiopian Orthodox Tewahedo Church calendar card/commemoration and the published Mezmur catalog (`mezmur_public`) in TewahedoDaily.

- **Zero AI / LLM Dependencies:** All recommendations are driven by verified liturgical associations, canonical classifications, and deterministic 5-level priority scoring.
- **November 1, 2026 Regression Resolved:** The Daily Faith recommendation engine previously allowed the season of *Zemene Tsige* to monopolize all recommendations with generic Marian hymns due to broad keyword matching, completely erasing specific commemorations like the Annunciation (*Bisrate Gabriel*). The engine now implements multi-card fair distribution, guaranteeing distinct representation for each active commemoration on any given day.
- **Editorial Integrity (Zero Fake Associations):** Inspection confirmed that Archangel Uriel has exactly 0 published hymns in `mezmur_public`. Rather than fabricating an association, Uriel is strictly placed in the editorial review queue, and other active commemorations (Annunciation, Tsige Fast) receive their verified hymns.

---

## 2. Catalog & Schema Audit

### 2.1 Database Entities Inspected
| Entity | Storage Type | Total Rows | Relevant Identifier |
| :--- | :--- | :--- | :--- |
| `calendar_cards` | Table | 113 | `id` (UUID), `slug` (text) |
| `mezmur_public` | Published View | 994 | `slug` (text), `mezmur_id` |
| `calendar_card_mezmurs` | Relationship Table | 106 | `calendar_card_slug`, `mezmur_slug`, `relationship_type` |

### 2.2 Calendar Cards Classification Breakdown (113 total)
- **Monthly Commemorations (`monthly`):** 53 cards (Days 1–30 of the Ethiopian month, e.g. Lideta Maryam, Michael, Gabriel, Kidane Mihret, Uriel, Giorgis, Tekle Haymanot, Medhane Alem).
- **Annual Observances (`observance`):** 43 cards (Enkutatash, Meskel, Gena, Timket, Hosanna, Siklet, Tinsae, Erget, Paraclete, Debre Tabor, Filseta, etc.).
- **Liturgical Seasons (`season`):** 14 cards (Zemene Tsige, Great Lent, Holy Week, Paschal Season, Fifty Days, Advent/Sibket, Nolawi, Aster'eyo, etc.).
- **Fasts (`fast`):** 3 cards (Weekly Wednesday & Friday fast of salvation, Tsige Fast, Fast of Judith).

---

## 3. Root Cause Analysis: The November 1, 2026 Regression

### 3.1 The Failure Mode
On November 1, 2026 (Tikimt 22, 2019 E.C.), the active commemorations are:
1. `monthly-annunciation-monthly`: Annunciation / Bisrate Gabriel (Day 22)
2. `monthly-uriel-monthly`: Archangel Uriel (Day 22)
3. `tsige-season`: Season of Tsige (Meskerem 26 – Hidar 5)
4. `fast-tsige-fast`: Tsige Fast

The previous recommendation algorithm in `dailyFaithRecommendationEngine.ts`:
1. Queried a random `limit(120)` hymns from `mezmur_public`.
2. Checked if `seasonLower.includes('tsige')`.
3. If true, gave `score = 65` to ANY hymn where keywords or title included `"mary"`, `"mariam"`, or `"kidane"`.
4. Because the catalog has hundreds of Marian hymns, generic Marian hymns crowded out all 4 dashboard slots.
5. Annunciation hymn `absera-gebriel` was never surfaced.
6. The user was presented with 4 generic Marian hymns labeled as "Season of Tsige (Flowers) Marian hymn".

### 3.2 The Architectural Solution
1. **Canonical Relationship Dataset (`src/lib/recommendations/calendarMezmursData.ts`):**
   - 106 verified associations directly linking `calendar_card_slug` to `mezmur_slug`.
   - Each link has a defined `relationship_type`, `priority` (1–5), `reason_en`, and `reason_am`.
2. **Deterministic 5-Level Priority Engine:**
   - **Level 1 (Score 100):** Exact event commemoration (e.g. `absera-gebriel` for Bisrate Gabriel).
   - **Level 2 (Score 85):** Saint, angel, or feast match.
   - **Level 3 (Score 75):** Fasting occasion match.
   - **Level 4 (Score 65):** Liturgical season match (e.g. `akilile-tsige-mariyam` for Tsige).
   - **Level 5 (Score 50 / 20):** Thematic or general worship fallback.
3. **Multi-Card Fair Distribution Algorithm:**
   - Active commemorations are grouped by distinct calendar card.
   - Candidates are selected round-robin across distinct commemorations (Observance/Monthly first, then Fasting, then Season).
   - Annunciation receives Slot 1 (`absera-gebriel`), Tsige receives Slot 2 (`akilile-tsige-mariyam`).
   - Mezmurs are deduplicated by slug.
   - Archangel Uriel (0 catalog hymns) produces no fake recommendations.

---

## 4. Relationship Table Schema (`calendar_card_mezmurs`)

The SQL migration has been generated at:
- `supabase/migrations/20261026170000_calendar_card_mezmurs_links.sql`
- `supabase/calendar-mezmur/CALENDAR_CARD_MEZMURS_MIGRATION.sql`

```sql
CREATE TABLE IF NOT EXISTS public.calendar_card_mezmurs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  calendar_card_id UUID REFERENCES public.calendar_cards(id) ON DELETE CASCADE,
  calendar_card_slug TEXT NOT NULL,
  event_kind TEXT NOT NULL CHECK (event_kind IN ('observance', 'monthly', 'season', 'fast', 'synaxarium')),
  event_title TEXT NOT NULL,
  event_title_amharic TEXT,
  mezmur_slug TEXT NOT NULL,
  mezmur_title TEXT NOT NULL,
  mezmur_title_amharic TEXT,
  relationship_type TEXT NOT NULL CHECK (relationship_type IN ('exact_commemoration', 'saint_angel', 'feast', 'liturgical_season', 'fasting_occasion', 'thematic')),
  priority INTEGER NOT NULL DEFAULT 1 CHECK (priority >= 1 AND priority <= 5),
  reason_en TEXT NOT NULL,
  reason_am TEXT NOT NULL,
  review_status TEXT NOT NULL DEFAULT 'approved' CHECK (review_status IN ('approved', 'pending_review', 'rejected')),
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  CONSTRAINT calendar_card_mezmurs_unique_link UNIQUE (calendar_card_slug, mezmur_slug, relationship_type)
);
```

---

## 5. Coverage & Review Queue Metrics

- **Total Calendar Cards in Database:** 113
- **Cards with Verified Published Hymns:** 71 cards (62.8% coverage, with 106 verified associations)
- **Cards in Review Queue:** 42 cards (37.2%)
  - Cards for saints/apostles with zero published hymns in the existing catalog (e.g., Archangel Uriel, Apostle Thaddeus, Apostle Matthias, Apostle Silas, Abba Samuel of Waldebba, Saint Mercurius).
  - Explicitly documented in `CALENDAR_MEZMUR_REVIEW_QUEUE.csv` with editorial action items.

---

## 6. Frontend Presentation Updates

1. **Calendar Event Details Modal (`CalendarEventDetails.tsx` & `CalendarRelatedMezmurs.tsx`):**
   - Shows verified hymns with title, Amharic title, relationship badge, and bilingual reason.
   - Each row features a compact button: **"View Hymn"** (Amharic: **"መዝሙሩን ይመልከቱ"**).
   - Links internally to canonical `/practice/mezmur/:slug` route.
   - Zero nonfunctional circular audio controls or YouTube player dependencies.
2. **Admin CMS Interface (`CalendarMezmurAdmin.tsx`):**
   - Accessible at `/admin/calendar/mezmurs` and tabbed under Calendar CMS (`CALENDAR_TABS`).
   - Full statistics overview (Total links, approved, pending, card coverage).
   - Filters by approval status, priority, and text search across cards and hymns.
   - Interactive review queue and "+ Link Hymn to Card" form with optimistic state and Supabase persistence.
