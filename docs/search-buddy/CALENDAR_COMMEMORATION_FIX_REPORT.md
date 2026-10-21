# Search Buddy calendar / saint commemoration fix report

**Date:** 2026-10-19  
**Scope:** Local monorepo (`TewahedoDaily` + `backend/`) and synced `tewahedo-ai` app modules. No production data, Qdrant, VM401, Cloudflare, or GitHub changes.

## Root causes

1. Next-commemoration / “when is …” date questions often reached Gemma without structured calendar math → invented Western dates (e.g. Michaelmas **September 29**) and digressions (Five Mysteries).
2. Monthly vs annual EOTC rows existed in JSON but were not projected to the first occurrence **on or after** the user’s local civil date.
3. Backend next-occurrence was Michael-only; other saints/fasts fell through to the LLM.
4. Missing subject still allowed `/api/chat` invention instead of an honest abstention.
5. Eth→Greg bridge used a **400-day** scan and missed leap **Pagumen 6**.
6. Sene 12 Michael feast was absent from `angels.json`.

## Behavior now

1. Detect next/upcoming feast·fast·commemoration·saint questions (EN + Amharic).
2. Civil “today” from user timezone (fallback **Africa/Addis_Ababa**).
3. Beyene–Kudlek conversion shared by FE UI and BE (`ethiopianDate.ts` / `ethiopian_calendar.py`).
4. Primary source: `src/data/eotc_calendar_json` (monthly, angels, saints, mary, fixed feasts, fasts).
5. “Next” = first occurrence **on or after** reference date; monthly vs annual vs fast-start labeled separately.
6. Saint Michael: monthly day **12** + Hidar 12 + Sene 12.
7. Verified payload returned directly (FE + BE early return). If chat still runs, structured facts are injected and must be preserved.
8. Answer-first, same language as the user; no greeting lead on verified calendar AI cards.
9. No Mysteries digression on date questions.
10. Unknown subject / no dataset match → **abstain** (“will not guess”), never invent.

## Key files

| Path | Role |
|------|------|
| `src/lib/eotcCalendar/nextCommemoration.ts` | FE next-occurrence + abstention |
| `src/lib/searchBuddy/calendarStructuredSearch.ts` | `calendar_next_occurrence` route |
| `src/lib/eotcCalendar/ethiopianGregorianBridge.ts` | 450-day Eth→Greg scan |
| `src/data/eotc_calendar_json/angels.json` | + `saint-michael-sene-12` |
| `backend/app/ethiopian_calendar.py` | BE conversion + dataset loader + chat early return |
| `backend/app/main.py` | Verified next intercept + prompt guard |
| `backend/app/chat_intelligence.py` | WHEN-focus calendar fact rules |
| `scripts/test-next-commemoration.mjs` | FE regressions |
| `backend/tests/test_ethiopian_calendar.py` | BE regressions |

## Date-conversion results (reference: 2026-10-19)

| Fact | Result |
|------|--------|
| Ethiopian today | Tikimt 9, 2019 E.C. |
| Next monthly Michael | **Tikimt 12, 2019 E.C. — 2026-10-22** |
| Next major annual | **Hidar 12, 2019 E.C. — 2026-11-21** |
| Also recorded | **Sene 12, 2019 E.C.** |
| New Year | 2026-09-10 = Pagumen 5, 2018; 2026-09-11 = Meskerem 1, 2019 |
| Leap Pagumen 6 | 2019-13-6 = **2027-09-11** |

FE and BE agree. On Michael’s day itself (2026-10-22), “next monthly” remains that day (on-or-after).

## Test results

| Suite | Result |
|-------|--------|
| `npm run test:next-commemoration` | **ok** (Michael EN/AM, Gabriel, Prophets fast, abstention, NY, Pagume, on-or-after) |
| `npm run test:calendar-intent-routing` (heuristics + live calendar) | heuristics **ok**; live cases exercise today/tomorrow/feast APIs |
| `backend` / `tewahedo-ai` `test_ethiopian_calendar.py` | **12 passed** |
| Full `TewahedoDaily/backend` pytest | **168 passed**, 6 skipped |
| Full `tewahedo-ai` pytest | run after sync; calendar module tests **12 passed** |

## Remaining (local / editorial — no deploy)

1. Synaxarium editorial review of `saint-michael-sene-12` copy status.
2. Optional: extend movable/paschal “next” (beyond fixed + monthly + season-start).
3. Optional: consolidate duplicate JDN helpers still inlined in `main.py`.
4. Live UX smoke in the browser with the user’s timezone.
5. No deploy / push / Qdrant / VM401 / Cloudflare without approval.
