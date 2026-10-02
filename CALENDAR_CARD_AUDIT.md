# Calendar Card Audit — Tewahedo Daily

**Date:** 2026-10-02  
**Scope:** Technical audit + targeted fixes for Calendar Card image / identity reliability.  
**Rule:** Structured calendar source → **one canonical** `calendar_cards` row → **one presentation image** → same card on Calendar + Homepage.

---

## Current architecture

```
Structured sources (observances / monthly / fasts / seasons)
        ↓  (identity + date rules — never duplicated onto card for calculation)
public.calendar_cards  (presentation: image_*, homepage flags, optional text overrides)
        ↓
resolveCalendarCardForSource  (calendarCardLookup.ts)
        ↓
resolveCalendarEventPresentation
        ↓
getCalendarEventsForDate / Range / getHomepageTodayEvents
        ↓
CalendarEventCard  +  HomeTodayInChurchPreview
```

Admin CMS: `CalendarAdmin.tsx` + `calendarAdminService.ts` + Sync via `calendarCardReconciliation.ts`.  
Images: Supabase Storage bucket `content-media`; DB stores relative `image_path`.

---

## Database schema (`calendar_cards`)

Relevant columns (from migrations + app types):

| Column | Role |
| --- | --- |
| `id` | Canonical edit key |
| `slug` | Card slug |
| `source_type` | `manual` \| `observance` \| `monthly_commemoration` \| `fast` \| `season` (+ legacy synax types) |
| `source_id` / `source_slug` | Link to structured source |
| `title` / `title_amharic` | Optional overrides (null = inherit) |
| `image_path` / `image_alt` / `image_position` | **Card-owned presentation image** |
| `status` | draft / published / archived — **public only sees published** |
| `featured`, `show_on_home`, `home_featured`, `home_sort_order` | Display / homepage ordering |
| `ethiopian_month_number`, `ethiopian_day`, `is_monthly` | Manual cards / denormalized hints |
| Educational text fields | Optional overrides |

**Integrity:** unique index `(source_type, source_id)` for non-manual, non-archived (`20261002140000_calendar_cards_unique_source.sql`).

---

## Current resolver paths

| Consumer | Entry | Card match |
| --- | --- | --- |
| Calendar timeline | `getCalendarEventsForRange` | `resolveCalendarEventPresentation` → `resolveCalendarCardForSource` |
| Homepage Today | `getHomepageTodayEvents` | **Same** presentation stack |
| Admin preview | `resolveCalendarCard` + linked source | Same lookup for identity |
| Sync | `calendarCardReconciliation` | Parallel scoring for merge; runtime UI uses lookup |

**Canonical lookup:** `src/lib/calendar/calendarCardLookup.ts`  
Order: `source_type+source_id` → `source_type+source_slug` → none. Never title/date/index.

---

## Live environment probe (anon key, local `.env`)

| Check | Result |
| --- | --- |
| `calendar_cards` visible to anon | **0 rows** (`content-range */0`) |
| `orthodox_observances` | Present (~84) |

**Implication:** Public Calendar cannot attach presentation images if there are zero **published** cards. Admin (staff RLS) may still see draft/private rows. This is a primary root cause of public **Needs Image** while Admin appears to have art.

Counts of duplicates / orphans / image coverage require a **staff-authenticated** audit (`scripts/audit-calendar-cards-live.mjs` recovers 0 under anon). Run Sync + ensure status=`published`, then re-probe.

---

## Root causes (ranked)

1. **Published visibility gap** — Public loaders only fetch `status=published`. Draft cards with images show as Needs Image on the live site.
2. **Suggested `image_path` without upload** (fixed) — Relinking a source could write a *suggested* storage path into the form/DB without an uploaded object → Admin “Has Image” / broken public asset confusion.
3. **Client-only Needs Image filter on a page of 48** (fixed) — Filtering `image=needs` only on the current page made the list lie about global missing images.
4. **Source-image borrow in presentation** (fixed) — `resolveCalendarImage` could use structured-source `imagePath` when the card lacked one, diverging from Admin’s card-only `image_path` check.
5. **Editing friction / wrong-card fear** — Full editor mixed source relinking with image work; mitigated with **Add/Change Image** modal bound to exact `calendar_cards.id`.
6. **30s module card cache** — After save, `invalidateCalendarCardsCache()` runs; visibility refresh also reloads. Stale bytes still possible if Storage path is reused (mitigated with unique upload filenames).
7. **Historical duplicates** — Unique index exists; Sync merges leftovers. Staff audit still required after Sync.

---

## Caching architecture

| Layer | Behavior |
| --- | --- |
| `cardsCache` in `getCalendarEventsForDate.ts` | 30s TTL; cleared by `invalidateCalendarCardsCache` on Admin save/sync |
| React Query | Not used for cards |
| Storage/CDN | Unique filenames (`stem-<uuid>.webp`) recommended on upload |

---

## Storage architecture

- Bucket: `content-media`
- Preferred paths: `calendar/<category>/<subject>-<unique>.webp`
- Optimization: MediaPicker `convertToWebp`; target ~1200×900 WebP for ordinary cards
- Do not overwrite the same object URL when replacing art

---

## Recommended target architecture (status)

| Item | Status |
| --- | --- |
| One resolver for Calendar + Homepage | **In place** (`resolveCalendarEventPresentation`) |
| Card-only presentation image | **Enforced** (no source borrow) |
| Exact-ID image save + DB refetch verify | **`saveCalendarCardImage`** |
| Quick Admin image workflow | **List → Add/Change Image modal** |
| Sync preserves images / idempotent | **Already designed**; UI shows counts |
| Unique source index | **Already migrated** |
| Staff live data health dashboard | Follow-up (anon cannot count drafts) |

---

## Changes implemented (this pass)

- Quick image modal + server-side Needs/Has image filters + filter chips (Problems, Draft, …)
- `saveCalendarCardImage(cardId, …)` with post-save refetch verification
- Stop auto-writing suggested `image_path` on source link
- Unique suggested upload paths
- Presentation: ignore structured-source image fallback
- Docs: this file + `CALENDAR_IMAGE_WORKFLOW.md`
- Tests: source art alone does not satisfy image presence

---

## Remaining issues / follow-up

1. Authenticated live audit of card counts, Bisrate Gabriel, Demera (anon sees 0 cards).
2. Publish all intentional presentation cards after Sync if still draft.
3. Optional: eliminate CalendarPage double-fetch of published cards on first paint.
4. Decide whether Homepage should also respect `show_on_home` (today = all of today’s occurrences).
5. Do not mass-delete cards; merge duplicates via Sync dry-run first.

---

## Dependency map (short)

1. Admin load: `listCalendarCards` / `getCalendarCard`  
2. Admin update: `saveCalendarCard` / `saveCalendarCardImage`  
3. Uploads: `MediaPicker` → `uploadContentMedia`  
4. `image_path` save: exact `id` update + refetch  
5. Calendar resolve: `getCalendarEventsFor*` → presentation  
6. Homepage resolve: `getHomepageTodayEvents` → **same** presentation  
7. Multiple resolvers historically: consolidated on `calendarCardLookup`  
8. Static fallbacks: not used for event cards (neutral Needs Image frame)  
9. Separate queries: same card cache path; Admin separate  
10. Matching: single `resolveCalendarCardForSource`
