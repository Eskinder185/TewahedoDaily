# Calendar Card Sync Fix Report

**Date:** 2026-10-19  
**Scope:** Local `TewahedoDaily` only. No production migrations, deletes, deploys, or GitHub pushes.

## Root cause

Apply was building **one UPDATE patch per card** that mixed:

1. Link repairs (`source_type` / `source_id` / `source_slug`)
2. Placeholder clears (`field = null` when card text === source text)

Placeholder clears included **`title: null`**.  
Postgres enforces **`calendar_cards.title NOT NULL`**, so the whole UPDATE failed.

That produced the observed mismatch:

| Dry-run | Apply (broken) | Explanation |
|--------|----------------|-------------|
| Links to repair: **100** | Links repaired: **0** | Link fields were in the same failed UPDATE as `title: null` |
| Placeholder fields to clear: **270** | Cleared: **270** | Counter incremented **before** the write |
| Missing cards: **14** | Created: **14** | Insert path mostly succeeded |
| Errors | `null value in column "title" … NOT NULL` | Failed examples were repair targets (e.g. `observance-gena`, `observance-filseta`) |

Design docs said title could be null for “inherit from source,” but the **live schema requires title**. Sync code followed the docs and violated the schema.

## Fixes

### Safe partial updates
- New `buildCardRepairPatch()` builds link/placeholder patches without touching images or homepage flags.
- `NEVER_NULL_CARD_FIELDS` includes `title` (and slug/status/etc.).
- Identical title↔source is a **safe no-op** (keep title); it is **not** scheduled for clear.
- `fill_missing_title` only sets title when the card title is blank, using a verified source title.

### Validation
- `resolveCreateCardTitle()` / `validateCreateCardPayload()` require a non-empty title before INSERT.
- Missing source title → classified failure, not invented copy.

### Accurate apply accounting
- Counts update **only after successful writes**.
- New fields: `operationsSkipped`, `operationsFailed`, `completeSuccess`, `recordErrors`.
- Admin UI shows “Finished With Errors” unless `completeSuccess`.

### Idempotency / preservation
- Never clears `image_*`, never resets homepage settings on survivors during merge.
- Duplicates: archive losers only (no delete).
- Manual title overrides (≠ source) remain untouched.

## Modified files

| File | Change |
|------|--------|
| `src/lib/calendar/calendarCardReconciliation.ts` | Safe patches, validation, accurate apply result |
| `src/pages/admin/CalendarAdmin.tsx` | Honest sync summary UI |
| `scripts/test-calendar-card-sync-safety.mjs` | New safety tests |
| `package.json` | `test:calendar-card-sync-safety` |
| `docs/CALENDAR_CARD_SYNC_FIX_REPORT.md` | This report |

## Test results

```
npm run test:calendar-card-sync-safety  → ok
npm run test:calendar-cards             → ok
```

Covered: image-bearing card patches, manual title preservation, missing source title, link-only repair, season/observance create payload, duplicate-safe merges (via existing suite), placeholder clear without nulling title, NOT NULL policy, idempotent empty patch, concurrent-style merge of patches.

## Placeholder cleanup intent

Clearing nullable text fields that **exactly equal** the linked source remains intentional: it marks inheritance vs override.  
**Title is no longer cleared** because the DB cannot store null titles. Keeping an identical title is correct and does not invent content.

## Safely re-run sync (local / approved env)

1. Deploy/use this code locally (or approved staging). **Do not** change production schema.
2. Admin → Calendar → **Dry run**. Expect:
   - Links to repair ≈ real link mismatches only
   - Placeholder clears **exclude** title
   - Missing cards = sources still without a non-archived linked card
3. **Apply safe fixes**.
4. Confirm `completeSuccess === true` (or review `recordErrors` if not).
5. Dry-run again: links/missing/placeholders should drop toward zero; the **14** previously created season cards should appear as linked (no recreate).
6. Spot-check cards with images and custom titles — image paths and custom titles unchanged.

## Success criteria

Do **not** treat a run as full success unless:

- `operationsFailed === 0` and `completeSuccess === true`, **or**
- Every remaining planned item is an explicit **safe no-op** (e.g. skipped title clear).

Partial failures must surface in the Admin error list.
