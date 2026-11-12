# Suggestion: more figures and seasons, and a Werb card

## What was found
- **Abune Gebre Menfes Kidus** was already a category in the code *and* in the live `categories` table, and it appears in the Mezmur editor's Categories list. The admin Bulk Management category list, however, only showed slugs already in the database, so the picker looked shorter than the full list. It now lists every canonical category by name.
- **Tsige** did not exist anywhere (not in the code, not in the live `mezmur_occasions` table), and neither did most other important figures or seasons.
- **Werb:** 17 hymns are stored with the spelling `wereb` and 2 with `werb`; the editor, search and labels each handled only one of them. There was no way for a reader to see only werbs.

## What this change does
- **New categories (important figures):** Saint Peter, Saint Paul, John the Evangelist, Saint Mark, Abune Aregawi, Lalibela, Kidist Arsema, Kidus Merkorios, Saint Theodore, the Nine Saints. They sit in *Angels & Saints*.
- **New occasions (seasons):** Tsige (flower season / fast), Tsome Gehad, Hidar Tsion / Tsion Maryam.
- Each has Amharic, English and transliterated search names, so "ጽጌ", "tsome tsige", "saint paul" or "አቡነ አረጋዊ" all find the right entry.
- **Editor and bulk pickers:** an entry whose database row does not exist yet is shown as "not set up yet" and cannot be chosen, so a save never fails with an unexplained error.
- **Werb card:** a prominent card at the top of the Mezmur Library. It shows only werbs (every stored spelling counts), says so, and has a "Show all hymns" button. The Mezmur / Werb choice in the editor now reads either spelling.

## What still needs a person
- **Run `docs/ai/proposals/mezmur-taxonomy-additions-2026-11-13.sql`** in Supabase to create the new rows (additive, idempotent, rolls back if anything is missing). Until then the new entries appear in the pickers as "not set up yet". It was checked twice on a scratch PostgreSQL 17 with stand-in tables, not on the live schema.
- Please confirm the spellings and the list with someone who knows the calendar. In particular whether Tsige should be called a fast or a season, and whether other saints or feasts should be added (the list is one array in `src/lib/mezmur/taxonomyAliases.ts`).

## Not done
- No hymns were re-categorized. Existing classifications are untouched.
- "Other forms" beyond werb: the data only has Mezmur and Werb today. The card is named for werb; a third form would need a database change.
