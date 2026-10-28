# Mezmur browse, language, and fasting implementation

Date: 2026-10-28

## Implemented locally

- Category navigation now has five top-level cards. Repentance is nested under Prayer & Worship.
- Virgin Mary includes Kidane Mihret, Filseta, and Lideta Maryam occasion shortcuts.
- Jesus Christ & Salvation includes Hosanna, Gena, Timket, Siklet, Tinsae, Debre Tabor, and Meskel occasion shortcuts.
- Category and occasion shortcuts retain their original taxonomy type and routes.
- All category cards retain 4:3 artwork, live distinct counts, and language-aware links.
- A separate `mezmur_fasting_suitability` relationship stores evidence-reviewed general fasting suitability without misrepresenting it as a canonical feast assignment.
- The public suitability projection exposes only high-confidence, reviewed, published, nondeleted records.
- Public reads remain server-paged in 1,000-row ranges; they are not calculated from a single capped response.

## Read-only production findings

The public Supabase probe succeeded on 2026-10-28. No production writes were made.

| Browse card | Distinct published Mezmurs |
| --- | ---: |
| Jesus Christ & Salvation | 510 |
| Virgin Mary | 412 |
| Holy Trinity & Holy Spirit | 53 |
| Angels & Saints | 293 |
| Prayer & Worship | 598 |
| Holidays & Feasts | 203 |
| Fasting Seasons (specific existing occasion links) | 4 |
| Church Life & Sacraments | 66 |
| Anytime Mezmurs | 1,538 |

The public catalog contained 1,803 rows. Counts overlap by design because one Mezmur may have multiple valid relationships.

Current production language filtering returned zero grouped Tigrinya records and three Oromo records in General / Anytime (plus two with Zemari associations). This confirms that the prepared metadata correction is still required in production.

## Evidence changeset

- 172 language changes are restricted to rows marked `mismatch_confirmed` in the existing audit.
  - 131 change to Tigrinya.
  - 5 change to Oromo.
  - The remainder are confirmed Amharic or English corrections.
- Ambiguous multilingual and undetermined records are unchanged.
- 80 high-confidence fasting-suitability associations are prepared.
  - 75 currently published records would be visible through the public suitability view.
  - 1 draft has strong evidence for a specific fasting season; the migration does not publish it.
- Existing canonical occasion links identify 13 published records across the local relationship snapshot, while the current production browse count is 4. The prepared suitability table does not overwrite or manufacture occasion links.

## Production status

`supabase/migrations/20261028140000_mezmur_language_fasting_browse.sql` is generated and reviewed locally but **not applied**. The available connection is a public Supabase client, not an authorized database-administrator write session.

Apply only this migration through an authorized Supabase SQL Editor session, inspect its affected-row counts in a transaction if desired, then refresh the deployed frontend. Do not run an unrestricted `supabase db push`.
